package springBootDemo.action;


import java.util.List;

import org.joda.time.DateTime;
import org.joda.time.DateTime.Property;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import springBootDemo.entity.TestStu;
import springBootDemo.services.TestStuService;

@RestController
public class webController {
	protected static Logger log = LoggerFactory.getLogger(webController.class);
	@Autowired
	public TestStuService testStuService;
	@RequestMapping("/")  
    String home() {  
		log.info("Info Hello");
		log.debug("Debuger Hello");
		log.error("Error Hello");
		log.trace("Trace Hello");
		log.warn("Warn Hello");
		log.info("开始调用jdbcTemplate");
		List l = testStuService.getAll();
		log.info("list:"+l);
       return "Hello World!";  
    }  
	@RequestMapping("/add")  
    String add() { 
		TestStu ts = new TestStu();
		ts.setChecknum("");
		ts.setStuage("19");
		ts.setStuid("2");
		ts.setStuname("李四");
		testStuService.add(ts);
		return "add";
	}
	
	public static void main(String[] args) {
		DateTime dt = new DateTime();
		Property day = dt.dayOfYear();
		System.out.println("Property:"+day);
		System.out.println("day:"+dt.toString("yyyy-MM-dd"));
	}
}
