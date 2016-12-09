package springBootDemo.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import springBootDemo.common.BaseDaoImp;
import springBootDemo.entity.TestStu;

@Component
public class TestStuDao extends BaseDaoImp<TestStu>{
	Logger log = LoggerFactory.getLogger(getClass());
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List getAllRecord(){
		String sql = "select * from TEST_STU";
		List<TestStu> l = jdbcTemplate.query(sql,BeanPropertyRowMapper.newInstance(TestStu.class) );
		log.info("ok");
		return l;
	}
}
