<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">

<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="renderer" content="webkit">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="<%=basePath%>resources/sys/ying/iconfont.css">
        <link rel="stylesheet" href="<%=basePath%>resources/sys/style/bootstrap.css">
        <link rel="stylesheet" href="<%=basePath%>resources/sys/style/style.css">
        <script type="text/javascript" src="<%=basePath%>resources/sys/js/jquery.js"></script>
        <title>后台首页</title>
    </head>
    <body>
    <div class="box-right-main">
        <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>海外配置预约记录</h2>

        <div class="tablelist">
            <table class="table table-bordered tablebox">
           
                <tr class="text-center" bgcolor="#f7f7f7">
                    <td>序号</td>
                    <td>姓名</td>
                    <td>联系电话</td>
                    <td>地址</td>
                    <td>预约时间</td>
                </tr>
                 <c:forEach items="${pageSubscribe.getContent() }" var="subscribe" varStatus="index">
                 <tr class="text-center">
                        <td>${index.index+1 }</td>
                        <td>${subscribe.name }</td>
                        <td>${subscribe.phone }</td>
                        <td>${subscribe.addr }</td>
                        <td>${subscribe.create_date }</td>
                    </tr>
                 
             </c:forEach>
            </table>
        </div>
        <!-- 内容结束 -->
    </div>
    <!-- 容器结束 -->
    </body>
</html>