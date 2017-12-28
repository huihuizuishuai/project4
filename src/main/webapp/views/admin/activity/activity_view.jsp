<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-cn">
<head>
	<meta charset="UTF-8"/>
    <title>盈+</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <link rel="stylesheet" href="<%=basePath%>/resources/activity/css/base.css">
    <link rel="stylesheet" href="<%=basePath%>/resources/activity/css/pintuer.css">
    <link rel="stylesheet" href="<%=basePath%>/resources/activity/css/style.css">
    <script src="<%=basePath%>/resources/activity/js/jquery.js"></script>
    <script src="<%=basePath%>/resources/activity/js/pintuer.js"></script>
    <script src="<%=basePath%>/resources/activity/js/respond.js"></script>
    <link href="<%=basePath%>/resources/mobileapi/css/base.css" type="text/css" rel="stylesheet">
    
<link href="<%=basePath%>/resources/mobileapi/css/css.css" type="text/css" rel="stylesheet">
<link href="<%=basePath%>/resources/mobileapi/font/iconfont.css" type="text/css" rel="stylesheet">

<script type="text/javascript">
$(function(){
    var tipBox = $(".tipBox"),
		mask = $(".mask");
    var ua = navigator.userAgent.toLowerCase();

    function is_weixin() {
        if (ua.match(/MicroMessenger/i) == "micromessenger") {
            return true;
        } else {
            return false;
        }
    }
    $('.aTxt').click(function () {
        if (/iphone|ipad|ipod/.test(ua)) {
            if (is_weixin()) {
            	alert("请在浏览器中打开");
            }
            else {
                window.location.href = "<%=basePath%>/download/app/ios";
            }
        }
        else if (/android/.test(ua)) {
            if (is_weixin()) {
            	alert("请在浏览器中打开");
            }
            else {
                window.location.href = "<%=basePath%>/resources/app/YingJia.apk";
            }
        }

    });

    mask.click(function () {
        tipBox.css({ "display": "none" });
        mask.css({ "display": "none" });
        tipBox.animate({ "height": "0px" });
    });
})	
</script>
</head>

<body>

    <div class="bg">
    	<img src="<%=basePath%>/resources/activity/img/bg.gif"/>
    	<div class="add">
    		<a href="">立即参与</a>
    	</div>
    	<div class="bd">
    		<div class="inpt errorspan">
    			<span class="errorInfo"></span>
    		</div>
    		<div class="inpt">
    			<input type="text" class="phone mobil"  placeholder="手机号"/>
    		</div>
    		<div class="inpt">
    			 <input type="text" class="imgcode yzwcode" placeholder="图形验证码"/>
    			 <img src="<%=basePath%>/authImage" id="captcha" style="width: 31%;float: right;" onclick="updcaptcha('<%=basePath%>')" title="看不清楚,点击换一张" alt="看不清楚,点击换一张" class="picCodeImg">
    		</div>
    		<div style="clear: both;"></div>
    		<div class="inpt">
    			<input type="text" class="code mobilcode" placeholder="验证码"/>
    			<button class="codebtn" onclick="sendMessage(90)" id="btnSendCode">获取验证码</button>
    		</div>
    		<div style="clear: both;"></div>
    		<div class="inpt" style="margin-bottom: 3vw;">
    			<input type="password" class="password passstyle"  placeholder="密码"/>
    		</div>
    		<div class="inpt">
    			<input type="checkbox" checked="checked" id="checkbox_a1" class="chk_1" /> 
                <label for="checkbox_a1"></label> 
                <a class="dialogs" href="<%=basePath%>/h5/v1/protocal/regis_protocal" target="_black" data-toggle="click" data-target="#mydialog" data-mask="1" data-width="80%">我已阅读并同意《盈+网站用户协议》</a>
    		</div>
    		<div class="inpt">
    			<input type="submit" value="立即注册" class="send submit" />
    		</div>
    	</div>
    	
    	
    	<div class="down">
    		<a href="javascript:" class="aTxt" target="_black"><img src="<%=basePath%>/resources/activity/img/ios.gif"/></a>
    	    <a href="javascript:" class="aTxt" target="_black"><img src="<%=basePath%>/resources/activity/img/android.gif"/></a>
    	</div>
    	
    </div>
    
 <script type="text/javascript" src="<%=basePath%>/resources/activity/js/activityRegis.js"></script> 
 <script type="text/javascript">
$(function(){
	var b = "<%=basePath%>";
	regis(b);
});
function updcaptcha(){
	document.getElementById("captcha").src="<%=basePath%>/authImage?"+new Date().getTime();
}
</script>  
</body>

</html>
