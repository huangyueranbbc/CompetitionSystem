<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>没有权限</title>
<style type="text/css"> 
<!--
body, td, th {
	color: #FFFFFF;
}

body {
	background-color: #0099CC;
}

.STYLE7 {
	font-size: 24px;
	font-family: "微软雅黑";
}

.STYLE9 {
	font-size: 16px
}

.STYLE12 {
	font-size: 100px;
	font-family: "微软雅黑";
}
-->
</style>
</head>

<body>
	<script language="javascript" type="text/javascript">
		setTimeout(function() {
			this.location.href = "homeAction_toIndex"
		}, 10000); 
	</script>
	<span class="STYLE12">&nbsp;:(</span>
	<p class="STYLE7">
		您没有相关操作的权限<br /> 10秒后为您跳转到首页，您可以在首页试着找找您所需要的信息。
	</p>
	<p class="STYLE7">
		<span class="STYLE9">如果您想进行相关操作，请联系管理员</span>
	</p>
</body>

</html>
