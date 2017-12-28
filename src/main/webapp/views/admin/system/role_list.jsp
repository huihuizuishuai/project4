<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%=basePath %>/resources/sys/ying/iconfont.css">
	<link rel="stylesheet" href="<%=basePath %>/resources/sys/ying/font2.css">
	<link rel="stylesheet" href="<%=basePath %>/resources/sys/style/bootstrap.css">
	<link rel="stylesheet" href="<%=basePath %>/resources/sys/style/style.css">
	<title>盈+后台管理中心</title>
</head>
<body>
                     <div class="box-right-main">
                        <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>角色管理</h2>
                      <div class="tablelist">
                        <table class="table tabletop">
                        <tr>
                         <td class="pull-right" style="padding-right:30px">
                         <button type="button" onclick="jump();" class="btn btn-primary btn-sm add">新增</button>
                         </td>
                        </tr>     
                        </table>
                     <table class="table table-bordered tablebox">
                       <tr class="text-center" bgcolor="#f7f7f7">
                         <td>序号</td>
				         <td>角色名</td>
				         <td>角色描述</td>
				         <td>创建时间</td>
				          <td>菜单配置</td>
				      </tr>
				      <c:forEach items="${rlist }" var="role" varStatus="vs">
					      <tr class="text-center">
					         <td>${vs.index+1  }</td>
					         <td>${role.cname  }</td>
					         <td>${role.remark  }</td>
					         <td>${role.createDate  }</td>
							 <td><a href="<%=basePath %>CJZ/permission" class="btn btn-primary btn-sm">菜单配置</a></td>
					      </tr>
					      </c:forEach>
					</table>
         </div>
         <!-- 内容结束 -->
	</div>
<!-- 容器结束 -->
</body>
<script type="text/javascript">
function jump() {
	window.location.href="roleadd";
};
</script>
</html>