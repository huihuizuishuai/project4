<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"href="<%=basePath%>/resources/sys/ying/iconfont.css">
<link rel="stylesheet"href="<%=basePath%>/resources/sys/style/bootstrap.css">
<link rel="stylesheet"href="<%=basePath%>/resources/sys/style/style.css">
<script type="text/javascript"src="<%=basePath%>/resources/sys/js/jquery.js"></script>
<title>后台首页</title>
</head>
<body>
	<div class="box-right-main">
		<h2>
			<span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>固收类/P2P
		</h2>

		<div class="tablelist">
			<form action="<%=basePath%>XIAO/main" method="post" id="form1" name="yy">
			<input type="hidden" id="page" name=page>
				<table class="table tabletop">
					<tr>
						<td style="width: 110px; padding-left: 30px">名称：</td>
						<td style="width: 180px"><input type="text"
							class="form-control" name="subjectName" placeholder="名称" value="${subject.subjectName}"></td>
						<td style="width: 80px">状态：</td>
						<td style="width: 180px"><select name="status" id="status"
							class="form-control" style="width: 130px; height: 32px">
							<option value="">全部</option>
								<c:forEach items="${status}" var="s">
									<option value="${s.pvalue}"${s.pvalue==subject.status?"selected='selected'":""}>${s.pname}</option>
								</c:forEach>
						</select></td>
						<td style="width: 80px">类型：</td>
						<td style="width: 180px"><select name="subjectType" id="type"
							class="form-control" style="width: 130px; height: 32px">
								<option value="">全部</option>
								<c:forEach items="${subjectType}" var="p">
									<option value="${p.pvalue}"${p.pvalue==subject.subjectType?"selected='selected'":""}>${p.pname}</option>
								</c:forEach>
								</select></td>
						<td class="pull-right">
							<button type="submit" class="btn btn-primary btn-sm">查询</button>
						</td>
						<td><button type="button" class="btn btn-primary btn-sm"
								onclick="$('#form1').find(':input').not(':button, :submit, :reset').val('').removeAttr('checked').removeAttr('selected');">重置</button></td>
						<td class="pull-right"><a class="btn btn-primary btn-sm"
							href="<%=basePath%>XIAO/toadd">新增</a></td>
					</tr>
				</table>
			</form>
			<table class="table table-bordered tablebox">
				<tr class="text-center" bgcolor="#f7f7f7">
					<td>序号</td>
					<td>ID</td>
					<td>合同编号</td>
					<td>类型</td>
					<td>名称</td>
					<td>标的总金额</td>
					<td>已投总金额</td>
					<td>投资期限</td>
					<td>起投金额</td>
					<td>年化收益</td>
					<td>状态</td>
					<td>可使用体验金</td>
					<td>添加时间</td>
					<td>操作</td>
				</tr>
				<c:forEach items="${page2.getContent()}" var="s" varStatus="stat">
				<tr class="text-center">
					<td>${stat.index+1}</td>
					<td>${s.subjectId}</td>
					<td>${s.serialNo}</td>
					<td>
					<c:if test="${s.subjectType==1}">固收类</c:if>
					    <c:if test="${s.subjectType==2}">p2p车贷</c:if>
					       <c:if test="${s.subjectType==3}">p2p房贷</c:if>
					</td>
					<td>${s.subjectName}</td>
					<td>${s.amount}</td>
					<td></td>
					<td>${s.period}</td>
					<td>${s.floorAmount}</td>
					<td>${s.yearRate}</td>
					<td>
					<c:if test="${s.status==1 }" >未发布</c:if>
                         <c:if test="${s.status==2 }" >募集中</c:if> 
                             <c:if test="${s.status==3 }" >回款中</c:if> 
                                  <c:if test="${s.status==4 }" >回款完成</c:if></td> 
					<td>
					<c:if test="${s.experStatus==0 }" >否</c:if>
                        <c:if test="${s.experStatus==1 }" >是</c:if></td> 
					<td>${s.createDate}</td>
					<td><a class="btn btn-primary btn-sm"
						href="<%=basePath%>XIAO/toupdate/${s.subjectId}">编辑/查看</a> <a
						class="btn btn-primary btn-sm"
						href="<%=basePath%>XIAO/subjectPurchase">查看投资</a></td>
				</tr>
				</c:forEach>
			</table>
		<div class="llpage">
		<div class="in">
			<nav>
                <span class="count">第&nbsp;<b>${page2.getNumber()+1}</b>&nbsp;页，&nbsp;共&nbsp;<b>${page2.getTotalPages()}</b>&nbsp;页</span>
				<ul class="pagination">

						<li><a class="prev_page"
						href="javascript:pageRequest(${page2.getNumber()>1?page2.getNumber():1})">上页</a>

             <c:forEach begin="1" end="${page2.getTotalPages()}" var="v">
             <li><a class="now" href="javascript:pageRequest(${v})">${v}</a></li>
             </c:forEach>
						<li><a class="next_page" rel="next"
						href="javascript:pageRequest(${page2.getNumber()<page2.getTotalPages()?page2.getNumber()+1+1:page2.getTotalPages()})">下页</a>
				</ul>
			</nav>
		</div>
	</div>
         </div>
         <!-- 内容结束 -->

	</div>

	<!-- 容器结束 -->
	<script type="text/javascript">
		function pageRequest(page){
			document.getElementById("page").value=page;
			document.yy.submit();
		}
		function resert() {
			$("#subjectType").val(-1);
			$("#status").val(-1);
		}
	</script>
</body>
</html>