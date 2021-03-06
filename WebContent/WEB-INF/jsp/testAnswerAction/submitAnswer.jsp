<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="题库">
<meta name="author" content="黄跃然 huangyueran">
<title>练习系统</title>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="<%=basePath%>codemirror/jquery.js"></script>
<link href="<%=basePath%>css/bootstrap.min.css" rel="stylesheet" />
<link href="<%=basePath%>css/bootstrap-theme.min.css" rel="stylesheet" />
<link href="<%=basePath%>css/sticky-footer.css" rel="stylesheet" />
<link href="<%=basePath%>css/basic.css" rel="stylesheet" />

<!-- 代码编辑器样式 -->
<link href="<%=basePath%>codemirror/codemirror.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>codemirror/eclipse.css" type="text/css"
	rel="stylesheet" />
<link href="<%=basePath%>codemirror/duotone-light.css" type="text/css"
	rel="stylesheet" />
<!------------------------- 代码编辑器 ------------------------->
<script type="text/javascript"
	src="<%=basePath%>codemirror/codemirror.min.js"></script>
<script src="<%=basePath%>codemirror/clike.js"></script>
<script src="<%=basePath%>codemirror/active-line.js"></script>
<script src="<%=basePath%>codemirror/matchbrackets.js"></script>
<script type="text/javascript">
	function createCodeMirrorEditor() {
		cm = CodeMirror.fromTextArea(document.getElementById("code-editor"), {
			lineNumbers : true,
			matchBrackets : true,
			mode : "text/x-c++src",
			theme : "duotone-light",
			indentWithTabs : true,
			styleActiveLine : true,
			indentUnit : 2,
			tabSize : 2,
			readOnly : false
		});
		cm.setValue("");
	};

	$(document).ready(function() {
		createCodeMirrorEditor();
	});
</script>
<!-- 表单验证 -->
<%@ include file="/WEB-INF/jsp/public/formvalidate.jspf"%>
</head>

<body>

	<!--   	导航条开始    -->
	<nav class="nav navbar-inverse navbar-fixed-top">

		<div class="container">

			<div class="navbar-header">
				<!-- 	描述：logo -->
				<a class="navbar-brand"> <img src="img/ic_launcher.jpg"
					style="width: 75px;" />
				</a>
			</div>

			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-btn center-block text-center">
					<li class="navbar-btn"><a href="homeAction_toIndex">首页<span
							class="sr-only"></span></a></li>
					<li id="nav2" class="navbar-btn"><a href="homeAction_toHelpUI">帮助文档<span
							class="sr-only"></span></a></li>
					<li class="navbar-btn"><a href="homeAction_toSystemNoticeUI">系统公告<span
							class="sr-only"></span></a></li>
					<li class="navbar-btn"><a
						href="homeAction_toCompetitionSystemUI">进入系统<span
							class="sr-only"></span></a></li>
					<li class="active navbar-btn"><a
						href="testAnswerAction_toAnswerListUI">评测状态<span
							class="sr-only"></span></a></li>
					<li class="navbar-btn"><a href="homeAction_toExchangeCentreUI">交流中心<span
							class="sr-only"></span></a></li>
					<li class="navbar-btn"><a href="homeAction_toContactInfoUI">联系方式<span
							class="sr-only"></span></a></li>
				</ul>

				<%@ include file="/WEB-INF/jsp/public/userMenu.jspf"%>
			</div>

		</div>
	</nav>
	<!--   	导航条结束    -->

	<!-- 中间内容开始 -->
	<div class="container">
		<div class="row">

			<!-- 内容 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-1 main">

				<!-- 路径 -->
				<ol class="breadcrumb">
					<li><a href="homeAction_toCompetitionSystemUI">试题集 <span
							class="glyphicon glyphicon-chevron-right"></span></a> <s:a
							action="questionAction_toQuestionListUI?questionSetId=%{scope.id}">${scope.title } <span
								class="glyphicon glyphicon-chevron-right"></span>
						</s:a> <s:a
							action="questionAction_toQuestionShowUI?questionSetId=%{questionSetId}&id=%{id}">${title }<span
								class="glyphicon glyphicon-chevron-right"></span>
						</s:a>
					<li class="active">提交答案 <span
						class="glyphicon glyphicon-chevron-right"></li>
					</li>
				</ol>

				<div class="table-responsive jumbotron">
					<s:form action="scoringPointAction_submitAnswer"
						cssClass="form-signin" role="form" method="post">

						<s:hidden name="randomTemp" value="%{#session.randomTemp}"></s:hidden>      
						
						<s:hidden name="questionId" value="%{id}"></s:hidden>
						<table class="table table-condensed">
							<tbody style="font-size: 16px; font-family: '微软雅黑';">
								<th style="font-size: 25px;">${title }</th>
								<tr>
									<td><b>输入答案：</b></td>
								</tr>
								<tr>
									<td><s:textarea id="code-editor"
											cssClass="form-control required" name="answer" rows="30"></s:textarea></td>
								</tr>
								<tr>
									<td><center>
											<button class="btn btn-primary btn-lg" type="submit">提交</button>
										</center></td>
								</tr>
							</tbody>
						</table>
					</s:form>
				</div>
			</div>

		</div>

	</div>
	<!-- 中间内容结束 -->

	<script src="<%=basePath%>js/jquery.min.js"></script>
	<%@ include file="/WEB-INF/jsp/public/footer.jspf"%>

</body>

</html>