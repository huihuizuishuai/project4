<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">

<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="/winplus/resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="renderer" content="webkit">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/winplus/resources/sys/ying/iconfont.css">
        <link rel="stylesheet" href="/winplus/resources/sys/style/bootstrap.css">
        <link rel="stylesheet" href="/winplus/resources/sys/style/style.css">
        <script type="text/javascript" src="/winplus/resources/sys/js/jquery.js"></script>
        <title>后台首页</title>
    </head>
    <body>
    <div class="box-right-main">
        <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>投资记录</h2>

        <div class="tablelist">
            <table class="table table-bordered tablebox">
                <tr class="text-center" bgcolor="#f7f7f7">
                    <td>序号</td>
                    <td>流水号</td>
                    <td>会员姓名</td>
                    <td>购买金额</td>
                    <td>结算利息</td>
                    <td>是否还款</td>
                    <td>购买时间</td>
                </tr>
                <c:forEach items="${subjects.getContent()}" var="s">
                <tr class="text-center">
                    <td>${s.subjectId}</td>
                    <td>${s.serialNumber}</td>
                  <td>
                   <c:forEach items="${mberList}" var="member">
                  <c:if test="${member.memberId==s.memberId}">
                  ${member.memberName}
                  </c:if>
                  </c:forEach>
                 </td>
                  <td>￥${s.amount}元</td>
                    <td>￥${s.interest}元</td>
                    <td>${s.ispayment}</td>
                    <td>${s.createDate}</td>
                 </tr>  
                 </c:forEach> 
            </table>
        </div>
	
	
	<div class="llpage">
		<div class="in">
			<nav>
				<span class="count">第&nbsp;<b>1</b>&nbsp;页，&nbsp;共&nbsp;<b>1</b>&nbsp;页</span>
				<ul class="pagination">

						<li><a class="prev_page">上页</a></li>


							<li><a class="now" >1</a></li>


						<li><a class="next_page" rel="next">下页</a></li>
				</ul>
			</nav>
		</div>
	</div>
        <!-- 内容结束 -->
    </div>
    <!-- 容器结束 -->
    </body>
</html>