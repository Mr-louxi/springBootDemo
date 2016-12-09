package springBootDemo.entity;

import org.springframework.stereotype.Component;

//@Component
public class TestStu {
	public String tableName="TEST_STU";
	private String stuid;
	private String stuname;
	private String stuage;
	private String checknum;
	public String getStuid() {
		return stuid;
	}
	public void setStuid(String stuid) {
		this.stuid = stuid;
	}
	public String getStuname() {
		return stuname;
	}
	public void setStuname(String stuname) {
		this.stuname = stuname;
	}
	public String getStuage() {
		return stuage;
	}
	public void setStuage(String stuage) {
		this.stuage = stuage;
	}
	public String getChecknum() {
		return checknum;
	}
	public void setChecknum(String checknum) {
		this.checknum = checknum;
	}
	
}
