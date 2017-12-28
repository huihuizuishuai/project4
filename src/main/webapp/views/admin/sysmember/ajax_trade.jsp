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
        <link rel="stylesheet" href="<%=basePath%>/resources/sys/ying/iconfont.css">
        <link rel="stylesheet" href="<%=basePath%>/resources/sys/style/bootstrap.css">
        <link rel="stylesheet" href="<%=basePath%>/resources/sys/style/style.css">
        <script type="text/javascript" src="<%=basePath%>/resources/sys/js/jquery.js"></script>
        <link href="<%=basePath%>/resources/web/css/jw.css" rel="stylesheet">
        <title>后台首页</title>
    </head>
<body>
<div class="ajaxContainer">
	<!-- 异步内容开始 -->
	 <table class="table table-bordered tablebox">
	 <tr style="text-align: center;background: #AFABAB;"><td colspan="7" style="padding: 10px;">钱包记录</td></tr>
		<tr>
			<th width="5%">序号</th>
			<th width="15%">交易编号</th>
			<th width="15%">交易金额</th>
			<th width="15%">交易状态</th>
			<th width="15%">交易分类</th>
			<th width="15%">交易名称</th>
			<th width="15%">交易时间</th>
		</tr>
		
			<tr>
				<td>${memberTradeRecord.mtrId}</td>
				<td>${memberTradeRecord.tradeNo}</td>
				<td>${memberTradeRecord.amount}</td>
				<td><font color="red">${memberTradeRecord.tradeStatus==0?"交易中":"交易完成"}</font></td>
				<td><font color="#a58b48">${memberTradeRecord.tradeType}</font></td>
				<td>${memberTradeRecord.tradeName}</td>
				<td>${memberTradeRecord.createDate}</td>
			</tr>
		
	</table>
	
</div>

</body>
</html>