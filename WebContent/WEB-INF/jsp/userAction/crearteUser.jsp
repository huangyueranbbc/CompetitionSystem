<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="题库">
<meta name="author" content="黄跃然 huangyueran">
<title>练习系统</title>
<%@ include file="/WEB-INF/jsp/public/header.jspf"%>
<link href="<%=basePath%>css/dashboard.css" rel="stylesheet" />
<!-- 禁用响应式布局 -->
</head>
<body>

	<!--   	导航条开始    -->
	<%@ include file="/WEB-INF/jsp/public/nav.jspf"%>
	<!--   	导航条结束    -->

	<!-- 中间内容开始 -->
	<div class="container-fluid">
		<div class="row">
			<!-- 侧边栏 -->
			<%@ include file="/WEB-INF/jsp/public/leftMenu.jspf"%>

			<!-- 内容 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">

				<h2 class="sub-header">添加用户</h2>
				<div class="table-responsive">
					<form action="userAction_createUser" class="form-horizontal"
						role="form">

						<table class="table table-striped">
							<tbody>
								<tr>
									<td>请输入用户名</td>
									<td><input type="text" id="username1"
										class="focus form-control " /></td>
								</tr>
								<tr>
									<td>重新输入用户名</td>
									<td><input type="text" name="username" id="username2"
										class="focus form-control " /></td>
								</tr>
								<tr>
									<td>重新输入姓名</td>
									<td><input type="text" name="name"
										class="focus form-control " value="学生"/></td>  
								</tr> 
								<tr>
									<td>用户级别</td>
									<td>
									<s:select name="roleId" cssClass="btn btn-success required"
											list="roles" listKey="id" listValue="name" 
											headerKey=""> 
										</s:select>   
									</td> 
								</tr>
								<tr>
									<td>初始密码</td>
									<td><input disabled="true"  type="text"
										class="focus form-control" value="666666" /></td>
								</tr>

							</tbody>
						</table>
						<button class="btn btn-lg btn-primary btn-block" type="submit">确认添加</button>
					</form>
				</div>
			</div>

		</div>

	</div>
	<!-- 中间内容结束 -->

	<script>
		function validate() {
			var pw1 = document.getElementById("username1").value;
			var pw2 = document.getElementById("username2").value;
			if (pw1 == pw2) {
				document.getElementById("tishi").innerHTML = "<font color='green'>两次密码相同</font>";
				document.getElementById("submit").disabled = false;
			} else {
				document.getElementById("tishi").innerHTML = "<font color='red'>两次密码不相同</font>";
				document.getElementById("submit").disabled = true;
			}
		}
	</script>

	<%@ include file="/WEB-INF/jsp/public/footer.jspf"%>
</body>
</html>