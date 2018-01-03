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
                        <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>体验金付息计划</h2>

                      <div class="tablelist">
                        <table class="table tabletop">
                       
                        </table>
                        
                        <form action="<%=basePath %>Li/updatessb" id="form2" name="form2" method="post"></form>
                        
                        <table class="table table-bordered tablebox">
                        	
                       	 <tr>	<c:forEach items="${likesb}" var="likesb">
                          <td style="padding-left:30px">标的名称：p2p &nbsp; &nbsp; &nbsp; &nbsp;  标的期限：7天&nbsp; &nbsp; &nbsp; &nbsp;  年化收益率：5%</td>
                        	</c:forEach> 
                       	 </tr>  
                       	 	  
                          <tr class="text-center" bgcolor="#f7f7f7">
                          <td>序号</td>
                          <td>流水号</td>
                          <td>投资人手机号</td>
                          <td>投资人姓名</td>
                          <td>投资人身份证</td>
                          <td>投资体验金</td>
                          <td>还款利息</td>
                          <td>还款时间</td>
                          <td>还款状态</td>
                          <td>操作</td>
                          </tr>
                          
                    <tr class="text-center">
                        <td>1</td>
                        <td>201601220533418626</td>
                        <td>13871196322</td>
                        <td>小你鱼</td>
                        <td>420621199812255433</td>
                        <td><span style="color: blue;">1000</span>元</td>
                        <td><span style="color: red;">0.325</span>元</td>
                        <td>2016-01-02：10:03</td>
                        <td>
                        <span style="color: blue;">已还款</span>
                        </td>
                        <td>
                        <a href="javascript:" class="btn btn-primary btn-sm" style="background-color: #8393A1;">已还款</a>
                        </td>
                    </tr>
            </table>
         </div>

         <!-- 内容结束 -->

  </div>
<!-- 容器结束 -->
<script type="text/javascript">
	function jump(id){
		document.forms['form2'].action="/winplus/Li/updatessb?memberId="+id;
		document.forms['form2'].submit();
	}
</script>

</body>
</html>