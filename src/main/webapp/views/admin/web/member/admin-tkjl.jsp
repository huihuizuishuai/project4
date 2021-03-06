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
	<title>提款记录-会员中心-盈+</title>
	<link href="http://www.ying158.com/images/icon.ico" type="image/x-icon" rel="shortcut icon">
	<link href="<%=basePath%>/resources/web/css/common.css" rel="stylesheet">
	<link href="<%=basePath%>/resources/web/css/jw.css" rel="stylesheet">
    <link href="<%=basePath%>/resources/web/font/iconfont.css" rel="stylesheet">
    <script src="<%=basePath%>/resources/web/js/jquery.js"></script>
    <script src="<%=basePath%>/resources/web/echart/dist/echarts.js"></script>
</head>
<body>
 <div class="admin-right">
        	<div class="tbConBox">
                <div class="tab">
                    <a class="select" href="javascript:;">提款记录</a>
                </div>
                <div id="conBox">
                    <div class="box" style="display:block">


<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="/winplus/resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<div class="ajaxContainer">
	<table class="tzlist" width="100%" border="1" bordercolor="#e9e9e9" cellspacing="0" cellpadding="0">
		<tr>
			<th width="20%">时间</th>
			<th width="30%">订单号</th>
			<th width="20%">金额</th>
			<th width="10%">状态</th>
		</tr>
		<c:forEach items="${mwrObj }" var="mwrObj">
			<tr>
				<td>${mwrObj[10] }</td>
				<td>${mwrObj[1] }</td>
				<td><font color="#ff503f">￥${mwrObj[3] }</font></td>
				<td>
					<c:if test="${mwrObj[6]==0}">
						待审核
					</c:if>
					<c:if test="${mwrObj[6]==1}">
						已打款
					</c:if>
					<c:if test="${mwrObj[6]==2}">
						打款中
					</c:if>
					<c:if test="${mwrObj[6]==3}">
						打款失败
					</c:if>
				</td>
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
	<script type="text/javascript">
	function pagerequest(page){
		location.href="<%=basePath%>Main/tkjl?page="+page;
	}
	</script>
</body>
</html>