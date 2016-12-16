<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="bootstrap/css/bootstrap-treeview.css">
  <script src="jquery/jquery-1.11.3.min.js"></script>
  <script src="bootstrap/js/bootstrap.min.js"></script> 
  <script src="bootstrap/js/bootstrap-treeview.js"></script> 
  <script type="text/javascript">
//获取树形结构列表数据
     function getTree() {
      var tree = [{
        text: "Node 1",
		icon: "glyphicon glyphicon-stop",
		selectedIcon: "glyphicon glyphicon-stop",
		color: "#000000",
		backColor: "#FFFFFF",
	    href: "#node-1",
		selectable: true,
		state: {
		    checked: true,
		    disabled: true,
		    expanded: true,
		    selected: true
		  },
       nodes: [{
        text: "Child 1",
        nodes: [{
         text: "Grandchild 1"
        }, {
         text: "Grandchild 2"
        }]
       }, {
        text: "Child 2"
       }]
      }, {
       text: "Parent 2"
      }, {
       text: "Parent 3"
      }, {
       text: "Parent 4"
      }, {
       text: "Parent 5"
      }];
      return tree;
	 
     }
	$(function(){
	  //初始化树形结构列表
	  $('#tree').treeview({
	   data: getTree(),
	   showIcon: false, 
	   showCheckbox: true,
	   onNodeChecked: function(event, node) { 
	        $('#checkable-output').prepend('<p>' + node.text + ' was checked</p>'); 
	    },
	    onNodeUnchecked: function(event, node) { 
	        $('#checkable-output').prepend('<p>' + node.text + ' was unchecked</p>'); 
	    } 
	  });
	});
	
  </script>
<title>Insert title here</title>
</head>
<body>
	<div id="tree"></div>
</body>
</html>