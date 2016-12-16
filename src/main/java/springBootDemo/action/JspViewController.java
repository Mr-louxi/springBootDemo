package springBootDemo.action;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JspViewController {
	@RequestMapping("/index")
	public String index(){
		return "index";
	}
	@RequestMapping("/test1")
	public String test1(){
		return "test1";
	}
	@RequestMapping("/form")
	public String form(){
		return "form";
	}
	@RequestMapping("/tree")
	public String tree(){
		return "tree";
	}
	@RequestMapping("/treeBox")
	public String treeBox(){
		return "treeBox";
	}
	@RequestMapping("/demo")
	public String demo(){
		return "demo";
	}
}
