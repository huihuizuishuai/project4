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
<link rel="stylesheet"
	href="<%=basePath%>/resources/sys/ying/iconfont.css">
<link rel="stylesheet" href="<%=basePath%>/resources/sys/ying/font2.css">
<link rel="stylesheet"
	href="<%=basePath%>/resources/sys/style/bootstrap.css">
<link rel="stylesheet"
	href="<%=basePath%>/resources/sys/style/style.css">
<title>盈+后台管理中心</title>
</head>
<body>
    <div class="box-right-main">
     <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>修改用户</h2>
	<form id="addAccountForm" method="post" class="form-horizontal" action="<%=basePath %>CJZ/updateUser">
		<input type="hidden" name="usersId" value="${ulist.usersId}">
           <div class="form-group">
               <label class="col-sm-3 control-label">用户名</label>
               <div class="col-lg-5">
               		<input type="hidden" name="userName" value="${ulist.userName}">
                   <input type="text" class="form-control" value="${ulist.userName}" disabled="disabled"/>
               </div>
           </div>
           <div class="form-group">
               <label class="col-sm-3 control-label">密码</label>
               <div class="col-lg-5">
                   <input type="password" class="form-control" name="usersPassword" value="${ulist.usersPassword}" />
               </div>
               <span style="color: red;padding-left: 10px;">密码不填写则不修改原账号密码</span>
           </div>
           <div class="form-group">
               <label class="col-sm-3 control-label">手机号</label>
               <div class="col-lg-5">
                   <input type="text" class="form-control" name="mobilePhone"  value="${ulist.mobilePhone}"/>
               </div>
           </div>
       	   <div class="form-group" style="display:none;" >
               <label class="col-sm-3 control-label">创建时间</label>
               <div class="col-lg-5">
                   <input type="text" class="form-control" name="createDate"  value="${ulist.createDate}"/>
               </div>
           </div>
           <div class="form-group">
                <div class="group">
                	<label class="col-sm-3 control-label">角色</label>
            	<div class="col-lg-5">
	                <select id="wy_provice"  name="userrole.userRoleId" data-bv-notempty data-bv-notempty-message="请选择角色" class="form-control">
		                <c:forEach items="${rlist }" var="c">
		                	<option value="${c.userRoleId}" ${ulist.userrole.userRoleId==c.userRoleId?"selected='selected'":""  }>${c.cname }</option>
	                	</c:forEach>
	                </select>
           		</div>
                </div>
           </div>
            <div class="form-group">
             <label class="col-sm-3 control-label"></label>
                <div class="col-lg-5">
                 <button type="submit" class="btn btn-primary btn-sm">确认</button>
            	</div>
           </div>
      </form>  
    </div>
<script type="text/javascript">

</script>
</body>
</html>