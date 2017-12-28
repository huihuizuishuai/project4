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
<link rel="stylesheet" href="<%=basePath%>/resources/sys/ying/font2.css">
<link rel="stylesheet"
	href="<%=basePath%>/resources/sys/style/bootstrap.css">
<link rel="stylesheet"
	href="<%=basePath%>/resources/sys/style/style.css">
<title>盈+后台管理中心</title>
</head>
<body>
	<div class="box-right-main">
		<h2>
			<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>管理员账号
		</h2>
		<div class="tablelist">
			<table class="table tabletop">
				<tr>
					<td class="pull-right" style="padding-right: 30px">
						<button type="button" onclick="jump();" class="btn btn-primary btn-sm add">新增</button>
					</td>
				</tr>
			</table>
			<form action="deleteUser" method="post" name="delform" >
					<input type="hidden" name="usersId" id="usersId" />
					<input type="hidden" name="_method" value="DELETE" />
				</form>
			<form action="userlist" method="post" name="userfrom">
				<input type="hidden" name="page" id="page">
				<table class="table table-bordered tablebox">
					<tr class="text-center" bgcolor="#f7f7f7">
						<td>序号</td>
						<td>用户名</td>
						<td>角色</td>
						<td>手机号<Utd>
						<td>创建时间</td>
						<td>操作</td>
					</tr>
					<c:forEach items="${pagename.getContent()}" var="c" varStatus="vs">
						<tr class="text-center">
							<td>${vs.index+1}</td>
							<td>${c.userName}</td>
							<td>${c.userrole.cname}</td>
							<td>${c.mobilePhone  }</td>
							<td>${c.createDate}</td>
							<td><a href="<%=basePath %>CJZ/toupdateUser/${c.usersId}" class="btn btn-primary btn-sm">编辑</a> 
								<a href="javascript:Delete(${c.usersId})" class="btn btn-primary btn-sm delUser">删除</a></td>
						</tr>
					</c:forEach>
				</table>
				<div class="llpage">
					<div class="in">
						<nav> <span class="count">第&nbsp;<b>${pagename.getNumber()+1 }</b>&nbsp;页，&nbsp;共&nbsp;<b>${pagename.getTotalPages()}</b>&nbsp;页
						</span>
						<ul class="pagination">
							<li>
							<a href="javascript:pagerequest(${pagename.getNumber()>1?pagename.getNumber():1 });">上页</a>
							<li><a class="now">${pagename.getNumber()+1 }</a>
							<li>
							<a href="javascript:pagerequest(${pagename.getNumber()<pagename.getTotalPages()-1?pagename.getNumber()+1+1:pagename.getTotalPages() });">下页</a>
						</ul>
						</nav>
					</div>
				</div>
			</form>
		</div>
	</div>

</body>
<script type="text/javascript">
	function pagerequest(page) {
		document.getElementById("page").value = page;
		document.userfrom.submit();
	};
	function jump() {
		window.location = "addAccount";
	};	
	function Delete(id) {
		if(confirm("你确定要删除吗？")){
				document.getElementById("usersId").value=id;
				document.delform.submit();
		}
		else return false;
	};
</script>
</html>
</body>
</html>