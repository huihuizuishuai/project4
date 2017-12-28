<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,maximum-scale=1.0,user-scalable=yes">
	<meta name="Keywords" content="股指体验交易，股指单手交易，股指多手交易">
	<meta name="description" content="申请实盘交易账户，直接进行实盘交易。">
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
	<title>注册 - 盈+</title>
</head>
<body>
    <div class="proMain">
    	</div>
	<div class="row register">
		<div class="title">
			<div class="left">
				<hr/>
			</div>
			<div class="mid">
				15秒快速注册
			</div>
			<div class="right">
				<hr />
			</div>
		</div>
        <div class="item">
            <div class="rLabel">
                用户名
            </div>
            <div class="rInput">
                <input type="text" placeholder="请输入用户名" id="userName" name="youname" class="form-control textInput youname" />（需用实名注册）<span class="errorInfo">用户名不能为空</span>
            </div>
        </div>
		<div class="item">
			<div class="rLabel">
				手机号
			</div>
			<div class="rInput">
				<input type="text" placeholder="请输入手机号" id="phone" name="phone" class="form-control textInput phone" /><span class="errorInfo">手机号码不能为空</span>
			</div>
		</div>
		 <div class="item">
            <div class="rLabel">
                图形验证码
            </div>
            <div class="rInput">
                <input type="text" placeholder="图片验证码" id="picCode" class="form-control textInput imgcode" />
                <img src="<%=basePath%>/authImage" id="captcha" onclick="updcaptcha('<%=basePath%>')" title="看不清楚,点击换一张" alt="看不清楚,点击换一张" class="picCodeImg">
                <span class="errorInfo">请输入图形验证码</span>
            </div>
        </div>
		<div class="item">
			<div class="rLabel">
				验证码
			</div>
			<div class="rInput">
				<input type="text" placeholder="请输入验证码" id="vCode" name="vCode" class="form-control textInput code" /><button class="btn vCodeBtn" onclick="sendMessage(90)" id="btnSendCode">获取验证码</button><span class="errorInfo"></span>
			</div>
		</div>
		<div class="item">
			<div class="rLabel">
				登录密码
			</div>
			<div class="rInput">
				<input type="password" placeholder="请输入密码" id="password" name="password" class="form-control textInput password" /><span class="errorInfo"></span>（数字和字母组合，不少于6位）
			</div>
		</div>
		<div class="item">
			<div class="rLabel">
				确认密码
			</div>
			<div class="rInput">
				<input type="password" placeholder="请再输入密码" id="password2" name="password2" class="form-control textInput password2" /><span class="errorInfo"></span>
			</div>
		</div>
        <div class="item">
            <div class="rLabel">
                理财师邀请码
            </div>
            <div class="rInput">
                <input type="text" placeholder="选填" id="invitationCode" name="invitationCode" class="form-control textInput invitationCode" />（填写理财师邀请码，将会有更多惊喜）
            </div>
        </div>
		<div class="item">
			<div class="rLabel">
				QQ号码
			</div>
			<div class="rInput">
				<input type="text" placeholder="选填" id="qq" name="qq" class="form-control textInput qqAccount" />
			</div>
		</div>
		<div class="item extro">
			<div class="rLabel">
				&nbsp;
			</div>
			<div class="rInput">
				<span class="extroInfo">请用户提供QQ号码，方便客服联系</span>
			</div>
		</div>
		<div class="item">
			<div class="rLabel">
				&nbsp;
			</div>
			<div class="rInput">
				<label>
					<input type="checkbox" id="registerRule" class="registerRule" checked="checked"><span>我已阅读并同意<a href="javascript:showAgreement();">《本网站服务协议》</a></span>
				</label>
				<span class="ruleError">请先阅读并同意网站服务协议</span>
			</div>
		</div>
		<div class="item">
			<div class="rLabel">
				&nbsp;
			</div>
			<div class="rInput">
				<button class="btn registBtn submit">立即注册</button>
			</div>
		</div>
		<div class="item">
			<div class="rLabel">
				&nbsp;
			</div>
			<div class="rInput loginChoose">
				我已经注册，现在就<a href="<%=basePath%>Main/login">登录</a>
			</div>
		</div>
	</div>
	
<script type="text/javascript" src="<%=basePath%>/resources/web/js/regis.js"></script>
<script type="text/javascript">
$(function(){
	var b = "<%=basePath%>";
	regis(b);
});

function updcaptcha(){
	document.getElementById("captcha").src="<%=basePath%>/authImage?"+new Date().getTime();
}

function showAgreement(){
	window.open("<%=basePath%>views/admin/web/zcxy.html","注册协议","height=800,width=1000,scrollbars=yes, resizable=no,location=no, status=no,screenX=100") 
}
</script>
</body>
</html>