<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="<%=basePath%>/resources/sys/ying/iconfont.css">

<link rel="stylesheet"
	href="<%=basePath%>/resources/sys/style/bootstrap.css">
<link rel="stylesheet"
	href="<%=basePath%>/resources/sys/style/style.css">

<title>盈+后台管理中心</title>
</head>
<body>
	<script src="../resources/js/Calendar.js"></script>
		<div class="box-right-main">
		<h2>			
			<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>账号管理
		</h2>

		<div class="tablelist">
			<form action="<%=basePath%>Li/members" method="post"
				name="membersform" id="form1">
				<input type="hidden" name="page" id="page">
				
				<table class="table tabletop">
					<tr>
						<td style="width: 110px; padding-left: 30px">用户名:</td>
						<td style="width: 180px"><input type="text" id="memberName"
							class="form-control" name="memberName" placeholder="用户名"
							value="${members.memberName}"></td>
						<td style="width: 110px; padding-left: 30px">手机号:</td>
						<td style="width: 180px"><input type="text" id="mobilePhone"
							name="mobilePhone" class="form-control" placeholder="手机号"
							value="${members.mobilePhone}"></td>
						<td style="width: 110px; padding-left: 30px">姓名:</td>
						<td style="width: 180px"><input type="text" id="names"
							name="names" class="form-control" placeholder="姓名"
							value="${members.names}"></td>
	
						
								<td class="pull-right" style="padding-right: 10px"><button
										type="submit" class="btn btn-primary btn-sm">查询</button></td>
								<td><button type="reset" class="btn btn-primary btn-sm" onclick="$('#form1').find(':input').not(':button, :submit, :reset').val('').removeAttr('checked').removeAttr('selected');">重置</button></td>
					</tr>
				</table>
			</form>
			<table class="table table-bordered tablebox">
				<tr class="text-center" bgcolor="#f7f7f7">
					<td>序号</td>
					<td>手机号</td>
					<td>用户名</td>
					<td>姓名</td>
					<td>身份证</td>
					<td>邀请码</td>
					<td>注册时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${memberspage.getContent() }" var="members" varStatus="s">
					<tr class="text-center">
						<td>${s.count}</td>
						<td>${members.mobilePhone}</td>
						<td>${members.memberName}</td>
						<td>${members.names}</td>
						<td>${members.memberIdentity}</td>
						<td>${members.invitedCode}</td>
						<td>${members.createDate}</td>
						<td><a class="btn btn-primary btn-sm"
							href="<%=basePath %>Li/account/${members.memberId}">账号详情</a></td>
					</tr>
				</c:forEach>
			</table>
			<table style="background: blue; width: 600px;">
				<tr style="background: white">
					<td align="center">当前第${memberspage.getNumber()+1 }页/共${memberspage.getTotalPages() }页&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-sm"
						href="javascript:pagerequest(1);">首页</a>&nbsp;&nbsp;&nbsp; <a
						class="btn btn-primary btn-sm"
						href="javascript:pagerequest(${memberspage.getNumber()>1?memberspage.getNumber():1 });">上一页</a>&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-sm"
						href="javascript:pagerequest(${memberspage.getNumber()<memberspage.getTotalPages()-1?memberspage.getNumber()+1+1:memberspage.getTotalPages() });">下一页</a>&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-sm"
						href="javascript:pagerequest(${memberspage.getTotalPages() });">尾页</a>&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>


		</div>


	</div>

	<script type="text/javascript">
		function pagerequest(page) {
			document.getElementById("page").value = page;
			document.membersform.submit();
		}
		
	</script>
</body>
</html>