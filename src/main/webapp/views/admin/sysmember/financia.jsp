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
        <link rel="stylesheet" href="<%=basePath%>/resources/date/bootstrap-datetimepicker.min.css">
		<script type="text/javascript" src="<%=basePath%>/resources/date/bootstrap-datetimepicker.js"></script>
		<script type="text/javascript" src="<%=basePath%>/resources/date/bootstrap-datetimepicker.zh-CN.js"></script>
        <title>后台首页</title>
    </head>
<body>

                     <div class="box-right-main">
                        <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>理财师管理</h2>

                      <div class="tablelist">
                      	<form action="<%=basePath%>Li/planner" method="post" id="form1">
                        <table class="table tabletop">
                        <tr>
                        <td style="width:110px;padding-left:30px">手机号：</td>
                        <td style="width:180px"><input type="text"  name="mobilePhone" id="mobilePhone" class="form-control" placeholder="手机号" value="${members.mobilePhone }"></td>
                        <td style="width:110px;padding-left:30px">真实姓名：</td>
                        <td style="width:180px"><input type="text" class="form-control" name="memberName" id="memberName" placeholder="真实姓名" value="${members.memberName }"></td>
                        <td style="width:110px;padding-left:30px">状态：</td>
                        <td style="width:180px">
                        	<select name="status" class="form-control" style="width:130px;height:32px" id="status">
		                   		<option value="">全部</option>
		                        <option value="0">待审核</option>
		                        <option value="1">认证成功</option>
		                        <option value="2">认证失败</option>
		                    </select>
                        </td>
                       
                         <td class="pull-right" style="padding-right:30px">
                         <button type="submit" class="btn btn-primary btn-sm">查询</button></td>
                         <td><button type="reset" class="btn btn-primary btn-sm" onclick="reset();" >重置</button></td>
                        </tr>     
                        </table>
                        </form>
                        
                        <form id="form1" name="formname" method="post" action="<%=basePath%>Li/toupdate">                     
                        	<input type="hidden" id="memberId" name="memberid" />
                        	
                        </form>
                        <table class="table table-bordered tablebox">
                          <tr class="text-center" bgcolor="#f7f7f7">
                          <td>序号</td>
                          <td>手机号</td>
                          <td>真实姓名</td>
                          <td>机构名称</td>
                          <td>我的名片</td>
                          <td>邮寄地址</td>
                          <td>状态</td>
                          <td>注册时间</td>
                          <td>操作</td>
                          </tr>
                          
                          <c:forEach items="${likeplanner}" var="likeplanner" varStatus="s">
                          <tr class="text-center">
                            <td>${s.count}</td>
                            <td>${likeplanner[1]}</td>
                            <td>${likeplanner[2]}</td>
                                                                              
                            
                            <td>${likeplanner[3]}</td>
                            
                            <td> 
                            <a href="<%=basePath%>/${likeplanner[4]}" target="_black">查看</a>
                            
                            </td>
                            
                            <td>${likeplanner[5]}</td>
                            
                           
                          
                            <td>
                            	<c:if test="${likeplanner[6]==0}">
                            		<c:out value="待审核"></c:out>
                            	</c:if>
                            	<c:if test="${likeplanner[6]==1}">                            	
                            		<c:out value="认证成功"></c:out>
                            	</c:if>
                            	<c:if test="${likeplanner[6]==2}"><font color="red">认证失败</font></c:if>
                            </td>
                            <td>${likeplanner[7]}</td>
                            <td id="statu">
                            	<c:if test="${likeplanner[6]!=1}"><a class="btn btn-primary btn-sm"  href="javascript:jump(${likeplanner[0]});">审核</a></c:if>
                            	<c:if test="${likeplanner[6]==1}">
                            		<font color="green">已认证</font>
                            	</c:if>
                            	
                            </td>
                          </tr>
                          </c:forEach>
                        </table>

         </div>

         <!-- 内容结束 -->
<script type="text/javascript">
	function reset(){
		document.getElementById("mobilePhone").value="";
		document.getElementById("memberName").value="";
		document.getElementById("status").value="";
		
	}
	
	
	function jump(id){
		document.forms['form1'].action = "/winplus/Li/toupdate?memberId="+id;
	    document.forms['form1'].submit();  
	}

		</script> 
		
		<script type="text/javascript">
		document.getElementById("status").value=${status};
		</script>
	</div>
<!-- 容器结束 -->
</body>
</html>