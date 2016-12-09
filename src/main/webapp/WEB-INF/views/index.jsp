<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
	<!-- 在IE运行最新的渲染模式 -->
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- 网页在 浏览器中显示时  都是放在viewport中展示 -->
	<!-- 初始化移动浏览器的显示  width=device-width  设置viewport的宽度等于设备的宽度   initial-scale=1 控制页面第一次载入时缩放的比例 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<!-- 下面 是判断 当前浏览器内核  如果低于IE 9  就会加载里面的js文件  如果高于 则忽略 -->
	<!--[if lt IE 9]>
      <script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	<title>欢迎</title>
	<p>这是一个JSP</p>
</head>
<body>
	<!--Bootstrap中的标题-->
	<!--Bootstrap中使用了<small>标签来制作副标题-->
	<h1>Bootstrap标题一<small>我是副标题</small></h1>
	<h2>Bootstrap标题二<small>我是副标题</small></h2>
	<h3>Bootstrap标题三<small>我是副标题</small></h3>
	<h4>Bootstrap标题四<small>我是副标题</small></h4>
	<h5>Bootstrap标题五<small>我是副标题</small></h5>
	<h6>Bootstrap标题六<small>我是副标题</small></h6>
	<!--Bootstrap中让非标题元素和标题使用相同的样式-->
	<div class="h1">Bootstrap标题一</div>
	<div class="h2">Bootstrap标题二</div>
	<div class="h3">Bootstrap标题三</div>
	<div class="h4">Bootstrap标题四</div>
	<div class="h5">Bootstrap标题五</div>
	<div class="h6">Bootstrap标题六</div>
	
	<div class="table-responsive">
  	 <table class="table table-bordered">
		<thead>
	     <tr>
	       <th>表格标题</th>
	       <th>表格标题</th>
	       <th>表格标题</th>
	     </tr>
	   </thead>
	   <tbody>
	     <tr>
	       <td>表格单元格</td>
	       <td>表格单元格</td>
	       <td>表格单元格</td>
	     </tr>
	    </tbody>
	  </table> 
	  </div>
    <div class="page-header">
        <h1>表格</h1>
     </div>
    <div class="col-md-6">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>#</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Username</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>1</td>
                <td>Mark</td>
                <td>Otto</td>
                <td>@mdo</td>
              </tr>
              <tr>
                <td>2</td>
                <td>Jacob</td>
                <td>Thornton</td>
                <td>@fat</td>
              </tr>
              <tr>
                <td>3</td>
                <td>Larry</td>
                <td>the Bird</td>
                <td>@twitter</td>
              </tr>
            </tbody>
          </table>
        </div>
        
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