<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://www.ying158.com/images/icon.ico" type="image/x-icon" rel="shortcut icon">
	<link href="<%=basePath%>/resources/web/css/common.css" rel="stylesheet">
	<link href="<%=basePath%>/resources/web/css/jw.css" rel="stylesheet">
    <link href="<%=basePath%>/resources/web/font/iconfont.css" rel="stylesheet">
    <script src="<%=basePath%>/resources/web/js/jquery.js"></script>
    <script src="<%=basePath%>/resources/web/echart/dist/echarts.js"></script>
<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,maximum-scale=1.0,user-scalable=yes">
	<meta name="Keywords" content="股指体验交易，股指单手交易，股指多手交易">
	<meta name="description" content="申请实盘交易账户，直接进行实盘交易。">
	<title>收益记录-会员中心-盈+</title>
	<link href="http://www.ying158.com/images/icon.ico" type="image/x-icon" rel="shortcut icon">
	<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
	<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">
    <link href="<%=basePath%>resources/web/font/iconfont.css" rel="stylesheet">
    <script src="<%=basePath%>resources/web/js/jquery.js"></script>
    <script src="<%=basePath%>resources/web/echart/dist/echarts.js"></script>
</head>
<body onload="loginout();">

<div class="logo container">
    <div class="row">
        <div class="logoImg">
            <a href="http://www.ying158.com/home"><img src="<%=basePath%>resources/web/images/logo2.png" onmouseover="this.src = '<%=basePath%>resources/web/images/logo1.png'" onmouseout="this.src = '<%=basePath%>resources/web/images/logo2.png'"></a>
        </div>
        <div class="telInfo">
            <img src="<%=basePath%>resources/web/images/400Icon.png" onmousemove="this.src = '<%=basePath%>resources/web/images/400IconActive.png'" onmouseout="	this.src = '<%=basePath%>resources/web/images/400Icon.png'">
            <div class="detail">
						<input type="hidden" id="usersname" value="${member.names }">
                    	<div style="font-size:16px;float:right;margin-top:5px;color:#917739;">  欢迎${member.names },<a href="<%=basePath%>Main/toVipList">[会员中心]</a>,<a href="<%=basePath%>Main/logout">[退出]</a></div>
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
	function loginout(){
		var usersname = document.getElementById("usersname").value;
		if(usersname==""){
			alert("登录状态失效，请重新登录。");
			location.href="<%=basePath%>Main/logout";
		}
		
	}

    $(function(){
        function showIn(url){
            var info="<div class='mydig'><div class='bg'></div><div class='imgbox'><a href="+url+"></a></div></div>";
            $('body').append(info);
        }
            if (1!=null&&1==0){
                showIn("<%=basePath%>account/bbinInfo/getBbinInfo");
            }
    });

</script><table height="160" class="peopleInfo" width="970" border="0" cellspacing="0" cellpadding="0">
    <tr>
        <td align="left" valign="middle" class="info">
            <a href="<%=basePath%>Main/aqxx" target="myiFrame">
                <div class="img"><img src="<%=basePath%>resources/web/images/userPic.jpg"></div>
                <h2>${member.names }，<span>您好!</span></h2>
            </a>
            <div class="safe">账户安全&nbsp;&nbsp;<span class="scroll"><em style="width:100%"></em></span></div>
            <ul class="listIco iconfont">
                <li class="active"><a href="#1">&#xe61c;</a><em>&#xe61b;</em></li>
                <li class="active"><a href="#1">&#xe61d;</a><em>&#xe61b;</em></li>
                <li class="active"><a href="#1">&#xe61a;</a><em>&#xe61b;</em></li>                                
                <li class="active"><a href="#1">&#xe61e;</a><em>&#xe61b;</em></li>
            </ul>
        </td>
        <td align="right">
            <a href="<%=basePath%>Main/logout" class="loginOut"><span class="iconfont">&#xe618;</span>安全退出</a>
        </td>
    </tr>
</table>
<div class="countBox">
    <ul>
        <li><h2><f:formatNumber pattern="0.00">${memberAccount.useableBalance==null?0.00:memberAccount.useableBalance }</f:formatNumber></h2><p>账户可用余额(元)<a href="javascript:;" class="iconfont">&#xe619;<span>账户可用余额</span><i></i></a></p></li>
        <li><h2><f:formatNumber pattern="0.00">${memberAccount.useableBalance+memberAccount.investAmount+memberAccount.totalProfit }</f:formatNumber></h2><p>账户总资产(元)<a href="javascript:;" class="iconfont">&#xe619;<span>可用余额+投资金额+累计收益</span><i></i></a></p></li>
        <li><h2 style="color:#9d8440"><f:formatNumber pattern="0.00">${memberAccount.investAmount==null?0.00:memberAccount.investAmount }</f:formatNumber></h2><p>投资金额(元)<a href="javascript:;" class="iconfont">&#xe619;<span>投资中资金</span><i></i></a></p></li>
        <li><h2 style="color:#9d8440"><f:formatNumber pattern="0.00">${memberAccount.totalProfit==null?0.00:memberAccount.totalProfit }</f:formatNumber></h2><p>累计收益(元)<a href="javascript:;" class="iconfont">&#xe619;<span>累计收益</span><i></i></a></p></li>
        <li><h2 style="color:#9d8440"><f:formatNumber pattern="0.00">${memberAccount.imusealeBalance==null?0.00:memberAccount.imusealeBalance }</f:formatNumber></h2><p>冻结金额(元)<a href="javascript:;" class="iconfont">&#xe619;<span>提现冻结金额</span><i></i></a></p></li>
    </ul>
    <a href="<%=basePath%>Main/zhcz" target="myiFrame" class="cz">充值</a>
    <a href="<%=basePath%>Main/wytk" target="myiFrame" class="tk">提款</a>
</div>
<div class="proMain clearfix">
<div class="adminLeft">
    <h2>我的投资</h2>
    <ul>
        <li><a id="member_center_menu_invests" href="<%=basePath%>Main/tzjl" target="myiFrame"><em class="iconfont red">&#xe602;</em>投资记录</a></li>
        <li><a id="member_center_menu_profit_record" href="<%=basePath%>Main/syjl" target="myiFrame"><em class="iconfont red">&#xe616;</em>收益记录</a></li>
        <li><a id="member_center_menu_deposit_record" href="<%=basePath%>Main/czjl" target="myiFrame"><em class="iconfont red">&#xe616;</em>充值记录</a></li>
        <li><a id="member_center_menu_withdraw_record" href="<%=basePath%>Main/tkjl" target="myiFrame"><em class="iconfont red">&#xe616;</em>提款记录</a></li>
        <li><a id="member_center_menu_bbinInfo_record" href="<%=basePath%>Main/tyjjl" target="myiFrame"><em class="iconfont red">&#xe616;</em>体验金记录</a></li>
    </ul>
    <h2>我的账户</h2>
    <ul>
        <li><a id="member_center_menu_deposit" href="<%=basePath%>Main/zhcz" target="myiFrame"><em class="iconfont">&#xe614;</em>账户充值</a></li>
        <li><a id="member_center_menu_security" href="<%=basePath%>Main/aqxx" target="myiFrame"><em class="iconfont">&#xe612;</em>安全信息</a></li>
        <li><a id="member_center_menu_withdraw" href="<%=basePath%>Main/wytk" target="myiFrame"><em class="iconfont">&#xe612;</em>我要提款</a></li>
        <li><a id="member_center_menu_financial" href="<%=basePath%>Main/wslcs" target="myiFrame"><em class="iconfont">&#xe612;</em>我是理财师</a></li>
    </ul>
</div>
<script>
  var menu_item="#";
 $("#"+menu_item).addClass("select");
</script>
        <div class="admin-right">
        	<iframe id="myiFrame" name="myiFrame" width="100%" onload="this.height=myiFrame.document.body.scrollHeight" src="<%=basePath%>Main/tzjl" frameborder="0" scrolling="no"></iframe>
        </div>
    </div>
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
</script></body>
</html>