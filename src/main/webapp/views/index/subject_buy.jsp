<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="renderer" content="webkit">
<meta name="viewport"
	content="width=device-width,maximum-scale=1.0,user-scalable=yes">
<meta name="Keywords" content="股指体验交易，股指单手交易，股指多手交易">
<meta name="description" content="申请实盘交易账户，直接进行实盘交易。">
<title>我的加法库 - 盈+</title>

<meta name="keywords"
	content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico"
	type="image/x-icon" rel="shortcut icon">

<link href="<%=basePath%>resources/web/font/iconfont.css"
	rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">

<script src="<%=basePath%>resources/web/js/jquery.js"></script>
<script type="text/javascript"
	src="<%=basePath%>resources/web/layer/layer.js"></script>
<script src="<%=basePath%>resources/web/echart/dist/echarts.js"></script>
<link
	href="<%=basePath%>resources/web/fancybox/jquery.fancybox-1.3.4.css"
	rel="stylesheet">
<script
	src="<%=basePath%>resources/web/fancybox/jquery.fancybox-1.3.4.js"></script>

<script>
        $(function () {
            $(".picList a").fancybox({
                'transitionIn': 'none',
                'transitionOut': 'none',
                'titlePosition': 'over',
                'titleFormat': function (title, currentArray, currentIndex, currentOpts) {
                    return '<span id="fancybox-title-over">Image ' + (currentIndex + 1) + ' / ' + currentArray.length + (title.length ? ' &nbsp; ' + title : '') + '</span>';
                }
            });
            $("#mytext").keyup(function () {
                var txt = parseInt($(this).val());
                if (txt >= 10) {
                    $("#count").show(100);
                    var lx = $("#num").attr("data-num");
                    var lr = txt * lx;
                    $("#num").text(lr.toFixed(2));
                } else {
                    $("#count").hide(100);
                }
            })
            $("#mytext").focus(function () {
                $("#count").hide(100);
            })
        })


    </script>
</head>
<body>

	<div class="logo container">
		<div class="row">
			<div class="logoImg">
				<a href="http://www.ying158.com/home"><img
					src="<%=basePath%>resources/web/images/logo2.png"
					onmouseover="this.src = '<%=basePath%>resources/web/images/logo1.png'"
					onmouseout="this.src = '<%=basePath%>resources/web/images/logo2.png'"></a>
			</div>
			<div class="telInfo">
				<img src="<%=basePath%>resources/web/images/400Icon.png"
					onmousemove="this.src = '<%=basePath%>resources/web/images/400IconActive.png'"
					onmouseout="	this.src = '<%=basePath%>resources/web/images/400Icon.png'">
				<div class="detail">
					<c:if test="${member.names == null }">
						<a
							style="font-size: 18px; float: right; margin-top: 5px; color: #917739;"
							href="<%= basePath%>Main/login">登录</a>
						<a
							style="font-size: 18px; float: right; margin-right: 15px; margin-top: 5px; color: #917739;"
							href="<%= basePath%>Main/regis">注册</a>
					</c:if>
					<c:if test="${member.names != null }">
						<div
							style="font-size: 16px; float: right; margin-top: 5px; color: #917739;">
							欢迎${member.names },<a href="<%=basePath%>Main/toVipList">[会员中心]</a>,<a
								href="<%=basePath%>Main/logout">[退出]</a>
						</div>
					</c:if>
					<br>4000-999-158
				</div>
			</div>
		</div>
	</div>
	<div class="jwNav">
		<div class="container">
			<div class="row">
				<ul class="topNav">
					<li><a class="item first" href="http://www.ying158.com/home">
							首页 </a></li>
					<li><a class="item" href="http://www.ying158.com/home/kcenter">
							网上体验中心 </a></li>
					<li class="item"><a class="item"
						href="<%=basePath%>Main/subject"> 产品中心 </a></li>
					<li><a class="item"
						href="http://www.ying158.com/Home/NewsCenter"> 新闻中心 </a></li>
					<li><a class="item" href="/mobileappdownload"> 下载中心 </a></li>
					<li><a class="item " href="http://www.ying158.com/Home/Help">
							盈+商学院 </a></li>
					<li><a class="item"
						href="http://ying158.com/UserGuide/TradingSoftware"> 投研中心 </a></li>
					<li><a class="item last"
						href="http://pro.ying158.com/account/trades/profit/records">
							我的加法库 </a></li>



				</ul>
			</div>
		</div>
	</div>
	<script type="text/javascript">
    $(function(){
        function showIn(url){
            var info="<div class='mydig'><div class='bg'></div><div class='imgbox'><a href="+url+"></a></div></div>";
            $('body').append(info);
        }

    });

</script>
	<div class="sdbanner probanner"></div>
	<div class="proMain">
		<div class="conTit">
			<span><a style="color: #9d8440;"
				href="<%=basePath %>Main/subject">其他标的</a></span>
			<h2>
				<em>￥</em>${subject.subjectName }</h2>
		</div>
		<table class="conTable" width="100%" border="0" cellspacing="0"
			cellpadding="0">
			<tr>
				<td class="txtInfo">
					<div class="txt1">
						<h2>${subject.bought }</h2>
						<p>已购人数(人)</p>
					</div>
					<div class="txt2">
						<h2>${subject.yearRate }%</h2>
						<p>年化收益</p>
					</div>
					<div class="txt1">
						<input type="hidden" id="period" value="${subject.period }">
						<h2>${subject.period }</h2>
						<p>投资期限(天)</p>
					</div>
				</td>
				<td width="360" rowspan="2" align="center" ; valign="middle"
					height="320">
					<div class="tbBox">
						<input type="hidden" id="account" value="${memberAccount.useableBalance }">
						<h2>1258764.53</h2>
						<p>已投金额(元)</p>
						<div class="li4" style="">
							<span id="checkmoney" style="color: red;"></span>
						</div>
						<div class="tit">
							<span class="fr"> <c:if test="${member.names == null }">
									<a style="color: #2695d5" class="unlogin"
										href="<%=basePath %>Main/login">登录</a>后可见
							</c:if> <c:if test="${member.names != null }">
                            	${memberAccount.useableBalance }&nbsp;&nbsp;<a
										style="color: #2695d5" class="unlogin" href="#"
										onclick="alert('请前往 会员中心 --> 充值')">充值</a>
								</c:if>
							</span>
							<h2>账户余额</h2>
							<div id="count">
								预期所得收益<i data-num="${subject.yearRate/365/100*15}" id="num">0</i>元
								<input type="hidden" id="interest" value="${subject.yearRate/365*15 }">
							</div>
						</div>
						<input id="mytext" class="txt" name="totalFee" type="text"
							placeholder="起投金额100元以上"> <span
							style="float: right; margin-top: -40px; position: relative; line-height: 40px; padding: 0 10px; color: #f00;"
							id="addMoney"></span>
						<p class="preBox">
							<input type="checkbox" id="registerRule" class="registerRule"
								checked="checked"><span class="fl">同意<a
								href="<%=basePath %>views/admin/web/syxy.html" target="_black">《产品协议》</a></span>
							<button id="redPacket">使用红包</button>
						</p>
						<input type="hidden" id="subjectId" name="subjectId" value="${subject.subjectId}"/>
						<button class="submit">确认抢购</button>
						<!-- <button disabled style="background-color:#c3c3c3; ">已售罄</button> -->
					</div>
				</td>
			</tr>
		<%
        java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
        java.util.Date currentTime = new java.util.Date();//得到当前系统时间
        
        java.util.Calendar calendar =  java.util.Calendar.getInstance();
		calendar.add( java.util.Calendar.DATE, + 1);    //得到前后一天
		java.util.Date nextDay = calendar.getTime();
        %>
			<tr>
				<td>
					<ul class="conInfoList">
						<li class="info">
							<p>
								计息日期：<font color="#00baff"><f:formatDate
										value="<%=currentTime %>" /></font>
							</p>
							<p>
								还款方式：<font color="#00baff">一次性还本付息</font>
							</p>
							<p>
								资金到账日：<font color="#00baff">
											<f:formatDate value="<%=currentTime %>" /> 至
										 	<f:formatDate value="<%=nextDay %>" /></font>
							</p>
						</li>
						<li class="info">
							<p>
								保障方式：<font color="#00baff">企业担保</font>
							</p>
							<p>
								资金安全：<font color="#00baff">中国人保财险承保</font>
							</p>
							<p></p>
						</li>
					</ul>
				</td>
			</tr>
		</table>
		<div class="tbConBox">
			<div class="tab">
				<a class="select" href="#1">产品速览</a> <a href="#1">项目详情</a> <a
					href="#1">安全保障</a>
			</div>
			<div id="conBox">
				<div class="box" style="display: block">
					<table class="dbwtab" width="100%" border="1" bordercolor="#e9e9e9"
						cellspacing="0" cellpadding="0">
						<tr>
							<td class="corf9"><span>债权编号</span></td>
							<td>JWYJ15091601</td>

							<td class="corf9"><span>企业认证</span></td>
							<td>杭州吉威投资管理有限公司</td>
						</tr>
						<tr>
							<td class="corf9"><span>债权人</span></td>
							<td>王进</td>

							<td class="corf9"><span>保障平台</span></td>
							<td>盈+理财</td>

						</tr>
					</table>
					<div
						style="border: solid 1px #e9e9e9; padding: 15px; margin-top: 5px;">
						<style>
.fl {
	float: left
}

.fr {
	float: right
}

.productDetailCnt {
	padding: 0 40px;
	width: 800px;
	margin: 0 auto
}

.productDetailCnt .listItem {
	padding: 25px 0 30px;
	border-bottom: 1px solid #e7e7e7
}

.productDetailCnt h3 {
	font-size: 20px;
	font-weight: 400;
	margin-bottom: 12px;
	line-height: 32px
}

.productDetailCnt .listItem .detailIcon {
	display: inline-block;
	width: 120px;
	height: 120px;
	background-image:
		url(http://wacai-file.b0.upaiyun.com/finance/image/web/licai/wm/detailIcon.png);
	background-repeat: no-repeat
}

.productDetailCnt .listItem .fl {
	margin-right: 42px;
	margin-left: 12px
}

.productDetailCnt .listItem .fr {
	margin-right: 12px;
	margin-left: 42px
}

.productDetailCnt .row_1 .detailIcon {
	background-position: 0 0
}

.productDetailCnt .row_2 .detailIcon {
	background-position: -120px 0
}

.productDetailCnt .row_3 .detailIcon {
	background-position: -240px 0
}

.productDetailCnt .row_4 .detailIcon {
	background-position: -360px 0
}

.productDetailCnt .row_5 .detailIcon {
	background-position: -480px 0
}

.productDetailCnt .row_1 .media-body, .productDetailCnt .row_3 .media-body,
	.productDetailCnt .row_5 .media-body {
	margin-right: 12px
}

.productDetailCnt .row_2 .media-body, .productDetailCnt .row_4 .media-body
	{
	margin-left: 12px
}

.productDetailCnt .listItem p {
	font-size: 14px;
	color: #999;
	line-height: 1.5
}

.productDetailCnt .tipRow, .projectDetailBox .tipRow {
	padding: 20px 0
}
</style>
						<div class="productDetailCnt">
							<div class="pDetailList">
								<div class="listItem row_1">
									<div class="media">
										<span class="fl"><em class="detailIcon">&nbsp;</em></span>
										<div class="media-body">
											<h3>安不安全</h3>
											<p>本产品是中建投信托产品，上市公司宋都股份为该项目项下宋都集团的债务清偿提供连带责任保证责任，宋都股份为A股上市公司，浙江本地较大房地产企业，综合实力较强；</p>
											<p>标的项目为杭州市区内刚需楼盘，销售情况较好；还款来源充足。</p>
											<p>抵押物位于杭州桐庐大奇山郡未售现房，品质较高，抵押率不超过50%，抵押资产真实可靠。</p>
										</div>
									</div>
								</div>
								<div class="listItem row_2">
									<div class="media">
										<span class="fr"><em class="detailIcon">&nbsp;</em></span>
										<div class="media-body">
											<h3>钱去哪了</h3>
											<p>本产品由债权出让人购得中建投信托-安泉19号集合资金信托计划，用于宋都集团下属子公司香悦郡置业负责开发的杭州宋都香悦郡项目的开发建设。</p>
										</div>
									</div>
								</div>
								<div class="listItem row_3">
									<div class="media">
										<span class="fl"><em class="detailIcon">&nbsp;</em></span>
										<div class="media-body">
											<h3>购买准备</h3>
											<p>1. 首次购买需开通理财账户，理财账户可直接进行充值。</p>
											<p>2.
												了解申购所用银行卡支持情况，大额支付需要网银，支持银行数量和支付限额高；快捷支付方便迅速，但支持银行数量有限。</p>
											<p>3. &nbsp;产品限量抢购，提前充值可以大大提升抢购成功率。</p>
										</div>
									</div>
								</div>
								<div class="listItem row_4">
									<div class="media">
										<span class="fr"><em class="detailIcon">&nbsp;</em></span>
										<div class="media-body">
											<h3>怎样赎回</h3>
											<p>产品到期后本金和收益将自动回款至您的理财账户，产品到期前暂不支持提前赎回。</p>
										</div>
									</div>
								</div>
								<div class="tipRow f12 g9">由于理财资金管理运用过程中，可能会面临多种风险因素，在您选择购买本理财产品前，请充分认识风险，谨慎投资</div>
							</div>
						</div>
					</div>
				</div>

				<div class="box" style="display: none;">
					<p style="text-align: center">
						<strong><span
							style="font-size: 21px; font-family: &amp; #39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;">项目亮点</span></strong>
					</p>
					<p class="MsoListParagraph" style="margin-left: 48px">
						<strong><span
							style="font-family: &amp; #39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;"></span></strong>
					</p>
					<p>
						1、<strong>宋都股份为A股上市公司，浙江本地较大房地产企业，综合实力较强：</strong>
					</p>
					<p>截至2014年末，宋都股份总资产136.85亿元，总负债98.01亿元，资产负债率71.62%。宋都股份2014年全年主营业务收入约23.23亿元，净利润为0.55亿元，主要来源于房地产销售收入，销售净利率2.35%。2015年3月末，宋都股份主营业务收入约7.37亿元，净利润0.61亿元。根据预测，其未售存货按照目前的售价估算未来的可售金额可达到140亿元左右，结合其未来工程款投入压力较小的因素，宋都股份整体未来2年内的现金流对本信托计划有较好的保证能力。</p>
					<p>
						<br />
					</p>
					<p>
						2、<strong>标的项目为杭州市区内刚需楼盘，销售情况较好：</strong>
					</p>
					<p>目前项目工程进度至地上主体工程二分之一左右程度，截至2015年5月末，已推盘去化率（按套数）大约52%。由于属于纯刚需楼盘，项目目前销售情况良好，信托计划第一还款来源较为充足。</p>
					<p>
						<br />
					</p>
					<p>
						3、<strong>抵押物位于杭州桐庐大奇山郡未售现房，品质较高，抵押率不超过50%：</strong>
					</p>
					<p>大奇山郡置业拥有的位于杭州桐庐的大奇山郡项目已竣工未销售的现房资产或其他受托人认可的资产，抵押率不超过50%。</p>
					<p class="MsoListParagraph" style="margin-left: 48px">
						<span
							style="font-family: &amp; #39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;"></span><br />
					</p>
					<p style="text-align: center">
						<strong><span
							style="font-size: 21px; font-family: &amp; #39;微软雅黑&amp;#39;,&amp;#39;sans-serif&amp;#39;">增信措施</span></strong>
					</p>
					<p>
						<strong>连带责任保证担保</strong>
					</p>
					<p>上市公司宋都股份为本项目项下宋都集团的债务清偿提供连带责任保证责任。</p>
					<p>
						<br />
					</p>
					<p>
						<strong>抵押担保</strong>
					</p>
					<p>大奇山郡置业以其持有的位于杭州桐庐的大奇山郡项目存量房产提供抵押担保或其他受托人认可的资产提供担保，抵押率不超过50%。</p>
					<p>
						<br />
					</p>
					<p>
						<strong>资金归集</strong>
					</p>
					<p>1、销售资金归集</p>
					<p>当目标项目可售货值&lt;全部信托贷款本金余额*1.5时，如宋都集团未提前一次性偿还全部信托贷款本金及利息，则自目标项目可售货值〈全部信托贷款本金余额*1.5之日起，目标项目销售回款（销售回款以所有按揭银行发放的按揭贷款流水金额以及宋都集团书面提供的首付款金额统计为准，下同）每满5000万元时，宋都集团应向归集账户归集资金人民币3500万元。</p>
					<p>2、到期前归集</p>
					<p>各期贷款到期日前20日，归集该期贷款本金余额的5%；各期贷款到期日前10日，归集至该期贷款本金余额的20%；各期贷款到期日，归集至该期贷款本金余额的100%。</p>
					<p>
						<br />
					</p>
					<p>
						<strong>资金监管</strong>
					</p>
					<p>受托人委托商业银行作为本信托计划监管银行，对信托资金使用进行专项监管。</p>
					<p>
						<br />
					</p>
				</div>
				<div class="box" style="display: none;">
					<p>
						<strong>资金保障</strong>
					</p>
					<p>1.交易过程中盈+平台不触碰资金，资金在银行的监管下在银行账户间流动。</p>
					<p>2.交易资金由招商银行全面监管。</p>
					<p>3.资金流向清晰，资金安全有保障。</p>
					<p>
						<br />
					</p>
					<p>
						<strong>本息保障</strong>
					</p>
					<p>1.资金最终投向中建投信托产品，基础资产风险几乎为零，安全有保障。</p>
					<p>2.杭州吉威投资承担对该笔债权的回购义务，到期无条件偿付投资人本息。</p>
					<p>3.盈+平台对资金真实投向中建投信托产品的过程提供保障。如果因资金没有流向中建投信托产品而发生损失，盈+平台100%全额赔付本息。</p>
					<p>
						<br />
					</p>
					<p>
						<strong>盈+平台风控综述</strong>
					</p>
					<p>盈+平台通过与知名企业合作，利用互联网金融的高周转和灵活性，择时提供既能给盈主（平台客户）带来不错的收益，又能满足低资金成本需求的理财产品。</p>
				</div>
			</div>
		</div>
		<div class="picList">
			认证文件展示
			<ul>
				<li><a
					href="http://pro.ying158.com/upload/502/1442457094506.png"><img
						src="http://pro.ying158.com/upload/502/1442457094506.png" /></a></li>
				<li><a
					href="http://pro.ying158.com/upload/502/1442457094510.png"><img
						src="http://pro.ying158.com/upload/502/1442457094510.png" /></a></li>
				<li><a
					href="http://pro.ying158.com/upload/502/1442457094513.png"><img
						src="http://pro.ying158.com/upload/502/1442457094513.png" /></a></li>
				<li><a
					href="http://pro.ying158.com/upload/502/1442457094516.png"><img
						src="http://pro.ying158.com/upload/502/1442457094516.png" /></a></li>
			</ul>
		</div>

	</div>

	<meta charset="UTF-8">
	<div class="security">
		<div class="item">
			<img src="<%=basePath%>resources/web/images/indexSecurity1.png">
			<div class="detail">
				资金银行监管
				<div class="desc">平台资金由第三方银行监管</div>
			</div>
		</div>
		<div class="item">
			<img src="<%=basePath%>resources/web/images/indexSecurity2.png">
			<div class="detail">
				交易证监会监管
				<div class="desc">投资交易由证监会监管</div>
			</div>
		</div>
		<div class="item">
			<img src="<%=basePath%>resources/web/images/indexSecurity3.png">
			<div class="detail">
				风控盈+监管
				<div class="desc">盈+全自动风控系统为您保驾护航</div>
			</div>
		</div>
	</div>
	<div class="foot">
		<div class="container">
			<div class="row">
				<div class="hzhb_box">
					<div class="title"
						style="padding-left: 10px; font-weight: normal; font-size: 20px; color: #ccc;">
						主要合作机构</div>
					<div class="hzhb_item">
						<a target="_blank" href="http://www.picc.com/"><img
							onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/1_on.png'"
							onmouseout="this.src = '<%=basePath%>resources/web/images/hzhb/1.jpg'"
							src="<%=basePath%>resources/web/images/hzhb/1.jpg" /></a>
					</div>
					<div class="hzhb_item">
						<a target="_blank" href="http://www.fuioupay.com/"><img
							onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/2_on.png'"
							onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/2.jpg'"
							src="<%=basePath%>resources/web/images/hzhb/2.jpg" /></a>
					</div>
					<div class="hzhb_item">
						<a target="_blank" href="http://www.nanhua.net/"><img
							onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/3_on.png'"
							onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/3.jpg'"
							src="<%=basePath%>resources/web/images/hzhb/3.jpg" /></a>
					</div>
					<div class="hzhb_item">
						<a target="_blank"
							href="http://www.zttrust.com.cn/stations/526623d20a/index.php/5268e6b50a"><img
							onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/4_on.png'"
							onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/4.jpg'"
							src="<%=basePath%>resources/web/images/hzhb/4.jpg" /></a>
					</div>
					<div class="hzhb_item">
						<a target="_blank"
							href="http://sc.hkex.com.hk/TuniS/www.hkex.com.hk/eng/index.htm/"><img
							onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/5_on.png'"
							onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/5.jpg'"
							src="<%=basePath%>resources/web/images/hzhb/5.jpg" /></a>
					</div>
					<div class="hzhb_item">
						<a target="_blank" href="http://www.cmegroup.com/cn-s/"><img
							onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/6_on.png'"
							onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/6.jpg'"
							src="<%=basePath%>resources/web/images/hzhb/6.jpg" /></a>
					</div>
					<div class="hzhb_item">
						<a target="_blank"
							href="http://www.sgx.com/wps/portal/sgxweb_ch/home/!ut/p/a1/04_Sj9CPykssy0xPLMnMz0vMAfGjzOKNHB1NPAycDSz9wwzMDTxD_Z2Cg8PCDANdjYEKIoEKDHAARwNC-sP1o8BK8JhQkBthkO6oqAgAzDYPQQ!!/dl5/d5/L2dBISEvZ0FBIS9nQSEh/"><img
							onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/7_on.png'"
							onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/7.jpg'"
							src="<%=basePath%>resources/web/images/hzhb/7.jpg" /></a>
					</div>
					<div class="hzhb_item">
						<a target="_blank" href="http://www.neeq.com.cn/index/"><img
							onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/8_on.png'"
							onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/8.jpg'"
							src="<%=basePath%>resources/web/images/hzhb/8.jpg" /></a>
					</div>
					<div class="hzhb_item">
						<a target="_blank" href="http://www.cmbchina.com/"><img
							onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/9_on.png'"
							onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/9.jpg'"
							src="<%=basePath%>resources/web/images/hzhb/9.jpg" /></a>
					</div>
					<div class="hzhb_item">
						<a target="_blank"
							href="http://www.bankcomm.com/BankCommSite/default.shtml"><img
							onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/10_on.png'"
							onmouseout="this.src = '<%=basePath%>resources/web/images/hzhb/10.jpg'"
							src="<%=basePath%>resources/web/images/hzhb/10.jpg" /></a>
					</div>
					<div class="hzhb_item">
						<a target="_blank" href="http://www.ccb.com/cn/home/index.html"><img
							onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/11_on.png'"
							onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/11.jpg'"
							src="<%=basePath%>resources/web/images/hzhb/11.jpg" /></a>
					</div>
					<div class="hzhb_item">
						<a target="_blank" href="http://www.icbc.com.cn/icbc/"><img
							onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/12_on.png'"
							onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/12.jpg'"
							src="<%=basePath%>resources/web/images/hzhb/12.jpg" /></a>
					</div>
				</div>

				<div class="ft_item ft_item_sns">
					<div class="ft_item_tit">关注我们</div>
					<ul style="margin-bottom: 0px;" class="ft_sns_list clearfix">
						<li>
							<div class="wx_tips j_tips">
								<div class="tips_hd">
									<em class="ico_sns ico_weixin"></em> <span class="txt">微信公众号</span>
								</div>
								<div class="tips_bd">
									<em class="arrow"></em> <img
										src="<%=basePath%>resources/web/images/yj.jpg" alt="微信公共平台">
								</div>
							</div>
						</li>
						<li><a href="" target="_blank" rel="nofollow"> <em
								class="ico_sns ico_sinawb"></em> <span class="txt">新浪微博</span>
						</a></li>
						<li><a href="" target="_blank" rel="nofollow"> <em
								class="ico_sns ico_txwb"></em> <span class="txt">腾讯微博</span>
						</a></li>
					</ul>

					<div class="contactUs">
						<div class="title"
							style="padding-left: 10px; font-weight: normal; font-size: 20px; color: #ccc;">
							联系我们</div>
						<div class="contactInfo" style="padding-left: 30px;">
							<a
								style="display: inline-block; height: 50px; width: 50px; text-align: center;"
								target="_blank"
								href="http://wpa.qq.com/msgrd?v=3&amp;uin=508886246&amp;site=qq&amp;menu=yes"><img
								src="<%=basePath%>resources/web/images/qqIcon.png"
								onmouseover="$(this).css('height', '52px');"
								onmouseout="    $(this).css('height', '48px');" /></a> <span
								class="kefu">在线客服</span><span class="time">08:30 - 21:00</span>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
	<div class="foot3">
		<div class="container">
			<div class="row">
				Copyright © 2010 - 2015 www.ying158.com All Rights Reserverd
				杭州吉威投资管理有限公司 版权所有<br> 浙ICP备14030807号-3 杭州市江干区钱江新城迪凯银座19F
				4000-999-158
			</div>
		</div>
	</div>
	<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?06cf97732baac1a65bed8ae95f2384aa";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
</body>
<script type="text/javascript">

    $(function () {
        $(".tbConBox .tab a").click(function () {
            if (!$(this).hasClass("select")) {
                var num = $(this).index();
                $(this).addClass("select").siblings().removeClass("select");
                $("#conBox .box").eq(num).show().siblings().hide();
            }
        });

        $(":input[name=totalFee]").focus(function () {
            $(".li4").hide();
        });

        var redPacket = $("#redPacket");
        var bbinAll = $("#bbinAll");
        var addMoney = $("#addMoney");
        var mytext = $("#mytext");
        var exists = false;
        var authBankCard=false;
        		authBankCard=true;
        
             exists = true;
             //使用红包
             $("#redPacket").click(function () {
                 if (redPacket.hasClass("active")) {//选中
                     redPacket.removeClass("active");
                     addMoney.html("");
                     bbinAll.removeAttr("disabled");
                 } else {//未选中
                     redPacket.addClass("active");
                     addMoney.html("+" +0);
                     bbinAll.attr("disabled", "disabled");
                 }
             });
             //使用体验金
             $("#bbinAll").click(function () {
                 if (bbinAll.hasClass("active")) {//选中
                     bbinAll.removeClass("active");
                     mytext.val("");
                     mytext.removeAttr("readonly");
                     redPacket.removeAttr("disabled");
                 } else {//未选中
                     bbinAll.addClass("active");
                     mytext.val(0);
                     mytext.attr("readonly", "readonly");
                     redPacket.attr("disabled", "disabled");
                 }
             });

             $(".submit").click(function () {
                 if (exists == false) {
                     $("#checkmoney").html("请先登陆!");
                     $(".li4").show(100);
                     return false;
                 }
                 if(authBankCard==false){
                 	$("#checkmoney").html("请先绑定银行卡，<a href='<%=basePath%>Main/memberBankcardView'>绑卡</a>");
                     $(".li4").show(100);
                 	return false;
                 }
                 var value = $(":input[name=totalFee]").val();
                 if (value == null || value == '') {
                     $("#checkmoney").html("金额不能为空");
                     $(".li4").show(100);
                     return false;
                 }
                 value = parseInt(value);
                 if (value
                         <100) {
                     $("#checkmoney").html("起投金额在100以上");
                     $(".li4").show(100);
                     return false;
                 }
                 var bonusFee = 0;
                 var bbinStatus = 0;
                 if (!(bbinAll.hasClass("active"))) {//未选中体验金
                     var acountval = $("#account").val();
                     if (acountval != -1) {
                         if ((acountval - value) < 0) {
                             $("#checkmoney").html("账号余额不足，请充值");
                             $(".li4").show(100);
                             return false;
                         }
                     }
                     if (redPacket.hasClass("active")) {//选中红包
                         bonusFee =0;
                     }
                 } else {
                     bbinStatus = 1;
                 }
                 var subjectId = $("#subjectId").val();
                 var interest = $("#interest").val();
                 var period = $("#period").val();
                 $.ajax({
                     type: "POST", // 用POST方式传输
                     dataType: "json", // 数据格式:JSON
                     async: true,
                     url:  '<%=basePath%>Main/toOrderView', // 目标地址
                     data: {
                    	 interest: interest,
                    	 period: period,
                         subjectId: subjectId,
                         totalFee: value,
                         bonusFee: bonusFee,
                         bbinStatus: bbinStatus
                     },
                     success: function (msg) {
                         if (msg.code == 0) {
                             window.location.href = "<%=basePath%>Main/orderView?tradeNo=" + msg.msg
                         } else {
                             $("#checkmoney").html(msg.msg);
                             $(".li4").show(100);
                         }
                     }
                 });

             });


    });

</script>
</html>