<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">

<meta name="keywords"
	content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico"
	type="image/x-icon" rel="shortcut icon">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="<%=basePath%>resources/sys/ying/iconfont.css">
<link rel="stylesheet"
	href="<%=basePath%>resources/sys/style/bootstrap.css">
<link rel="stylesheet" href="<%=basePath%>resources/sys/style/style.css">
<script type="text/javascript"
	src="<%=basePath%>resources/sys/js/jquery.js"></script>
<title>后台首页</title>
</head>
<body>
	<form action="<%=basePath%>overseaSys/overseaConfig" method="get"
		id="form1">
		<input type="hidden" id="pageid" name="page">
	</form>
	<div class="box-right-main">
		<h2>
			<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>海外配置
		</h2>
		<table class="table tabletop">
			<tr>
				<td class="pull-right"><a class="btn btn-primary btn-sm"
					href="<%=basePath%>overseaSys/overseaConfigView">新增</a></td>
			</tr>
		</table>
		<div class="tablelist">
			<table class="table table-bordered tablebox">
				<tr class="text-center" bgcolor="#f7f7f7">
					<td>序号</td>
					<td>ID</td>
					<td>标题</td>
					<td>子标题</td>
					<td>状态</td>
					<td>排序值</td>
					<td>图标</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${overseaConfiglist.getContent()}" var="oversea"
					varStatus="statu">
					<tr class="text-center">
						<td>${statu.index+1 }</td>
						<td>${oversea.id }</td>
						<td>${oversea.title }</td>
						<td>${oversea.child_title }</td>
						<td><c:forEach items="${financestaus }" var="sta">
								<c:if test="${sta.statu==oversea.status }">${sta.name }</c:if>
							</c:forEach></td>
						<td>${oversea.sortcolum }</td>
						<td><img src="<%=basePath%>${oversea.oversea_icon}"
							width="20" height="20"></td>
						<td>${oversea.addtime }</td>
						<td><a class="btn btn-primary btn-sm"
							href="<%=basePath%>overseaSys/overseaConfigSubscribe/${oversea.id }">查看预约</a>
							<a class="btn btn-primary btn-sm"
							href="<%=basePath%>overseaSys/overseaConfigView?id=${oversea.id }">编辑/查看</a>
						</td>
					</tr>
				</c:forEach>


			</table>


			<div class="llpage">
				<div class="in">
					<nav> <span class="count">第&nbsp;<b>${overseaConfiglist.getNumber()+1 }</b>&nbsp;页，&nbsp;共&nbsp;<b>${overseaConfiglist.getTotalPages() }</b>&nbsp;页
					</span>
					<ul class="pagination">
						<li><a class="now" href="javascript:fun(1);">首页</a></li>
						<li><a class="prev_page"
							href="javascript:fun(${overseaConfiglist.getNumber()+1-1>=1?overseaConfiglist.getNumber():overseaConfiglist.getNumber()+1 });">上页</a></li>

						<li><a class="next_page" rel="next"
							href="javascript:fun(${overseaConfiglist.getNumber()+1+1<overseaConfiglist.getTotalPages()?overseaConfiglist.getNumber()+1+1:overseaConfiglist.getTotalPages() })">下页</a></li>
						<li><a class="now"
							href="javascript:fun(${overseaConfiglist.getTotalPages() });">尾页</a></li>
					</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function fun(id) {
			$("#pageid").val(id);
			$(form1).submit();
		}
	</script>
</body>
</html>