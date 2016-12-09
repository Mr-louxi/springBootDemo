package springBootDemo.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import springBootDemo.dao.TestStuDao;
import springBootDemo.entity.TestStu;

@Service
public class TestStuService {
	@Autowired
	public TestStuDao testStuDao;
	
	public List getAll(){
		return testStuDao.getAllRecord();
	}
	
	public void add(TestStu ts){
		testStuDao.add(ts);
	}
	
}
