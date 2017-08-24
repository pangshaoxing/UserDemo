<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>用户注册</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	//注册用户名判断
	$(function() {
		$("#userName").blur(function() {
			var userName = $("#userName").val();
			var len = $("#userName").val().length;
			if (len == 0) {
				$("#userNameError").html("删除用户不能为空！");
				$("#regFrm").attr("onsubmit", "return false");
			}
			if (len >= 6) {
				var user = {"userName":userName};
				$.ajax({  
	                   type: "GET",  
	                   async:true,  
	                   url: "userJudge.action",    //必须是后台的静态方法  
	                   contentType: "application/json; charset=utf-8",  
	                   dataType: "json",  
	                   //  data: "name=John&location=Boston",  
	                   data:user,  
	                   success: function (data) {  
	                	   if(data!=null){
	    						//alert("该用户已注册，请重新输入！！");
	    						$("#userNameError").html("该用户已注册！");
	    						$("#regFrm").attr("onsubmit","return false");
	    					}else{
	    						$("#userNameError").html("注册用户格式正确！");
	    						$("#regFrm").attr("onsubmit", "return true");
	    					}
	                   }                
	               });  
			}
		})
	})
	
	function check(){  
	     fr=document.reg;  
	     if(fr.userName.value==""){  
	    	$("#userNameError").html("删除用户不能为空！");
	        fr.userName.focus();  
	        return false;  
	     }  
	     if(fr.userName.value.length>=6){
	    	 var userName = fr.userName.value;
	    	 var user = {"userName":userName};
				$.ajax({  
	                   type: "GET",  
	                   async:true,  
	                   url: "userJudge.action",    //必须是后台的静态方法  
	                   contentType: "application/json; charset=utf-8",  
	                   dataType: "json",  
	                   //  data: "name=John&location=Boston",  
	                   data:user,  
	                   success: function (data) {  
	                	   if(data!=null){
	    						fr.userName.focus();
	    						$("#userNameError").html("该用户已注册！");
	    						return false;
	    					}else{
	    						$("#userNameError").html("注册用户格式正确！");
	    					}
	                   }                
	               });  
	     }
	     
	    fr.submit();
	}
</script>
<body>
	<div class="page-container">
		<h1>用户删除</h1>
		<form name="reg" id="regFrm" action="userDelete.action" method="post" onsubmit="">
			用户名：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userName" id="userName">
			<span style="color: red;" id="userNameError"></span><br /> 
			<button type="submit" class="submit_button" onclick="return check();">确认</button>
		</form>
	</div>
</body>
</html>
