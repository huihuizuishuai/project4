<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,maximum-scale=1.0,user-scalable=yes">
	<meta name="Keywords" content="股指体验交易，股指单手交易，股指多手交易">
	<meta name="description" content="申请实盘交易账户，直接进行实盘交易。">
	<title>产品中心- 盈+</title>
	
<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<link href="<%=basePath%>resources/web/font/iconfont.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">

<script src="<%=basePath%>resources/web/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>resources/web/layer/layer.js"></script>
<script src="<%=basePath%>resources/web/echart/dist/echarts.js"></script></head>
<body>

<div class="logo container">
    <div class="row">
        <div class="logoImg">
            <a href="http://www.ying158.com/home"><img src="<%=basePath%>resources/web/images/logo2.png" onmouseover="this.src = '<%=basePath%>resources/web/images/logo1.png'" onmouseout="this.src = '<%=basePath%>resources/web/images/logo2.png'"></a>
        </div>
        <div class="telInfo">
            <img src="<%=basePath%>resources/web/images/400Icon.png" onmousemove="this.src = '<%=basePath%>resources/web/images/400IconActive.png'" onmouseout="	this.src = '<%=basePath%>resources/web/images/400Icon.png'">
            <div class="detail">
            	<c:if test="${member.names == null }">
            			<a style="font-size:18px;float:right;margin-top:5px;color:#917739;" href="<%= basePath%>Main/login">登录</a>
                        <a style="font-size:18px;float:right;margin-right:15px;margin-top:5px;color:#917739;" href="<%= basePath%>Main/regis">注册</a>
                </c:if>
                <c:if test="${member.names != null }">
                    	<div style="font-size:16px;float:right;margin-top:5px;color:#917739;">  欢迎${member.names },<a href="<%=basePath%>Main/toVipList">[会员中心]</a>,<a href="<%=basePath%>Main/logout">[退出]</a></div>
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
                <li>
                    <a class="item first" href="http://www.ying158.com/home">
                        首页
                    </a>
                </li>
                <li>
                    <a class="item" href="http://www.ying158.com/home/kcenter">
                        网上体验中心
                    </a>
                </li>
                <li  class="item">
                   <a class="item" href="<%=basePath%>Main/subject">
                        产品中心
                    </a>
                </li>
                <li>
                    <a class="item" href="http://www.ying158.com/Home/NewsCenter">
                        新闻中心
                    </a>
                </li>
                <li>
                    <a class="item" href="<%=basePath%>mobileappdownload">
                      下载中心
                    </a>
                </li>
                <li>
                    <a class="item " href="http://www.ying158.com/Home/Help">
                        盈+商学院
                    </a>
                </li>
                <li>
                    <a class="item" href="http://ying158.com/UserGuide/TradingSoftware">
                        投研中心
                    </a>
                </li>
                <li>
                    <a class="item last" href="http://pro.ying158.com/account/trades/profit/records">
                        我的加法库
                    </a>
                </li>
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
            if (1!=null&&1==0){
                showIn("<%=basePath%>account/bbinInfo/getBbinInfo");
            }

    });

</script>
	<%
	Integer subType = 0;
	try{
		subType = (Integer)request.getSession().getAttribute("subType");
		if(subType!=null&&subType!=0){
			subType = (Integer)request.getSession().getAttribute("subType");
		}else{
			subType=0;
		}
	}catch(Exception e){}
	
	Integer yearRate = 0;
	try{
		yearRate = (Integer)request.getSession().getAttribute("yearRate");
		if(yearRate!=null&&yearRate!=0){
			yearRate = (Integer)request.getSession().getAttribute("yearRate");
		}else{
			yearRate=0;
		}
	}catch(Exception e){}
	
	Integer period = 0;
	try{
		period = (Integer)request.getSession().getAttribute("period");
		if(period!=null&&period!=0){
			period = (Integer)request.getSession().getAttribute("period");
		}else{
			period=0;
		}
	}catch(Exception e){}
	
	Integer status = 0;
	try{
		status = (Integer)request.getSession().getAttribute("status");
		if(status!=null&&status!=0){
			status = (Integer)request.getSession().getAttribute("status");
		}else{
			status=0;
		}
	}catch(Exception e){}
	
	%>
	<div class="sdbanner probanner"></div>
    <div class="proMain">
    	<div class="hwpzNav">
    		<ul>
    			<li class="first"><a class="active" href="<%=basePath%>Main/subject">固收类理财</a></li>
    			<li class="second"><a href="<%=basePath%>Main/finance">私募基金</a></li>
    			<li class="three"><a href="<%=basePath%>Main/oversea">海外配置</a></li>
    			<li class="four"><a href="<%=basePath%>Main/finance">股权基金</a></li>
    		</ul>
    	</div>
        <div class="sdShaix">
        	<ul>
            	<li class="first">标的类型：</li>
               		<li><a href="<%=basePath%>Main/subjects?subType=0&yearRate=<%=yearRate %>&period=<%=period %>&status=<%=status %>" id="1">全部</a></li>
               		<li><a href="<%=basePath%>Main/subjects?subType=1&yearRate=<%=yearRate %>&period=<%=period %>&status=<%=status %>" id="2">固收类理财</a></li>
               		<li><a href="<%=basePath%>Main/subjects?subType=2&yearRate=<%=yearRate %>&period=<%=period %>&status=<%=status %>" id="3">车盈宝</a></li>
            </ul>
        	<ul>
            	<li class="first">年化收益：</li>
               		<li><a href="<%=basePath%>Main/subjects?subType=<%=subType %>&yearRate=0&period=<%=period %>&status=<%=status %>" id="4">全部</a></li>
               		<li><a href="<%=basePath%>Main/subjects?subType=<%=subType %>&yearRate=1&period=<%=period %>&status=<%=status %>" id="5">6.0%</a></li>
               		<li><a href="<%=basePath%>Main/subjects?subType=<%=subType %>&yearRate=2&period=<%=period %>&status=<%=status %>" id="6">6.5%</a></li>
               		<li><a href="<%=basePath%>Main/subjects?subType=<%=subType %>&yearRate=3&period=<%=period %>&status=<%=status %>" id="7">7.0%</a></li>
               		<li><a href="<%=basePath%>Main/subjects?subType=<%=subType %>&yearRate=4&period=<%=period %>&status=<%=status %>" id="9">7.0%以上</a></li>
            </ul>
        	<ul>
            	<li class="first">项目期限：</li>
               		<li><a href="<%=basePath%>Main/subjects?subType=<%=subType %>&yearRate=<%=period %>&period=0&status=<%=status %>" id="10">全部</a></li>
               		<li><a href="<%=basePath%>Main/subjects?subType=<%=subType %>&yearRate=<%=period %>&period=1&status=<%=status %>" id="11">15天以下</a></li>
               		<li><a href="<%=basePath%>Main/subjects?subType=<%=subType %>&yearRate=<%=period %>&period=2&status=<%=status %>" id="12">15-30天</a></li>
               		<li><a href="<%=basePath%>Main/subjects?subType=<%=subType %>&yearRate=<%=period %>&period=3&status=<%=status %>" id="13">30-180天</a></li>
               		<li><a href="<%=basePath%>Main/subjects?subType=<%=subType %>&yearRate=<%=period %>&period=4&status=<%=status %>" id="14">180-365天</a></li>
               		<li><a href="<%=basePath%>Main/subjects?subType=<%=subType %>&yearRate=<%=period %>&period=5&status=<%=status %>" id="15">一年以上</a></li>
            </ul>
        	<ul>
            	<li class="first">标的状态：</li>
               		<li><a href="<%=basePath%>Main/subjects?subType=<%=subType %>&yearRate=<%=period %>&period=<%=period %>&status=0" id="16">全部</a></li>
               		<li><a href="<%=basePath%>Main/subjects?subType=<%=subType %>&yearRate=<%=period %>&period=<%=period %>&status=1" id="17">投标中</a></li>
               		<li><a href="<%=basePath%>Main/subjects?subType=<%=subType %>&yearRate=<%=period %>&period=<%=period %>&status=2" id="18">还款中</a></li>
               		<li><a href="<%=basePath%>Main/subjects?subType=<%=subType %>&yearRate=<%=period %>&period=<%=period %>&status=3" id="19">已完成</a></li>
            </ul>
        </div>

<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

		<script type="text/javascript">
			function selects(e) {
				alert(e)
				$("#"+e).addClass('select').siblings().removeClass('select');
			}
		</script>
		<div class="ajaxContainer">
	<!-- 异步内容开始 -->
				<c:forEach items="${subjects }" var="subject">
					<ul class="tbList">
						<li class="first">
									<span class="ico zq"></span>
							<h2><em>投</em>${subject.subjectName }</h2>
							<i></i>
						</li>
						<li class="second">					
							
							<div class="txt1">
								<h2>${subject.yearRate-1 }<span style="font-size:18px;">+1.0%</span></h2>
								<p>年化收益</p>
							</div>
							
							<div class="txt2">
								<h2>￥${subject.floorAmount }</h2>
								<p>起购金额(元)</p>
							</div>
							
							<div class="txt2">
								<h2>${subject.period }天</h2>
								<p>投资期限</p>
							</div>
						</li>
						<li class="three">
								<a href="#1">企业担保</a><span>中国人保财险承保</span>
								<p>计息日期：当天投资，立即计息<br>已购人数：${subject.bought }人</p>
						</li>
						<li class="four">
								
						</li>
						<li class="five">
							<a class="abtn" href="<%=basePath%>Main/subject_buy/${subject.subjectId }">购买</a>
						</li>
					</ul>
				</c:forEach>	
	<!-- 异步内容结束 -->
	
	
	<div class="llpage">
		<div class="in">
			
				<a class="prev_page">上页</a>
			
			
					<a class="now" >1</a>
			
			
				<a class="next_page" rel="next">下页</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	function getJsonInfo(url) {
		$.get(url, 'json', function(data) {
			$(".ajaxContainer").empty();
			$(".ajaxContainer").append(data);
		});
	}
		require.config({
            paths: {
                echarts: '<%=basePath%>resources/web/echart/dist/'
            }
        });
		require(
			[
				'echarts',
				'echarts/chart/pie'
			],
			function (ec) {
				var labelTop = {
						normal : {
							color:'#ff503f',
							label : {
								show : false,
								position : 'center',
								formatter : '{b}',
								textStyle: {
									baseline : 'bottom'
								}
							},
							labelLine : {
								show : false
							}
						}
					};
				var labelFromatter = {
					normal : {
						label : {
							formatter : function (params){
								return 100 - params.value + '%'
							},
							textStyle: {
								color:'#666',
								baseline : 'middle'
							}
						}
					},
				};
				var labelBottom = {
					normal : {
						color: '#f8f8f8',
						label : {
							show : true,
							position : 'center'
						},
						labelLine : {
							show : false
						}
					}
				};
				var radius = [30,35];
				var myChart1 =document.getElementsByClassName('yuan');
				for(i=0;i<myChart1.length;i++){
					var num = myChart1[i].getAttribute('data-num');
					ec.init(myChart1[i]).setOption({
						series : [
							{
								type : 'pie',
								center : ['50%', '50%'],
								radius : radius,
								x: '0%', // for funnel
								itemStyle : labelFromatter,
								data : [
									{name:'other', value:100-num, itemStyle : labelBottom},
									{name:'占比', value:num,itemStyle : labelTop}
								]
							},
						]
					});
				}
			}
		);
    </script>    </div>
   
<meta charset="UTF-8">
    <div class="security">
        <div class="item">
            <img src="<%=basePath%>resources/web/images/indexSecurity1.png">
            <div class="detail">
                资金银行监管
                <div class="desc">
                    平台资金由第三方银行监管
                </div>
            </div>
        </div>
        <div class="item">
            <img src="<%=basePath%>resources/web/images/indexSecurity2.png">
            <div class="detail">
                交易证监会监管
                <div class="desc">
                    投资交易由证监会监管
                </div>
            </div>
        </div>
        <div class="item">
            <img src="<%=basePath%>resources/web/images/indexSecurity3.png">
            <div class="detail">
                风控盈+监管
                <div class="desc">
                    盈+全自动风控系统为您保驾护航
                </div>
            </div>
        </div>
    </div>
	<div class="foot">
		<div class="container">
            <div class="row">
                <div class="hzhb_box">
                    <div class="title" style=" padding-left:10px; font-weight:normal; font-size:20px; color:#ccc;">
                        主要合作机构
                    </div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.picc.com/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/1_on.png'" onmouseout="this.src = '<%=basePath%>resources/web/images/hzhb/1.jpg'" src="<%=basePath%>resources/web/images/hzhb/1.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.fuioupay.com/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/2_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/2.jpg'" src="<%=basePath%>resources/web/images/hzhb/2.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.nanhua.net/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/3_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/3.jpg'" src="<%=basePath%>resources/web/images/hzhb/3.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.zttrust.com.cn/stations/526623d20a/index.php/5268e6b50a"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/4_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/4.jpg'" src="<%=basePath%>resources/web/images/hzhb/4.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://sc.hkex.com.hk/TuniS/www.hkex.com.hk/eng/index.htm/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/5_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/5.jpg'" src="<%=basePath%>resources/web/images/hzhb/5.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.cmegroup.com/cn-s/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/6_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/6.jpg'" src="<%=basePath%>resources/web/images/hzhb/6.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.sgx.com/wps/portal/sgxweb_ch/home/!ut/p/a1/04_Sj9CPykssy0xPLMnMz0vMAfGjzOKNHB1NPAycDSz9wwzMDTxD_Z2Cg8PCDANdjYEKIoEKDHAARwNC-sP1o8BK8JhQkBthkO6oqAgAzDYPQQ!!/dl5/d5/L2dBISEvZ0FBIS9nQSEh/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/7_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/7.jpg'" src="<%=basePath%>resources/web/images/hzhb/7.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.neeq.com.cn/index/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/8_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/8.jpg'" src="<%=basePath%>resources/web/images/hzhb/8.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.cmbchina.com/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/9_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/9.jpg'" src="<%=basePath%>resources/web/images/hzhb/9.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.bankcomm.com/BankCommSite/default.shtml"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/10_on.png'" onmouseout="this.src = '<%=basePath%>resources/web/images/hzhb/10.jpg'" src="<%=basePath%>resources/web/images/hzhb/10.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.ccb.com/cn/home/index.html"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/11_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/11.jpg'" src="<%=basePath%>resources/web/images/hzhb/11.jpg" /></a></div>
                    <div class="hzhb_item"><a target="_blank" href="http://www.icbc.com.cn/icbc/"><img onmouseover="this.src = '<%=basePath%>resources/web/images/hzhb/12_on.png'" onmouseout="    this.src = '<%=basePath%>resources/web/images/hzhb/12.jpg'" src="<%=basePath%>resources/web/images/hzhb/12.jpg" /></a></div>
                </div>

                <div class="ft_item ft_item_sns">
                    <div class="ft_item_tit">关注我们</div>
                    <ul style=" margin-bottom:0px;" class="ft_sns_list clearfix">
                        <li>
                            <div class="wx_tips j_tips">
                                <div class="tips_hd">
                                    <em class="ico_sns ico_weixin"></em>
                                    <span class="txt">微信公众号</span>
                                </div>
                                <div class="tips_bd">
                                    <em class="arrow"></em>
                                    <img src="<%=basePath%>resources/web/images/yj.jpg" alt="微信公共平台">
                                </div>
                            </div>
                        </li>
                        <li>
                            <a href="" target="_blank" rel="nofollow">
                                <em class="ico_sns ico_sinawb"></em>
                                <span class="txt">新浪微博</span>
                            </a>
                        </li>
                        <li>
                            <a href="" target="_blank" rel="nofollow">
                                <em class="ico_sns ico_txwb"></em>
                                <span class="txt">腾讯微博</span>
                            </a>
                        </li>
                    </ul>

                    <div class="contactUs">
                       <div class="title" style=" padding-left:10px; font-weight:normal; font-size:20px; color:#ccc;">
                          联系我们
                        </div>
                        <div class="contactInfo" style="padding-left:30px;">
                            <a style="display:inline-block; height:50px; width:50px; text-align:center; " target="_blank" href="http://wpa.qq.com/msgrd?v=3&amp;uin=508886246&amp;site=qq&amp;menu=yes"><img src="<%=basePath%>resources/web/images/qqIcon.png" onmouseover="$(this).css('height', '52px');" onmouseout="    $(this).css('height', '48px');" /></a>
                            <span class="kefu">在线客服</span><span class="time">08:30 - 21:00</span>
                        </div>
                    </div>

                </div>

			</div>
		</div>
	</div>
	<div class="foot3">
		<div class="container">
			<div class="row">
				Copyright © 2010 - 2015 www.ying158.com All Rights Reserverd 杭州吉威投资管理有限公司 版权所有<br>
				浙ICP备14030807号-3 杭州市江干区钱江新城迪凯银座19F 4000-999-158
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
</html>