<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,maximum-scale=1.0,user-scalable=yes">
	<title>体验金记录-会员中心-盈+</title>
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
                <a class="select" href="javascript:;">体验金记录</a>
            </div>
            <div id="conBox">
                <div class="box" style="display:block">
                    <div class="remind"><h4><strong><span style="color:#827E76">体验金余额(元)：
                    </span><span style="color:#9d8440">${tyjObj[0]==null?0.00:tyjObj[0] }</span>&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="<%=basePath%>Main/subject" target="#">立即使用</a>
                        </strong></h4></div>
				<c:if test="${yanzheng != 0 }">
                    <div>
                        <table class="tzlist" width="100%" border="1" bordercolor="#e9e9e9" cellspacing="0"
                               cellpadding="0">
                            <tr>
                                <td>标的名称</td>
                                <td style="color:#9d8440;">${tyjObj[1] }</td>
                                <td>状态</td>
                                <td style="color:#9d8440;">${tyjObj[6]==1?'持有中':'未持有' }</td>
                            </tr>
                            <tr>
                                <td>投资金额</td>
                                <td style="color:#9d8440;">￥${tyjObj[2] }</td>
                                <td>期限</td>
                                <td style="color:#9d8440;">${tyjObj[7] }天</td>
                            </tr>
                            <tr>
                                <td>收益方式</td>
                                <td style="color:#9d8440;">${tyjObj[3]==1?'一次性还款付息':'' }</td>
                                <td>年化收益率</td>
                                <td style="color:#9d8440;">${tyjObj[8] }%</td>
                            </tr>
                            <tr>
                                <td>计息日</td>
                                <td style="color:#9d8440;">${tyjObj[4] }</td>
                                <td>预期收益</td>
                                <td style="color:#9d8440;">￥<f:formatNumber pattern="0.00">${tyjObj[2]*tyjObj[7]*tyjObj[8]*0.0001}</f:formatNumber></td>
                            </tr>
                            <tr>
                                <td>结束日</td>
                                <td style="color:#9d8440;">${tyjObj[5] }</td>
                                <td>已获收益</td>
                                <td style="color:#9d8440;"><f:formatNumber pattern="0.00">${tyjObj[9] }</f:formatNumber>元</td>
                            </tr>
                        </table>
                    </div>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</body>
</html>