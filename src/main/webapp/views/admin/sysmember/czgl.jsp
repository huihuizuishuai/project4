<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=basePath%>/resources/sys/ying/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>/resources/sys/style/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath%>/resources/sys/style/style.css">

    <script type="text/javascript" src="<%=basePath%>/resources/sys/js/jquery.js"></script>

    <link rel="stylesheet" href="<%=basePath%>/resources/date/bootstrap-datetimepicker.min.css">
    <script type="text/javascript" src="<%=basePath%>/resources/date/bootstrap-datetimepicker.js"></script>
    <script type="text/javascript" src="<%=basePath%>/resources/date/bootstrap-datetimepicker.zh-CN.js"></script>

    <title>后台首页</title>
</head>
<body>

<div class="box-right-main">
    <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>充值管理</h2>

    <div class="tablelist">
        <form action="<%=basePath%>Li/czpage" method="post" id="form1" name="form1" att="1">
        <input type="hidden" name="page" id="page">
            <table class="table tabletop">
                <tr>
                    <td style="width:110px;padding-left:30px">订单编号：</td>
                    <td style="width:180px">
                    <input type="text" class="form-control" name="serialNumber" id="serialNumber"
                                                   placeholder="订单编号" value="${mdr.serialNumber}"></td>
                    <td style="width:110px;padding-left:30px">手机号：</td>
                    <td style="width:180px"><input type="text" class="form-control" name="mobilePhone" id="mobilePhone" placeholder="手机号"
                                                   value="${members.mobilePhone}"></td>
                    <td style="width:90px">订单状态：</td>
                    <td style="width:140px"><select name="status" class="form-control" style="width:135px;height:32px"
                                                    id="status">
                        <option value="">全部</option>
                        <option value=0>充值失败</option>
                        <option value=1>充值成功</option>
                    </select></td>
                    <td style="width:110px;padding-left:30px">富友订单：</td>
                    <td style="width:180px"><input type="text" class="form-control" name="payChannelOrderNo" id="payChannelOrderNo"
                                                   placeholder="富友订单" value="${mdr.payChannelOrderNo}"></td>
                    <td class="pull-right" style="padding-right:30px">
                        <button type="submit" class="btn btn-primary btn-sm">查询</button>
                    </td>
                    <td>
                        <button type="reset" class="btn btn-primary btn-sm">重置</button>
                    </td>
                </tr>
            </table>
            </form>
      
        <table class="table table-bordered tablebox">
            <tr class="text-center" bgcolor="#f7f7f7">
                <td>序号</td>
                <td>订单编号</td>
                <td>手机号</td>
                <td>订单金额</td>
                <td>订单状态</td>
                <td>充值渠道</td>
                <td>富友手机充值订单</td>
                <td>订单时间</td>
                <td>操作</td>
            </tr>
            	<c:forEach items="${pagemember}" var="pagemember" varStatus="s">
            <tr class="text-center">
                <td>${s.count}</td>
                <td>${pagemember[1]}</td>
                <td>${pagemember[2]}</td>
                <td>${pagemember[3]}</td>
                <td>
                	<c:if test="${pagemember[4]==0}"><span style="color: red;">充值失败</span></c:if>
                	<c:if test="${pagemember[4]==1}"> <span style="color:blue;">充值成功</span</c:if>
                </td>
                <td><c:if test="${pagemember[5]=='FUIOU'}">富友</c:if></td>
                <td>${pagemember[6]}</td>
                <td>${pagemember[7]}</td>
                <td>
                	<c:if test="${pagemember[4]==0}"><a class="btn btn-primary btn-sm" href="<%=basePath%>Li/recharge/${pagemember[1]}">更新订单</a></c:if>
                	<c:if test="${pagemember[4]==1}">充值成功</c:if>
                            
                </td>
            </tr>
            	</c:forEach>
        </table>
        
        <table style="background: blue; width: 600px;">
				<tr style="background: white">
					<td align="center">当前第${page}页/共${pages }页&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-sm" href="javascript:pagerequest(1);">首页</a>&nbsp;&nbsp;&nbsp; <a
						class="btn btn-primary btn-sm" href="javascript:pagerequest(${page==1?page:page-1});">上一页</a>&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-sm" href="javascript:pagerequest(${page==pages?pages:page+1 });">下一页</a>&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-sm" href="javascript:pagerequest(${pages});">尾页</a>&nbsp;&nbsp;&nbsp; 
					</td>
				</tr>
			</table>
    </div>
    <!-- 内容结束 -->
</div>
<!-- 容器结束 -->
<script type="text/javascript">
 function pagerequest(number){
		document.getElementById("page").value = number;
		document.form1.submit();
 }


</script>
<script type="text/javascript">
	document.getElementById("status").value=${status};
</script>
</body>
</html>