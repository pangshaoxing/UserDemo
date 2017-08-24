<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>Jquery分类</title>
<script src="<%=basePath%>/js/jquery-1.8.3.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		//品牌 
		var alink01 = $("#linktype01").find("span");
		alink01.click(function() {
			alink01.each(function() {
				$(this).removeClass("templinkactive").addClass("templink");
			});
			$(this).removeClass("templink").addClass("templinkactive");
			$("#Brand").val($(this).attr("tag"));
		})

		//价格 
		var alink02 = $("#linktype02").find("span");
		alink02.click(function() {
			alink02.each(function() {
				$(this).removeClass("templinkactive").addClass("templink");
			});
			$(this).removeClass("templink").addClass("templinkactive");
			$("#Price").val($(this).attr("tag"));
		})

		//尺寸 
		var alink03 = $("#linktype03").find("span");
		alink03.click(function() {
			alink03.each(function() {
				$(this).removeClass("templinkactive").addClass("templink");
			});
			$(this).removeClass("templink").addClass("templinkactive");
			$("#Size").val($(this).attr("tag"));
			SetPara();
		})
	});

	function SetPara() {
		var a = $("#Brand").val();
		var b = $("#Price").val();
		var c = $("#Size").val();
		alert("1.aspx?a=" + a + "&b=" + b + "&c=" + c);
	};
</script>
<style type="text/css">
.templinkactive {
	padding: 5px;
	text-decoration: none;
	background-color: #2788DA;
	color: #ffffff;
}

.templink {
	cursor: pointer;
	padding: 5px;
	text-decoration: none;
}

table tr {
	height: 35px;
}
</style>
</head>
<body>
	<form id="form1" runat="server">
		<div>
			<table>
				<tr id="linktype01">
					<td style="width: 100px"><b>笔记本品牌</b></td>
					<td><span class='templinkactive' tag="0">不限</span></td>
					<td><span class='templink' tag="100101">联想（Lenovo）</span></td>
					<td><span class='templink' tag="100102">宏碁（Acer）</span></td>
					<td><span class='templink' tag="100103">华硕（ASUS）</span></td>
					<td><span class='templink' tag="100104">戴尔（DELL）</span></td>
					<td><span class='templink' tag="100105">苹果（Apple）</span></td>
					<td><span class='templink' tag="100106">三星 （SAMSUNG）</span></td>
				</tr>
				<tr id="linktype02">
					<td style="width: 100px"><b>价格范围</b></td>
					<td><span class='templinkactive' tag="0">不限</span></td>
					<td><span class='templink' tag="100201">1000-2999</span></td>
					<td><span class='templink' tag="100202">3000-3499</span></td>
					<td><span class='templink' tag="100203">4000-4499</span></td>
					<td><span class='templink' tag="100204">5000-5999</span></td>
					<td><span class='templink' tag="100205">6000-6999</span></td>
					<td><span class='templink' tag="100206">7000及以上</span></td>
				</tr>
				<tr id="linktype03">
					<td style="width: 100px"><b>尺寸范围</b></td>
					<td><span class='templinkactive' tag="0">不限</span></td>
					<td><span class='templink' tag="100301">8.9英寸及以下</span></td>
					<td><span class='templink' tag="100302">11英寸</span></td>
					<td><span class='templink' tag="100303">12英寸</span></td>
					<td><span class='templink' tag="100304">13英寸</span></td>
					<td><span class='templink' tag="100305">14英寸</span></td>
					<td><span class='templink' tag="100306">15英寸及以上</span> <input
						type="hidden" id="Brand" value="0" /> <input type="hidden"
						id="Price" value="0" /> <input type="hidden" id="Size" value="0" />
					</td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
