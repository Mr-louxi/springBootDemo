package springBootDemo.common;

import java.util.List;

import springBootDemo.entity.TestStu;
/**
 * 
 * @author lx 2016/12/08.
 *
 */
public interface BaseDao<T> {
	 T  getById(Object id);
	 List<T> getAll();
	 T add(T entity);
	 int update(T entity);
	 int delete(T entity);
	 int deleteById(Object id);
}
