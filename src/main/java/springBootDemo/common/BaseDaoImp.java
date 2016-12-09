package springBootDemo.common;

import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.sql.DataSource;

import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ConnectionCallback;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcDaoSupport;
import org.springframework.util.ObjectUtils;


public class BaseDaoImp<T> extends NamedParameterJdbcDaoSupport implements BaseDao<T>{
	public Logger logger = LoggerFactory.getLogger(getClass());
	/**
	 * 实体类的类型
	 */
	private Class<T> entityClass;
	/**
	 * 表名
	 */
	private String tableName;
	/**
	 * 主键  支持联合主键
	 */
	private List<String> primaryKey = new ArrayList<String>(); 
	/**
	 * 非主键字段
	 */
	private List<String> columns = new ArrayList<String>();
	 private Map<String, PropertyDescriptor> mappedFields;
	/**
	 * 确定 这个泛型 对应的表名----如果不用jpa  那么表名就应该在每个entity 中标记出来
	 * 1.确定泛型 的具体类型
	 * 2.获取字段
	 * 3.获取表名
	 * 4.讲字段装载到 mappedFields中
	 */
	public BaseDaoImp(){
		 //确定泛型 的具体类型
		//genType------------ springBootDemo.common.CommonDaoImp<springBootDemo.entity.TestStu>
		Type genType = getClass().getGenericSuperclass();
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		entityClass = (Class)params[0];
		//param[0]------ class springBootDemo.entity.TestStu
		logger.info("genType:"+genType);
		logger.info("param[0]:"+params[0]);
		Field[] fields = entityClass.getDeclaredFields();
		for(Field field:fields){
			if("tableName".equalsIgnoreCase(field.getName())){
				try {
					tableName = (String) field.get(entityClass.newInstance());
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} catch (InstantiationException e) {
					e.printStackTrace();
				}
			}
		}
		PropertyDescriptor[] pds = BeanUtils.getPropertyDescriptors(entityClass);
        mappedFields = new HashMap<String, PropertyDescriptor>();
        for (int i = 0; i < pds.length; i++) {
            PropertyDescriptor pd = pds[i];
            mappedFields.put(pd.getName(), pd);
        }
        logger.info("mappedFields:"+mappedFields);
	}
	
	/**
	 * 在构造器中 已经知道 表名和所有字段了  这里只需要 知道 主键  我们就可以进行统一的增删改查
	 * 1.要确定数据源 这里最好指定数据源
	 * 2.确定主键
	 * @param dataSource  ---datasource
	 */
	@Autowired
	public void inject(DataSource dataSource){
		//设置数据源
		super.setDataSource(dataSource);
		//查询数据库 得到该表的主键
		this.getJdbcTemplate().execute(new ConnectionCallback<Object>(){
			@Override
			public Object doInConnection(Connection con) throws SQLException, DataAccessException {
				List<String> columnList = new ArrayList<String>();//所有字段
				List<String> keyList = new ArrayList<String>();//主键字段
				ResultSet rs;
				DatabaseMetaData dmd = con.getMetaData();
				//查询所有字段
				rs = dmd.getColumns(null, null, tableName, null);
				while(rs.next()){
					logger.info("所有字段");
					logger.info("rs1:"+rs.getString(1));//null
					logger.info("rs2:"+rs.getString(2));//表空间
					logger.info("rs3:"+rs.getString(3));//表名
					logger.info("rs4:"+rs.getString(4));//字段名
					columnList.add(rs.getString(4));
				}
				
				rs = dmd.getPrimaryKeys(null, null, tableName);
				while(rs.next()){
					logger.info("主键");
					logger.info("rs1:"+rs.getString(1));//null
					logger.info("rs2:"+rs.getString(2));//表空间
					logger.info("rs3:"+rs.getString(3));//表名
					logger.info("rs4:"+rs.getString(4));//字段名
					keyList.add(rs.getString(4));
				}
				rs.close();
				for(String col:columnList){
					if(keyList.contains(col)){
						primaryKey.add(col);
					}else{
						columns.add(col);
					}
				}
				return null;
			} 
			
		});
	}
	
	
	
	@Override
	public T getById(Object id) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List getAll() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Object add(Object entity) {
		if(ObjectUtils.isEmpty(entity)){
			logger.info("无记录插入"+entity);
			return null;
		}
		List<String> totalCol = (List<String>) CollectionUtils.union(primaryKey, columns);//合并主键和非主键  得到所有字段
		String[] cols = totalCol.toArray(new String[totalCol.size()]);
		logger.info(tableName+"表 包含的列有:"+StringUtils.join(cols, ","));
		String sql = "insert into "+tableName+" ("+StringUtils.join(cols, ",")+")"+" values(:"+StringUtils.join(cols, ",:")+")";
		Map<String,Object> param = new HashMap<String,Object>();
		for(int i=0;i<cols.length;i++){
			String col = cols[i];
			Object fieldValue = getFieldValueByColumnNameAndEntity(col,entity);
			param.put(col, fieldValue);
		}
		logger.info("insert sql:"+sql);
		this.getNamedParameterJdbcTemplate().update(sql, param);
		return entity;
	}
	private Object getFieldValueByColumnNameAndEntity(String columnName, Object entity) {
		PropertyDescriptor pd = mappedFields.get(columnName);
        Object value = null;
        if (pd == null) {
//            String fieldName = SpellUtils.toCamelCase(columnName);
        	 String fieldName = columnName.toLowerCase();
            pd = mappedFields.get(fieldName);
            Method getter = pd.getReadMethod();
            try {
                value = getter.invoke(entity);
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            } catch (InvocationTargetException e) {
                e.printStackTrace();
            }
        }
        return value;
	}

	@Override
	public int update(Object entity) {
		return 0;
	}
	@Override
	public int delete(Object entity) {
		return 0;
	}
	@Override
	public int deleteById(Object id) {
		return 0;
	}

}
