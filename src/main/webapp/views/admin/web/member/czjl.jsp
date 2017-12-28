<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,maximum-scale=1.0,user-scalable=yes">
	<title>充值记录-会员中心-盈+</title>
	<link href="http://www.ying158.com/images/icon.ico" type="image/x-icon" rel="shortcut icon">
	<link href="<%=basePath%>/resources/web/css/common.css" rel="stylesheet">
	<link href="<%=basePath%>/resources/web/css/jw.css" rel="stylesheet">
    <link href="<%=basePath%>/resources/web/font/iconfont.css" rel="stylesheet">
    <script src="<%=basePath%>/resources/web/js/jquery.js"></script>
    <script src="<%=basePath%>/resources/web/echart/dist/echarts.js"></script>
</head>
<body>
<div class="ajaxContainer">
	<table class="tzlist" width="100%" border="1" bordercolor="#e9e9e9" cellspacing="0" cellpadding="0">
		<tr>
			<th width="30%">订单号</th>
			<th width="20%">金额</th>
			<th width="20%">状态</th>
			<th width="30%">时间</th>
		</tr>
		<c:forEach items="${mdrObj }" var="mdrObj">
			<tr>
				<td>${mdrObj[1] }</td>
				<td><font color="#ff503f">￥${mdrObj[3] }</font></td>
				<td>${mdrObj[4]==0?'充值失败':'充值成功' }</td>
				<td>${mdrObj[8] }</td>
			</tr>
		</c:forEach>
	</table>
	
	
	<div class="llpage">
		<div class="in">
			<a href="javascript:pagerequest(1);">首页</a>
				<a href="javascript:pagerequest(${page>1?page-1:1 });">上页</a>
					<a class="now" >${page }</a>
				<a href="javascript:pagerequest(${page<pageCount?page+1:pageCount });">下页</a>
				<a href="javascript:pagerequest(${pageCount });">尾页</a>
		</div>
	</div>
	</div>
	<script type="text/javascript">
	function pagerequest(page){
		location.href="<%=basePath%>Main/czjl?page="+page;
	}
	</script>
</body>
</html>