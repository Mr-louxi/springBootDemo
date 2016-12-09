<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<!-- 在IE运行最新的渲染模式 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- 网页在 浏览器中显示时  都是放在viewport中展示 -->
	<!-- 初始化移动浏览器的显示  width=device-width  设置viewport的宽度等于设备的宽度   initial-scale=1 控制页面第一次载入时缩放的比例 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<title>欢迎</title>
	<p>表单例子</p>
</head>
<body>
	<form role="form">
  		<div class="form-group">
    		<label for="exampleInputEmail1">邮箱：</label>
   		    <input type="email" class="form-control" id="exampleInputEmail1" placeholder="请输入您的邮箱地址">
 		</div>
  	<div class="form-group">
    	<label for="exampleInputPassword1">密码</label>
    	<input type="password" class="form-control" id="exampleInputPassword1" placeholder="请输入您的邮箱密码">
  	</div>
  	<div class="checkbox">
	    <label>
	      <input type="checkbox"> 记住密码
	    </label>
  	</div>
  	<button type="submit" class="btn btn-default">进入邮箱</button>
	</form>	
        
    <!-- 如果要使用Bootstrap的js插件，必须先调入jQuery -->   
    <script src="jquery/jquery-1.11.3.min.js"></script>
    <script src="bootstrap/js/bootstrap.min.js"></script> 
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script type="text/javascript">
    	$(function(){
    		alert(1);
    	});
    </script>
    
</body>
</html>