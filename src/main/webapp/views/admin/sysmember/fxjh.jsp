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
        <title>后台首页</title>
    </head>
    <body>
    <div class="box-right-main">
        <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>付息计划</h2>

        <div class="tablelist">
        <form action="<%=basePath%>Li/subject" method="post" id="form1" name="subjectform">
        <input type="hidden" name="page" id="page">
            <table class="table tabletop">
                <tr>
                    <td style="width:110px;padding-left:30px">名称：</td>
                    <td style="width:180px"><input type="text" class="form-control" name="name" placeholder="名称" value="${subject.subjectName}"></td>
                    <td style="width:80px">状态：</td>
                    <td style="width:180px"><select name="status" class="form-control" style="width:130px;height:32px" id="status">
                   		<option value="">全部</option>
                        <option value="0">未发布</option>
                        <option value="1">募集中</option>
                        <option value="2">回款中</option>
                        <option value="3">还款完成</option>
                    </select></td>
                    <td style="width:80px">类型：</td>
                    <td style="width:180px"><select name="subjectType" class="form-control" style="width:130px;height:32px" id="subjectType">
                    	<option value="">全部</option>
                        <option value="1">固收类</option>
                        <option value="2">P2P车贷</option>
                        <option value="3">P2P房贷</option>
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
                    <td>合同编号</td>
                    <td>标的类别</td>
                    <td>标的名称</td>
                    <td>标的总金额</td>
                    <td>已投金额</td>
                    <td>已投人数</td>
                    <td>标的期限</td>
                    <td>年化收益</td>
                    <td>标的状态</td>
                    <td>可体验金购买</td>
                    <td>操作</td>
                </tr>
                	<c:forEach items="${subjectpage.getContent()}" var="subjectpage" varStatus="s">
                    <tr class="text-center">
                        <td>${s.count}</td>
                        <td>${subjectpage.serialNo}</td>
                        <td>
                        <c:if test="${subjectpage.subjectType==1}">固收类</c:if>
                        <c:if test="${subjectpage.subjectType==2}">P2P车贷</c:if>
                        <c:if test="${subjectpage.subjectType==3}">P2P房贷</c:if>
                        </td>
                        <td>${subjectpage.subjectName}</td>
                        <td>${subjectpage.amount}元</td>
                        <td>${subjectpage.floorAmount}元</td>
                        <td>${subjectpage.bought}</td>
                        <td>${subjectpage.period}</td>
                        <td>${subjectpage.yearRate}</td>
                        <td>
                        	<c:if test="${subjectpage.status==0}"><font color="orange">未发布</font></c:if>
                        	<c:if test="${subjectpage.status==1}"><font color="red">募集中</font></c:if>
                        	<c:if test="${subjectpage.status==2}"><font color="blue">回款中</font></c:if>
                        	<c:if test="${subjectpage.status==3}"><font color="green">还款完成</font></c:if> 	
                        </td>
                        <td>
                        	<c:if test="${subjectpage.experStatus==0}">否</c:if>
                        	<c:if test="${subjectpage.experStatus==1}">是</c:if>
                        </td>
                        <td>
                        	<c:if test="${subjectpage.experStatus==1}">
                        	<a href="<%=basePath %>/views/admin/sysmember/fxjh_bbin_content.jsp" class="btn btn-primary btn-sm">体验金付息</a><a href="<%=basePath %>Li/likesp?subjectId=${subjectpage.subjectId}" class="btn btn-primary btn-sm">付息列表</a>	
							</c:if>
                          <c:if test="${subjectpage.experStatus==0}">
							<a href="<%=basePath %>Li/likesp?subjectId=${subjectpage.subjectId}" class="btn btn-primary btn-sm">付息列表</a>	
							</c:if>
                        </td>
                    </tr>
              	 </c:forEach>
            </table>
            <!-- 分页 -->
            <table style="background: blue; width: 600px;">
				<tr style="background: white">
					<td align="center">当前第${subjectpage.getNumber()+1 }页/共${subjectpage.getTotalPages() }页&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-sm"
						href="javascript:pagerequest(1);">首页</a>&nbsp;&nbsp;&nbsp; <a
						class="btn btn-primary btn-sm"
						href="javascript:pagerequest(${subjectpage.getNumber()>1?subjectpage.getNumber():1 });">上一页</a>&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-sm"
						href="javascript:pagerequest(${subjectpage.getNumber()<subjectpage.getTotalPages()-1?subjectpage.getNumber()+1+1:subjectpage.getTotalPages() });">下一页</a>&nbsp;&nbsp;&nbsp;
						<a class="btn btn-primary btn-sm"
						href="javascript:pagerequest(${subjectpage.getTotalPages() });">尾页</a>&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
 
        </div>
        <!-- 内容结束 -->
    </div>
    <!-- 容器结束 -->
    <script type="text/javascript">
    function pagerequest(page) {
		document.getElementById("page").value = page;
		document.subjectform.submit();
	}
    document.getElementById("subjectType").value=${subjectType};
    </script>
    </body>
</html>