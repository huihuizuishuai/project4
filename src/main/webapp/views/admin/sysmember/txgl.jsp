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
        <script type="text/javascript" src="<%=basePath%>/resources/sys/js/bootstrap.js"></script>
        
        <link rel="stylesheet" href="<%=basePath%>/resources/date/bootstrap-datetimepicker.min.css">
        <script type="text/javascript" src="<%=basePath%>/resources/date/bootstrap-datetimepicker.js"></script>
        <script type="text/javascript" src="<%=basePath%>/resources/date/bootstrap-datetimepicker.zh-CN.js"></script>
        <title>后台首页</title>
    </head>
<body>

                     <div class="box-right-main">
                        <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>提现管理</h2>

                      <div class="tablelist">
                      	<form action="<%=basePath%>Li/spr" method="post" id="form1" name="form1">
                      	<input type="hidden" id="page" name="page" /> 
                        <table class="table tabletop">
                        <tr>
                        <td style="width:110px;padding-left:30px">流水号：</td>
                        <td style="width:180px"><input type="text" name="serialNumber" class="form-control" placeholder="流水号" value="${spRecord.serialNumber}" id="serialNumber"></td>
                         <td style="width:80px">状态：</td>
	                    <td style="width:180px"><select name="status" class="form-control" style="width:130px;height:32px" id="status">
	                   		<option value="">全部</option>
	                        <option value="0">待审核</option>
	                        <option value="1">已付款</option>
	                        <option value="2">打款中</option>
	                        <option value="3">打款失败</option>
	                       	<option value="4">已解冻</option>
	                    </select></td>
	                    <td style="width:80px">是否还款</td>
	                    <td style="width:180px"><select name="delflag" class="form-control" style="width:130px;height:32px" id="delflag">
	                   		<option value="">全部</option>
	                        <option value="0">否</option>
	                        <option value="1">是</option>
	                    </select></td>
                         <td class="pull-right" style="padding-right:30px">
                         <button type="submit" class="btn btn-primary btn-sm">查询</button></td>
	                    <td><button type="button" class="btn btn-primary btn-sm" onclick="$('#form1').find(':input').not(':button, :submit, :reset').val('').removeAttr('checked').removeAttr('selected');">重置</button></td>
	                 	 </tr>    
                        </table>
                        </form>
                        <table class="table table-bordered tablebox">
                          <tr class="text-center" bgcolor="#f7f7f7">
                          <td>序号</td>
                          <td>流水号</td>
                          <td>购买金额</td>
                          <td>状态</td>
                          <td>提现时间</td>
                          <td>修改时间</td>
                          <td>结算利息</td>
                          <td>是否还款</td>
                          <td>最后计息日</td>
                          <td>账号详细</td>
                          <td>操作</td>
                          </tr>
                          <c:forEach items="${spRecordpage.getContent()}" var="spRecordpage" varStatus="s">
                          <tr class="text-center">
                            <td>${s.count}</td>
                            <td>${spRecordpage.serialNumber}</td>
                            <td>${spRecordpage.amount}</td>
                            <td>
                            	<c:if test="${spRecordpage.delflag==0}"><font style="color: orange;">待审核</font></c:if>
                            	<c:if test="${spRecordpage.delflag==1}"><font style="color: green;">已付款</font></c:if>
                            	<c:if test="${spRecordpage.delflag==2}"><font style="color: blue;">打款中</font></c:if>
                            	<c:if test="${spRecordpage.delflag==3}"><font style="color: red;">打款失败</font></c:if>
                            	<c:if test="${spRecordpage.delflag==4}"><font style="color: green;">已解冻</font></c:if>
                            </td>
                            <td>${spRecordpage.createDate}</td>
                            <td>${spRecordpage.updateDate}</td>
                            <td>${spRecordpage.interest}</td>
                            <td>
                            	<c:if test="${spRecordpage.ispayment==0}">否</c:if>
                            	<c:if test="${spRecordpage.ispayment==1}">是</c:if>
                            </td>
                            <td>${spRecordpage.lastProfitDay}</td>
                            <td><a class="btn btn-primary btn-sm" href="<%=basePath%>">账号详细</a></td>
                            <td>
                            	<c:if test="${spRecordpage.delflag==0}">
                            		<a class="btn btn-primary btn-sm" href="<%=basePath%>Li/updates1/${spRecordpage.serialNumber}" onclick="return confirm('你确定要审核通过吗')">审核</a>
                            	</c:if>
                            	<c:if test="${spRecordpage.delflag==2}">
                            		<a class="btn btn-primary btn-sm" href="<%=basePath%>Li/updates2/${spRecordpage.serialNumber}" onclick="return confirm('你确定要贝付打款吗')">贝付打款</a>
                            	</c:if>
                            	<c:if test="${spRecordpage.delflag==3}">
                            		<a class="btn btn-primary btn-sm" href="<%=basePath%>Li/updates3/${spRecordpage.serialNumber}" onclick="return confirm('你确定要解冻吗')">解冻</a>
                            	</c:if>
                            	<c:if test="${spRecordpage.delflag==1}"><font style="color: green;">已付款</font></c:if>
                            	<c:if test="${spRecordpage.delflag==4}"><font style="color: green;">已解冻</font></c:if>
                            </td>
                          	</tr>
                          	</c:forEach>
                        </table>
                        <table style="background: blue; width: 600px;">
				<tr style="background: white">
					<td align="center">当前第${spRecordpage.getNumber()+1 }页/共${spRecordpage.getTotalPages() }页&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-sm"
						href="javascript:pagerequest(1);">首页</a>&nbsp;&nbsp;&nbsp; <a
						class="btn btn-primary btn-sm"
						href="javascript:pagerequest(${spRecordpage.getNumber()>1?spRecordpage.getNumber():1 });">上一页</a>&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-sm"
						href="javascript:pagerequest(${spRecordpage.getNumber()<spRecordpage.getTotalPages()-1?spRecordpage.getNumber()+1+1:spRecordpage.getTotalPages() });">下一页</a>&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-sm"
						href="javascript:pagerequest(${spRecordpage.getTotalPages() });">尾页</a>&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>

         </div>

         <!-- 内容结束 -->

	</div>


<script type="text/javascript">
function pagerequest(page) {
	document.getElementById("page").value = page;
	document.form1.submit();
}
document.getElementById("status").value=${status};
document.getElementById("delflag").value=${delflag};

</script>
<!-- 容器结束 -->
</body>
</html>