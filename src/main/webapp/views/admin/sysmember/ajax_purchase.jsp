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
<div class="ajaxContainer1">
	<!-- 异步内容开始 -->
	 <table class="table table-bordered tablebox">
	 <tr style="text-align: center;background: #AFABAB;"><td colspan="7" style="padding: 10px;">投资记录</td></tr>
		<tr>
			<th width="5%">序号</th>
			<th width="15%">投资编号</th>
			<th width="15%">投资金额</th>
			<th width="15%">投资状态</th>
			<th width="15%">投资标的名称</th>
			<th width="15%">投资收益</th>
			<th width="15%">投资时间</th>
		</tr>
		<#list pageInfoPurchase.list as r>
			<tr>
				<td>${(r_index+1)!!}</td>
				<td>${(r.serialNumber)!!}</td>
				<td>${(r.amount)!!}</td>
				<td>
					<#if r.ispayment.ordinal()==0><font style="color: red;">${(r.ispayment.description)!!}</font>
					<#else><font style="color: green;">${(r.ispayment.description)!!}</font>
					</#if>
				</td>
				<td><font color="#a58b48">${(r.subject.name)!!}</font></td>
				<td>${(r.interest)!!}</td>
				<td>${r.createDate?string("yyyy-MM-dd HH:mm:ss")}</td>
			</tr>
		</#list>
	</table>
	<#include "ajax_paginate1.html" />
	<@paginate currentPage=(pageInfoPurchase.pageNum)!0 totalPage=(pageInfoPurchase.pages)!0 actionUrl="${base}/sysmember/ajaxPurchase" urlParas="&id=${(memberId)!!}"/>
</div>
<script type="text/javascript">
	function getJsonInfo1(url) {
		$.get(url, 'json', function(data) {
			$(".ajaxContainer1").empty();
			$(".ajaxContainer1").append(data);
		});
	}
</script>
</body>
</html>