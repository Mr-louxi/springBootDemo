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
  var defaultData = [ 
	    { 
	        text: 'Parent 1', 
	        href: '#parent1', 
	        tags: ['4'], 
	        nodes: [ 
	            { 
	                text: 'Child 1', 
	                href: '#child1', 
	                tags: ['2'], 
	                nodes: [ 
	                    { 
	                        text: 'Grandchild 1', 
	                        href: '#grandchild1', 
	                        tags: ['0'] 
	                    }, 
	                    { 
	                        text: 'Grandchild 2', 
	                        href: '#grandchild2', 
	                        tags: ['0'] 
	                    } 
	                ] 
	            }, 
	            { 
	                text: 'Child 2', 
	                href: '#child2', 
	                tags: ['0'] 
	            } 
	        ] 
	    }, 
	    { 
	        text: 'Parent 2', 
	        href: '#parent2', 
	        tags: ['0'] 
	    }, 
	    { 
	        text: 'Parent 3', 
	        href: '#parent3', 
	        tags: ['0'] 
	    }, 
	    { 
	        text: 'Parent 4', 
	        href: '#parent4', 
	        tags: ['0'] 
	    }, 
	    { 
	        text: 'Parent 5', 
	        href: '#parent5', 
	        tags: ['0'] 
	    } 
	];
	$(function(){
	  //初始化树形结构列表
	  $('#treeview-checkable').treeview({
	   data: defaultData,
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
	<div id="treeview-checkable"></div>
</body>
</html>