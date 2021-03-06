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
<link href="<%=basePath%>css/topic.css" rel="stylesheet">
<link href="<%=basePath%>css/imageFD.css" rel="stylesheet" />
<!-- 编辑框 -->
<script src="<%=basePath%>js/ckeditor/ckeditor.js"></script>

<!-- 禁用响应式布局 -->
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
					<li class="navbar-btn"><a
						href="testAnswerAction_toAnswerListUI">评测状态<span
							class="sr-only"></span></a></li>
					<li class="active navbar-btn"><a
						href="homeAction_toExchangeCentreUI">交流中心<span class="sr-only"></span></a></li>
					<li class="navbar-btn"><a href="homeAction_toContactInfoUI">联系方式<span
							class="sr-only"></span></a></li>
				</ul>

				<%@ include file="/WEB-INF/jsp/public/userMenu.jspf"%>
			</div>

		</div>
	</nav>
	<!--   	导航条结束    -->

	<!-- 中间内容开始 -->
	<div class="container-fluid">
		<div class="row">

			<!-- 内容 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-1 main">

				<!-- 路径 -->
				<ol class="breadcrumb">
					<li><a href="topicAction_toTopicListUI">交流中心 <span
							class="glyphicon glyphicon-chevron-right"></span></a>
					<li class="active">${topic.title }<span
						class="glyphicon glyphicon-chevron-right"></li>
					</li>
				</ol>

				<!--显示主题标题等-->
				<table class="table table-responsive" width="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr valign="bottom">
						<td width="3" class="ForumPageTableTitleLeft">&nbsp;</td>
						<td class="ForumPageTableTitle" style="font-size: 16px;"><b>本帖主题：${topic.title}</b></td>
						<td class="ForumPageTableTitle" align="right"
							style="padding-right: 12px;"><a class="detail"
							href="javascript:scroll(0,100000000000)"><img border="0"
								src="img/reply.gif" />回复</a> <!-- 判断是否已经收藏 --> <s:if
								test="isFavorite">
								<s:a
									action="favoriteAction_updateFavoriteStatus?status=0&topicId=%{#topic.id}">
									<img border="0" src="img/uncollect.gif" />取消收藏</s:a>
							</s:if> <s:else>
								<s:a
									action="favoriteAction_updateFavoriteStatus?status=1&topicId=%{#topic.id}">
									<img border="0" src="img/collect.gif" />收藏</s:a>
							</s:else> <s:if test="currentUser.id==#topic.author.id">
								<s:a action="topicAction_toUpdateTopicUI?id=%{id}">
									<img border="0" src="img/text.gif" />编辑</s:a>
							</s:if> <s:if
								test="currentUser.role.name=='管理员'  || currentUser.role.name=='超级管理员' ">
								<s:a
									action="topicAction_updateTopicType?typeId=2&topicId=%{#topic.id}"
									onClick="return confirm('要把本主题设为置顶吗？')">
									<img border="0" src="img/topicType_2.gif" />置顶</s:a>
								<s:a
									action="topicAction_updateTopicType?typeId=1&topicId=%{#topic.id}"
									onClick="return confirm('要把本主题设为精华吗？')">
									<img border="0" src="img/topicType_1.gif" />精华</s:a>
								<s:a
									action="topicAction_updateTopicType?typeId=0&topicId=%{#topic.id}"
									onClick="return confirm('要把本主题设为普通吗？')">
									<img border="0" src="img/topicType_0.gif" />普通</s:a>
								<s:a action="topicAction_addTiQuestion?id=%{id}"
									onClick="return confirm('确认要把本贴中的试题加入题库吗？')">
									<img border="0" src="img/sendDoc.gif" />加入题库</s:a>
							</s:if></td>
						<td width="3" class="ForumPageTableTitleRight">&nbsp;</td>
					</tr>
					<tr height="1" class="ForumPageTableTitleLine">
						<td colspan="4"></td>
					</tr>
				</table>
				<!-- ~~~~~~~~~~~~~~~ 显示主帖 ~~~~~~~~~~~~~~~ -->
				<s:if test="currentPage== 1">
					<div class="ListArea table">
						<table cellpadding="0" cellspacing="1" 
							width="100%">
							<tr>
								<td rowspan="3" width="130" class="PhotoArea" align="center"
									valign="top">
									<!--作者头像-->
									<div class="AuthorPhoto">
										<img border="0" width="110" height="110" src="img/userpic.jpg"
											onerror="this.onerror=null; this.src=''img/userpic.jpg;" />
									</div> <!--作者名称-->
									<div class="AuthorName">
										<s:a action="userAction_toUserInfoUI?id=%{#topic.author.id}"
											target="_blank">${topic.author.name }</s:a>
									</div>
								</td>

							</tr>
							<tr>
								<!-- 文章内容 -->
								<td valign="top" align="center">
									<div class="Content">
										<!--主题开始-->
										<div class="QuictReply">
											<form action="createAnswer_b.html" method="post">
												<div style="padding-left: 3px;">
													<table class="table table-striped">
														<thead>
															<h1 style="text-align: center;">
																<img
																	src="<%=basePath%>img/topicType_${topic.classify}.gif" />${topic.title}</h1>
														</thead>
														<tr>
															<td width="100px"><b>主题类型</b></td>
															<td><s:if test="#topic.type==1">
																	<span class="btn btn-warning">知识讨论</span>
																</s:if> <s:elseif test="#topic.type==0">
																	<span class="btn btn-warning">新增题目</span>
																</s:elseif></td>
														</tr>
														<tr class="Tint">
															<td><b>内容</b></td>
															<td>${topic.topicContent}</td>
														</tr>
														<tr>
															<td width="100px"><b>题目类型</b></td>
															<td><s:if test="#topic.questionType==1">
																	<span class="btn btn-success">结果填空</span>
																</s:if> <s:elseif test="#topic.questionType==2">
																	<span class="btn btn-success">程序设计</span>
																</s:elseif> <s:elseif test="#topic.questionType==3">
																	<span class="btn btn-success">代码填空</span>
																</s:elseif> <s:else>
																	<span class="btn btn-success">无类型</span>
																</s:else></td>
														</tr>
														<tr>
															<td width="100px"><b>编程语言</b></td>
															<td><span class="btn btn-warning">${topic.language}</span></td>
														</tr>
														<tr>
															<td width="100px"><b>所属类型</b></td>
															<td><span class="btn btn-warning">${topic.scope.title}</span></td>
														</tr>
														<tr>
															<td width="100px"><b>题目描述</b></td>
															<td>${topic.description}</td>
														</tr>
														<tr>
															<td></td>
															<td>
																<div class="col-md-8" style="margin-top: 2px">

																	<s:if test="#topic.imagePath1!=null">
																		<p>
																			<a id="example1"
																				href='<s:property value ="#topic.imagePath1" />'><img
																				class="img-responsive"
																				src='<s:property value ="#topic.imagePath1" />'></a>
																		</p>
																	</s:if>
																	<s:if test="#topic.imagePath2!=null">
																		<p>
																			<a id="example2"
																				href='<s:property value ="#topic.imagePath2" />'><img
																				class="img-responsive"
																				src='<s:property value ="#topic.imagePath2" />'></a>
																		</p>
																	</s:if>
																	<s:if test="#topic.imagePath3!=null">
																		<p>
																			<a id="example3"
																				href='<s:property value ="#topic.imagePath3" />'><img
																				class="img-responsive"
																				src='<s:property value ="#topic.imagePath3" />'></a>
																		</p>
																	</s:if>
																	<s:if test="#topic.imagePath4!=null">
																		<p>
																			<a id="example4"
																				href='<s:property value ="#topic.imagePath4" />'><img
																				class="img-responsive"
																				src='<s:property value ="#topic.imagePath4" />'></a>
																		</p>
																	</s:if>
																	<s:if test="#topic.imagePath5!=null">
																		<p>
																			<a id="example5"
																				href='<s:property value ="#topic.imagePath5" />'><img
																				class="img-responsive"
																				src='<s:property value ="#topic.imagePath5" />'></a>
																		</p>
																	</s:if>

																</div>
															</td>
														</tr>
														<tr>
															<td width="100px"><b>题目内容</b></td>
															<td>${topic.content}</td>
														</tr>
														<tr>
															<td width="100px"><b>输入格式</b></td>
															<td>${topic.inputFormat}</td>
														</tr>
														<tr>
															<td width="100px"><b>输出格式</b></td>
															<td>${topic.outputFormat}</td>
														</tr>
														<tr>
															<td width="100px"><b>样例输入</b></td>
															<td>${topic.sampleInput}</td>
														</tr>
														<tr>
															<td width="100px"><b>样例输出</b></td>
															<td>${topic.sampleOutput}</td>
														</tr>
														<tr>
															<td width="100px"><b>注意</b></td>
															<td>${topic.careful}</td>
														</tr>
														<tr>
															<td width="100px"><b>提示</b></td>
															<td>${topic.cue}</td>
														</tr>
														<tr>
															<td width="100px"><b>耗时要求</b></td>
															<td>${topic.runtime}ms</td>
														</tr>
														<tr>
															<td width="100px"><b>内存要求</b></td>
															<td>${topic.memory}MB</td>
														</tr>
													</table>
												</div>
											</form>
										</div>
										</s:if>
										<!--新主题结束-->



									</div>
								</td>
							</tr>
							<tr>
								<!--显示楼层等信息-->
								<td class="Footer" height="28" align="center" valign="bottom">
									<ul class="list-unstyled" style="margin: 0px; width: 98%;">
										<li class="TopicFuncLi">
											<!-- 判断是否已经收藏 --> <s:if test="isLaud">
												<s:a cssClass="detail"
													action="laudAction_updateFavoriteStatus?status=0&topicId=%{#topic.id}">
													<img border="0" src="img/laud.gif" />取消赞(${topic.laudCount })</s:a>
											</s:if> <s:else>
												<s:a cssClass="detail"
													action="laudAction_updateFavoriteStatus?status=1&topicId=%{#topic.id}">
													<img border="0" src="img/laud.gif" />赞(${topic.laudCount })</s:a>
											</s:else> <s:if test="currentUser.id==#topic.author.id">
												<s:a action="topicAction_toUpdateTopicUI?id=%{id}">
													<img border="0" src="img/text.gif" />编辑</s:a>
											</s:if> <s:if
												test="currentUser.id == #topic.author.id || currentUser.role.name== '管理员' || currentUser.role.name== '超级管理员' ">
												<s:a cssClass="detail"
													action="topicAction_deleteTopic?id=%{id}"
													onClick="return confirm('确定要删除本帖吗？')">
													<img border="0" src="img/delete.gif" />删除</s:a>
											</s:if>
										</li>
										<li style="float: left; line-height: 18px; color: black;"><font
											color=#C30000>[楼主]</font> <s:date name="#topic.postTime"
												format="yyyy-MM-dd HH:mm:ss" /></li>
										<li class="list-un" style="float: right;"><a
											href="javascript:scroll(0,0)"> <img border="0"
												src="img/top.gif" /></a></li>
									</ul>
								</td>
							</tr>
						</table>
					</div>
					<!-- ~~~~~~~~~~~~~~~ 显示主帖结束 ~~~~~~~~~~~~~~~ -->

					<!-- ~~~~~~~~~~~~~~~ 显示回复列表 ~~~~~~~~~~~~~~~ -->
					<s:iterator value="recordList" status="status">
						<div class="ListArea template">
							<table border="0" cellpadding="0" cellspacing="1" width="100%">
								<tr>
									<td rowspan="3" width="130" class="PhotoArea" align="center"
										valign="top">
										<!--作者头像-->
										<div class="AuthorPhoto">
											<img border="0" width="110" height="110"
												src="img/userpic.jpg"
												onerror="this.onerror=null; this.src='img/userpic.jpg';" />
										</div> <!--作者名称-->
										<div class="AuthorName">
											<s:a action="userAction_toUserInfoUI?id=%{author.id}"
												target="_blank">${author.name }</s:a>
										</div>
									</td>
									<td align="center">
										<ul class="TopicFunc list-unstyled">
											<!-- 文章表情与标题 -->
											<li class="TopicSubject"></li>
										</ul>
									</td>
								</tr>
								<tr>
									<!-- 文章内容 -->
									<td valign="top" align="center">
										<div class="Content">${content}</div>
									</td>
								</tr>
								<tr>
									<!--显示楼层等信息-->
									<td class="Footer" height="28" align="center" valign="bottom">
										<ul class="list-unstyled" style="margin: 0px; width: 98%;">
											<li class="TopicFuncLi"><s:if
													test="currentUser.id == #topic.author.id || currentUser.role.name== '管理员' || currentUser.role.name== '超级管理员' ">
													<s:a cssClass="detail"
														action="replyAction_deleteReply?id=%{id}&topicId=%{topic.id}">
														<img border="0" src="img/delete.gif" />删除</s:a>
												</s:if></li>
											<li style="float: left; line-height: 18px; color: black;"><font
												color=#C30000>[${(currentPage-1)*pageSize+status.count}楼]</font>
												<s:date name="postTime" format="yyyy-MM-dd HH:mm:ss" /></li>
											<li style="float: right;"><a
												href="javascript:scroll(0,0)"> <img border="0"
													src="<%=basePath%>img/top.gif" />
											</a></li>
										</ul>
									</td>
								</tr>
							</table>
						</div>
					</s:iterator>
					<!-- ~~~~~~~~~~~~~~~ 显示回复列表结束 ~~~~~~~~~~~~~~~ -->

					<!-- 分页开始 -->
					<!--分页信息-->
					<s:form id="pageForm" action="topicAction_toTopicShowUI?id=%{id}"
						method="post">
					</s:form>

					<%@include file="/WEB-INF/jsp/public/pageView.jspf"%>
					<!-- 分页结束 -->
					<s:if test="#session.isBan==false"> 
					<!--快速回复-->
					<div class="QuictReply" id="quictReply">
						<s:form action="replyAction_add?topicId=%{#topic.id}"
							method="post">

							<div style="padding-left: 3px;">
								<table class="table table-striped">
									<tr class="Tint" height="200">
										<div class="grid-container">
											<div class="grid-width-100">
												<s:textarea name="content" id="editor"></s:textarea>
											</div>
										</div>
										<td class="center" colspan="2" align="center">
											<button type="submit" class="btn btn-success">回复</button>
										</td>
									</tr>
								</table>
							</div>
						</s:form>
					</div>
					</s:if>
					 
			</div>
		</div>
	</div>
	<!-- 中间内容结束 -->


	<script>
		window.onload = function() {
			CKEDITOR.replace('editor');
		};

		$("#submit").click(function() {
			/* CKEDITOR.replace("editor1"); */
			var title = $("#caption").val(); /*不能用.text()或.html()*/
			var val = CKEDITOR.instances.editor.getData();
		});
	</script>

	<%@ include file="/WEB-INF/jsp/public/footer.jspf"%>

	<script type="text/javascript" src="js/imageFD/jquery.min.js"></script>
	<script type="text/javascript" src="js/imageFD/jquery.imgbox.pack.js"></script>
	<script>
		$(function() {
			$("#example1").imgbox();
			$("#example2").imgbox();
			$("#example3").imgbox();
			$("#example4").imgbox();
			$("#example5").imgbox();
		});
	</script>
</body>

</html>