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
                        <td style="width:180px"><input type="text" name="serialNumber" class="form-control" placeholder="流水号" value="${spRecord.serialNumber}" id="serialNumber" ></td>
                         <td style="width:80px">状态：</td>
	                    <td style="width:180px"><select name="status" class="form-control" style="width:130px;height:32px" id="status" >
	                   		<option value="">全部</option>
	                        <option value="0">未到期</option>
	                        <option value="1">审核</option>
	                        <option value="2">解冻</option>
	                        <option value="3">打款</option>
	                       	<option value="4">已付款</option>
	                    </select></td>
	                    
                         <td class="pull-right" style="padding-right:30px">
                         <button type="submit" id ="cx" class="btn btn-primary btn-sm">查询</button></td>
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
                          <td>创建时间</td>
                          <td>修改时间</td>
                          <td>结算利息</td>
                          <td>是否还款</td>
                          <td>最后计息日</td>
                          <td>操作</td>
                          </tr>
                          <c:forEach items="${spRecordpage.getContent()}" var="spRecordpage" varStatus="s">
                          <tr class="text-center">
                            <td>${s.count}</td>
                            <td>${spRecordpage.serialNumber}</td>
                            <td>${spRecordpage.amount}</td>
                            <td>
                            	<c:if test="${spRecordpage.status==0}"><font style="color: green;">未到期</font></c:if>
                            	<c:if test="${spRecordpage.status==1}"><font style="color: orange;">审核</font></c:if>
                            	<c:if test="${spRecordpage.status==2}"><font style="color: red;">解冻</font></c:if>
                            	<c:if test="${spRecordpage.status==3}"><font style="color: blue;">打款</font></c:if>
                            	<c:if test="${spRecordpage.status==4}"><font style="color: green;">已付款</font></c:if>
                            </td>
                            <td>${spRecordpage.createDate}</td>
                            <td>${spRecordpage.updateDate}</td>
                            <td>${spRecordpage.interest}</td>
                            <td>
                            	<c:if test="${spRecordpage.ispayment==0}">否</c:if>
                            	<c:if test="${spRecordpage.ispayment==1}">是</c:if>
                            </td>
                            <td>${spRecordpage.lastProfitDay}</td>
                            <td>
                            	<c:if test="${spRecordpage.status==1}">
                            		<a class="btn btn-primary btn-sm" onclick="javascript:tx(${spRecordpage.sprId},'Auditing');">审核</a>
                            	</c:if>
                            	<c:if test="${spRecordpage.status==3}">
                            		<a class="btn btn-primary btn-sm"  href="javascript:tx(${spRecordpage.sprId},'pay');">贝付打款</a>
                            	</c:if>
                            	<c:if test="${spRecordpage.status==2}">
                            		<a class="btn btn-primary btn-sm"  href="javascript:tx(${spRecordpage.sprId},'relieve');">解冻</a>
                            	</c:if>
                            	<c:if test="${spRecordpage.status==0}">未到期</c:if>
                            	<c:if test="${spRecordpage.status==4}">已付款</c:if>
                            	
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
</script>	
	
<script type="text/javascript">
	function select(){
		var status=$('#status').val();
		document.form1.submit();
	}
</script>
<script type="text/javascript">
	function tx(sprId,flag){
		$.ajax({
			 type : "POST", // 用POST方式传输
			 url:'<%=basePath%>Li/aaa',
			 data:"sprId="+sprId+"&flag="+flag,
		
			 success:function(data){
				 if(data.code ="success"){
					 alert("成功");
					 location.reload(); 
				 }else{ 
					 
					 alert("失败");
					
				 }
			 }
		 });
		
		
		
	}
</script> 
<script type="text/javascript">
document.getElementById("status").value=${status};
</script>


<!-- 容器结束 -->
</body>
</html>