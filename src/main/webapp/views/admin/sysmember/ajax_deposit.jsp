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
<div class="ajaxContainer3">
	<!-- 异步内容开始 -->
	 <table class="table table-bordered tablebox">
	 <tr style="text-align: center;background: #AFABAB;"><td colspan="7" style="padding: 10px;">充值记录</td></tr>
		<tr>
			<th width="5%">序号</th>
			<th width="15%">充值编号</th>
			<th width="15%">充值金额</th>
			<th width="15%">充值状态</th>
			<th width="15%">充值渠道</th>
			<th width="15%">充值渠道编号</th>
			<th width="15%">充值时间</th>
		</tr>
			<tr>
				<td>${memberDepositRecord.mdrId}</td>
				<td>${memberDepositRecord.serialNumber}</td>
				<td>${memberDepositRecord.amount}</td>
				<td><font color="red">${memberDepositRecord.status==0?"待付款":"完成"}</font></td>
				<td><font color="#a58b48">${memberDepositRecord.payChannelName}</font></td>
				<td>${memberDepositRecord.payChannelOrderNo}</td>
				<td>${memberDepositRecord.createDate}</td>
			</tr>
	</table>

</div>

</body>
</html>