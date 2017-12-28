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
	<title>投资记录-会员中心-盈+</title>
	<link href="http://www.ying158.com/images/icon.ico" type="image/x-icon" rel="shortcut icon">
	<link href="<%=basePath%>/resources/web/css/common.css" rel="stylesheet">
	<link href="<%=basePath%>/resources/web/css/jw.css" rel="stylesheet">
    <link href="<%=basePath%>/resources/web/font/iconfont.css" rel="stylesheet">
    <script src="<%=basePath%>/resources/web/js/jquery.js"></script>
    <script src="<%=basePath%>/resources/web/echart/dist/echarts.js"></script>
    
</head>
<body>
<div class="admin-right">
	<input type="hidden" id="usersname" value="${member.names }">
        	<div class="tbConBox">
                <div class="tab">
                    <a class="select" href="javascript:;">投资记录</a>
                </div>
                <div id="conBox">
                    <div class="box" style="display:block">

<div class="ajaxContainer">
	<!-- 异步内容开始 -->
	<table class="tzlist" width="100%" border="1" bordercolor="#e9e9e9" cellspacing="0" cellpadding="0">
		<tr>
			<th>订单编号</th>
			<th>标的名称</th>
			<th>金额</th>
			<th>预期收益</th>
			<th>状态</th>
			<th>购买时间</th>
		</tr>
		<c:forEach items="${sprObj }" var="spr">
		
			<tr>
				<td>${spr[0] }</td>
				<td><font color="#a58b48">${spr[1] }</font></td>
				<td><font color="#ff503f">￥${spr[2] }</font></td>
				<td>￥${spr[3] }</td>
				<td>${spr[4]==1?'待还款':'已还款' }</td>
				<td>${spr[5] }</td>
			</tr>
		
		</c:forEach>
	</table>
	<div class="listCount">总计<font color="#ff503f">${sprCount }</font>笔</div>
	
	
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
	location.href="<%=basePath%>Main/tzjl?page="+page;
}


	function getJsonInfo(url) {
		$.get(url, 'json', function(data) {
			$(".ajaxContainer").empty();
			$(".ajaxContainer").append(data);
		});
	}
</script>                    </div>
                </div>
                 <div class="tab">
                    <a class="select" href="javascript:;">预约记录</a>
                </div>
                <div id="conBox">
                    <div class="box" style="display:block">

<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="/winplus/resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

					<div class="ajaxContainer2">
						<!-- 异步内容开始 -->
						<table class="tzlist" width="100%" border="1"
							bordercolor="#e9e9e9" cellspacing="0" cellpadding="0">
							<tr>
								<th>标的名称</th>
								<th>金额</th>
								<th>预期收益</th>
								<th>状态</th>
								<th>预约时间</th>
								<th>下载</th>
							</tr>
							<c:forEach items="${fpsobj }" var="fps">
								<tr>
									<td><font color="#a58b48">${fps[1]}</font></td>
									<td><font color="#ff503f">￥${fps[2] }</font></td>
									<td>￥${fps[3]}</td>
									<td><c:if test="${fps[4]==0 }">
					签署拍照
				</c:if> <c:if test="${fps[4]==1 }">
					已签约
				</c:if> <c:if test="${fps[4]==2 }">
					审核中
				</c:if> <c:if test="${fps[4]==3 }">
					签署失败
				</c:if></td>
									<td>${fps[5] }</td>
									<td><a href="#" target="_black">查看下载</a></td>
								</tr>
							</c:forEach>
						</table>
						<div class="listCount">
							总计<font color="#ff503f">${fpsCount }</font>笔
						</div>
						<div class="llpage">
							<div class="in">
								<a href="javascript:pagerequest1(1);">首页</a> 
								<a href="javascript:pagerequest1(${page1>1?page1-1:1 });">上页</a> 
								<a class="now">${page1 }</a> 
								<a href="javascript:pagerequest1(${page1<pageCount1?page1+1:pageCount1 });">下页</a>
								<a href="javascript:pagerequest1(${pageCount1 });">尾页</a>
							</div>
						</div>
					</div>
					<script type="text/javascript">
function pagerequest1(page1){
	location.href="<%=basePath%>Main/tzjl?page1="+page1;
}
	function getJsonInfo2(url) {
		$.get(url, 'json', function(data) {
			$(".ajaxContainer2").empty();
			$(".ajaxContainer2").append(data);
		});
	}
</script>                    </div>
                </div>
            </div>
        </div>
</body>
</html>