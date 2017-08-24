<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="<%=basePath%>/css/style.css" />
<script type="text/javascript" src="<%=basePath%>/js/jquery-1.8.3.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>用户登录界面</title>
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
	
	var code; //在全局 定义验证码     
	function createCode() {  
	    code = "";  
	    var codeLength = 4;//验证码的长度     
	    var checkCode = document.getElementById("checkCode");  
	    var selectChar = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');//所有候选组成验证码的字符，当然也可以用中文的     
	   
	    for (var i = 0; i < codeLength; i++) {  
	        var charIndex = Math.floor(Math.random() * 36);  
	        code += selectChar[charIndex];  
	    }  
	    //alert(code);  
	    if (checkCode) {  
	        checkCode.className = "code";  
	        checkCode.value = code;  
	    }  
	} 
	
	function clean(){
		document.getElementById("randomCode").value="";
	}
	
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
		
		 var inputCode = document.getElementById("randomCode").value;  
		    if (inputCode.length <= 0) {  
		        alert("请输入验证码！");  
		        createCode();//刷新验证码  
		        clean();
		        return false;  
		    } else if (inputCode.toLowerCase() != code.toLowerCase()) {  
		        alert("验证码输入错误！");  
		        createCode();//刷新验证码
				clean();
		        return false;  
		    }
		
		fr.submit();
	}
</script>
<body onload="createCode()">
<div class="page-container">
            <h1>登录</h1>
            <form name="form1" id="loginFrm" action="<%=basePath%>userLogin.action" method="post" onsubmit="">
              	用户名:<input type="text" name="userName" id="userName">
             	 <span style="color: red;" id="userNameError"></span><br>
            	密&nbsp;&nbsp;&nbsp;&nbsp;码:<input type="password" name="passWord" id="passWord">
            	<span style="color: red;" id="pwdError"></span><br>
            	
            	<input type="text" name="randomCode" id="randomCode" tabindex="3" size="6" />
				<span style="margin-top: 5px;">
				<input type="text" onclick="createCode()" readonly="readonly" id="checkCode" class="unchanged" style="width: 80px" /><br />  
<!-- 				<img id="pic_random_code" style="cursor: hand;" name="pic_random_code" -->
<!-- 						onClick="changeValidateCode(this)" alt="" title="" /><br> -->
						
                <button type="submit" class="submit_button" onclick="return check()">登录</button>
                <h2><a href="pages/register.jsp">注册</a></h2>
				<h2><a href="pages/delete.jsp">删除</a></h2>
            </form>
        </div>
</body>
</html>