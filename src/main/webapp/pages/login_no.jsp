<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.3.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>用户登录失败</title>
</head>
<script type="text/javascript">
	$(function(){
		$("#userName").blur(function(){
			var length = $("#userName").val().length;
			if(length==0){
				$("#userNameError").html("用户不能为空！");
				$("#loginFrm").attr("onsubmit","return false");
			}else{
				$("#userNameError").html("");
				$("#loginFrm").attr("onsubmit","return true");
			}
		});
	});
	
	$(function(){
		$("#passWord").blur(function(){
			var length = $("#passWord").val().length;
			if(length==0){
				$("#pwdError").html("密码不能为空！");
				$("#loginFrm").attr("onsubmit","return false");
			}else{
				$("#pwdError").html("");
				$("#loginFrm").attr("onsubmit","return true");
			}
		});
	});
	
	function check(){
		fr = document.form1;
		if(fr.userName.value.length==0){
			$("#userNameError").html("用户不能为空！");
			fr.userName.focus();
			return false;
		}
		if(fr.passWord.value.length==0){
			fr.passWord.focus();
			$("#pwdError").html("密码不能为空！");
			return false;
		}
		
		fr.submit();
	}
</script>
<body>
<span>用户名或者密码错误！</span>
<div class="page-container">
            <h1>登录</h1>
            <form name="form1" id="loginFrm" action="<%=basePath%>userLogin.action" method="post" onsubmit="">
              	用户名:<input type="text" name="userName" id="userName">
             	 <span style="color: red;" id="userNameError"></span><br>
            	密&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password" name="passWord" id="passWord" >
            	<span style="color: red;" id="pwdError"></span><br>
                <button type="submit" class="submit_button" onclick="return check()">登录</button>
            </form>
			<br><br><br>
			<h2><a href="pages/register.jsp">注册</a></h2>
        </div>
</body>
</html>