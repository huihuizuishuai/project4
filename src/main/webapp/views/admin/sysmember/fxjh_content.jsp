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
                        <table class="table tabletop">
                      
                        <tr>
                        <td style="padding-left:30px">  标的名称：p2p 
                        				&nbsp; &nbsp; &nbsp; &nbsp;  标的期限：5天
                        				&nbsp; &nbsp; &nbsp; &nbsp;  年化收益率：7%</td>
                        </tr>     
                        
                       </table>
                        
                        <form action="<%=basePath %>Li/updatesp" id="formsp" name="formsp" method="post"></form>
                        
                        <table class="table table-bordered tablebox">
                         
                          <tr class="text-center" bgcolor="#f7f7f7">
                          <td>序号</td>
                          <td>流水号</td>
                          <td>投资人手机号</td>
                          <td>投资人姓名</td>
                          <td>投资人身份证</td>
                          <td>投资金额</td>
                          <td>还款利息+本金=本息</td>
                          <td>投资时间</td>
                          <td>还款时间</td>
                          <td>还款状态</td>
                          <td>操作</td>
                          </tr>
                          
                          <c:forEach items="${likesp}" var="likesp" varStatus="s">
                    <tr class="text-center">
                        <td>${s.count}</td>
                        <td>${likesp[1]}</td>
                        <td>${likesp[2]}</td>
                        <td>${likesp[3]}</td>
                        <td>${likesp[4]}</td>
                        <td>${likesp[5]}元</td>
                        <td><span style="color: red;">${likesp[6]}</span>+
                        	<span style="color: red;">${likesp[5]}</span>=
                        	<span style="color: blue;">${likesp[7]}</span>元
                        </td>
                        <td>${likesp[8]}</td>
                        <td>${likesp[9]}</td>
                        <td>
                        <c:if test="${likesp[10]==0}"><font color="red">未还款</font></c:if>
                        <c:if test="${likesp[10]==1}"><font color="blue">已还款</font></c:if>
                        </td>
                        <td>
                        <c:if test="${likesp[10]==1}"><a href="" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a></c:if>
                        <c:if test="${likesp[10]==0}"><a href="javascript:jump(${likesp[0]});" class="btn btn-primary btn-sm">立即还款</a></c:if>
                        	
                        	
                        </td>
                    </tr>
                    </c:forEach>
            </table>
         </div>

         <!-- 内容结束 -->

  </div>
<!-- 容器结束 -->
<script type="text/javascript">
	function jump(id){
		document.forms['formsp'].action="/winplus/Li/updatesp?memberId="+id;
		document.forms['formsp'].submit();
		
	}
</script>
</body>
</html>