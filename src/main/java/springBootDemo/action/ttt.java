package springBootDemo.action;

import org.eclipse.jdt.internal.compiler.batch.Main;

import springBootDemo.entity.TestStu;

public class ttt extends Object {
	public static void main(String[] args)  {
		try {
			System.out.println("f1:"+f1());
		} catch (Exception e) {
//			System.out.println("toString:"+e.toString());
			System.out.println("message:"+e.getMessage());
		}
		/*String name = "";
		for (int i = 1; i < name.length(); i++) {
			String s = name.substring(i, i + 1);
			String slc = lowerCaseName(s);
			if (!s.equals(slc)) {
				result.append("_").append(slc);
			}
			else {
				result.append(s);
			}
		}*/
		System.out.println("as".equalsIgnoreCase("as"));
	}
	public  static int f1() throws Exception{
		try {
			return 1;
		} finally {
			System.out.println("finally");
			return 2;
		}
	}
}
