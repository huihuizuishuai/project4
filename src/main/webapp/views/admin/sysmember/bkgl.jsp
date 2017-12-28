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
                        <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>绑卡管理</h2>

                      <div class="tablelist">
                      <form action="<%=basePath%>Li/likebank" method="post" id="form1">
                        <table class="table tabletop">
                        <tr>
                        <td style="width:130px;padding-left:30px">手机号：</td>
                        <td style="width:180px"><input type="text" class="form-control" name="mobilePhone" placeholder="手机号" value="${members.mobilePhone}"></td>
                        <td style="width:130px;padding-left:30px">绑卡姓名：</td>
                        <td style="width:180px"><input type="text" class="form-control" name="memberName" placeholder="绑卡姓名" value="${members.memberName}"></td>
                        <td style="width:130px;padding-left:30px">绑卡卡号：</td>
                        <td style="width:180px"><input type="text" class="form-control" name="cardNo" placeholder="绑卡卡号" value="${memberBankcards.cardNo }"></td>
                        
                         <td class="pull-right" style="padding-right:30px">
                         <button type="submit" class="btn btn-primary btn-sm">查询</button></td>
                         <td><button type="reset" class="btn btn-primary btn-sm" onclick="$('#form1').find(':input').not(':button, :submit, :reset').val('').removeAttr('checked').removeAttr('selected');">重置</button></td>
                        </tr>          
                        </table>
                        </form>
                        
                        <form action="<%=basePath %>Li/updatecard" id="card" name="card" method="post">
                        	<input type="hidden" id="memberId" name="memberid" />
                        </form>
                        
                        <table class="table table-bordered tablebox">
                          <tr class="text-center" bgcolor="#f7f7f7">
                          <td>序号</td>
                          <td>手机号</td>
                          <td>绑卡人姓名</td>
                          <td>绑卡身份证</td>
                          <td>绑卡类型</td>
                          <td>绑卡卡号</td>
                          <td>绑卡地址</td>
                          <td>状态</td>
                          <td>添加时间</td>
                          <td>操作</td>
                          </tr>
                          
                          <c:forEach items="${linkbank }" var="linkbank" varStatus="s">
                          <tr class="text-center">
                            <td>${s.count}</td>
                            <td>${linkbank[1]}</td>
                            <td>${linkbank[2]}</td>
                            <td>${linkbank[3]}</td>
                            <td>
                            <c:if test="${linkbank[4]=='JSYH'}">建设银行</c:if>
							<c:if test="${linkbank[4]=='GSYH'}">工商银行</c:if>
							<c:if test="${linkbank[4]=='GDYH'}">光大银行</c:if>
							<c:if test="${linkbank[4]=='GFYH'}">广发银行</c:if>
							<c:if test="${linkbank[4]=='HXYH'}">华夏银行</c:if>
							<c:if test="${linkbank[4]=='JTYH'}">交通银行</c:if>
							<c:if test="${linkbank[4]=='MSYH'}">民生银行</c:if>
							<c:if test="${linkbank[4]=='NYYH'}">农业银行</c:if>
							<c:if test="${linkbank[4]=='PFYH'}">浦发银行</c:if>
							<c:if test="${linkbank[4]=='XYYH'}">兴业银行</c:if>
							<c:if test="${linkbank[4]=='YZYH'}">邮政银行</c:if>
                            </td>
                            <td>${linkbank[5]}</td>
                            <td>${linkbank[6]}</td>
                            <td>
                            	<c:if test="${linkbank[7]==0}">正常</c:if>
                            	<c:if test="${linkbank[7]==2}">被删除</c:if>
                            </td>
                            <td>${linkbank[8]}</td>
                            <td>
                            	<c:if test="${linkbank[7]==0}"><a href="javascript:jump(${linkbank[0]});" class="btn btn-primary btn-sm" onclick="return confirm('你确定要解绑？')">解绑银行卡</a></c:if>
                            	<c:if test="${linkbank[7]==2}">
                            		<font color="red">被删除</font>
                            	</c:if>
                            		
                            	
                            </td>
                          </tr>
                          </c:forEach>
                         
                        </table>
		
         </div>
         <!-- 内容结束 -->
	</div>
	<script type="text/javascript">
		function jump(id){
			document.forms['card'].action="/winplus/Li/updatecard?memberId="+id;
			document.forms['card'].submit();
		}

	</script> 
<!-- 容器结束 -->
</body>
</html>