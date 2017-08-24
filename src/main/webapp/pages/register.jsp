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
				$("#userNameError").html("注册用户不能为空！");
				$("#regFrm").attr("onsubmit", "return false");
			}
			if (len > 0 && len < 6) {
				$("#userNameError").html("注册用户位数最少为6位！");
				$("#regFrm").attr("onsubmit", "return false");
			}
			if (len >= 6) {
// 				$.getJSON("userJudge.action",
// 						{"userName":userName},
// 						function(data){
// 					if(data!=null){
// 						alert("该用户已注册，请重新输入！！");
// 						$("#userNameError").html("该用户已注册！");
// 						$("#regFrm").attr("onsubmit","return false");
// 					}else{
// 						$("#userNameError").html("注册用户格式正确！");
// 						$("#regFrm").attr("onsubmit", "return true");
// 					}
// 				});
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
	// 密码合法性的判断
	$(function() {
		$("#pwd").blur(function() {
			var len = $("#pwd").val().length;
			if (len == 0) {
				$("#pwdError").html("密码不能为空！");
				$("#regFrm").attr("onsubmit", "return false");
			}
			if (len > 0 && len < 6) {
				$("#pwdError").html("密码位数最少为6位！");
				$("#regFrm").attr("onsubmit", "return false");
			}
			if (len >= 6) {
				$("#pwdError").html("密码格式正确！");
				$("#regFrm").attr("onsubmit", "return true");
			}
		})
	})
	// 确认两次密码
	$(function() {
		$("#conpwd").blur(function() {
			var oldpwd = $("#pwd").val();
			var conpwd = $("#conpwd").val();
			var number = $("#conpwd").val().length;
			if (number == 0) {
				$("#conpwdError").html("密码不能为空！");
				$("#regFrm").attr("onsubmit", "return false");
			} else if (oldpwd != conpwd) {
				$("#conpwdError").html("两次密码不一致！");
				$("#regFrm").attr("onsubmit", "return false");
			} else {
				$("#conpwdError").html("密码符合！");
				$("#regFrm").attr("onsubmit", "return true");
			}
		})
	})
	
	function check(){  
	     fr=document.reg;  
	     if(fr.userName.value==""){  
	    	$("#userNameError").html("注册用户不能为空！");
	        fr.userName.focus();  
	        return false;  
	     }  
	     if(fr.userName.value.length>0 && fr.userName.value.length<6){  
		    	$("#userNameError").html("注册用户位数最少为6位！");
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
	     
	     if(fr.passWord.value==""){  
	             fr.passWord.focus(); 
	             $("#pwdError").html("密码不能为空！");
	             return false;  
	     }
	     if(fr.passWord.value.length>0 && fr.passWord.value.length<6){  
             fr.passWord.focus(); 
             $("#pwdError").html("密码位数最少为6位！");
             return false;  
     	}
	    if((fr.password2.value=="")){  
            fr.password2.focus(); 
            $("#conpwdError").html("确认密码密码不能为空！");
            return false;  
    	}
	    if(fr.passWord.value != fr.password2.value){
	    	fr.password2.focus(); 	    
	    	$("#conpwdError").html("两次密码不一致！");
			return false;
	    }
	    fr.submit();
	}
</script>
<body>
	<div class="page-container">
		<h1>用户注册</h1>
		<form name="reg" id="regFrm" action="userRegister.action" method="post" onsubmit="">
			用户名：&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="userName" id="userName">
			<span style="color: red;" id="userNameError"></span><br /> 
			密&nbsp;&nbsp;&nbsp;&nbsp;码：&nbsp;&nbsp;&nbsp;&nbsp;<input type="password" name="passWord" id="pwd">
			<span style="color: red;" id="pwdError"></span><br /> 
			确认密码：<input type="password" name="password2" id="conpwd">
			<span style="color: red;" id="conpwdError"></span><br />
			<button type="submit" class="submit_button" onclick="return check();">注册</button>
		</form>
	</div>
</body>
</html>
