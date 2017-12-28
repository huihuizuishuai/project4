<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="http://www.ying158.com/images/icon.ico" type="image/x-icon" rel="shortcut icon">
	<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
	<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">
    <link href="<%=basePath%>resources/web/font/iconfont.css" rel="stylesheet">
    <script src="<%=basePath%>resources/web/js/jquery.js"></script>
    <script src="<%=basePath%>resources/web/js/bootstrap.js"></script>
<title>Insert title here</title>
</head>
<body>
<script>
  var menu_item="";
 $("#"+menu_item).addClass("select");
</script>
 <div class="admin-right">
        	<div class="tbConBox">
                <div class="tab">
                    <a class="select" href="javascript:;">安全中心</a>
                </div>
                <div id="conBox">
                    <div class="box" style="display:block">
                    	<table class="safeTable" width="100%" border="0" cellspacing="0" cellpadding="0">
                    <c:if test="${renzheng==0 }">
                          <tr>
                            	<td class="first"><span class="iconfont"><a href="#1">&#xe61c;</a><em>&#xe61b;</em></span></td>
	                            <td><p style="color:#ff503f">实名认证</p></td>
	                            <td></td>
	                            <td><p style="color:#888">保障账户安全，只有完成实名认证才能充值提款</p></td>
	                            <td><a href="<%=basePath%>Main/renzheng" class="renzheng">认证</a></td>
                          </tr>
                          <tr>
								<td class="first"><span class="iconfont"><a href="#1">&#xe61c;</a><em>&#xe61b;</em></span></td>
								<td><p style="color:#ff503f">绑卡认证</p></td>
								<td></td>
								<td><p style="color:#888">保障账户安全，只有完成实名绑卡认证才能充值提款</p></td>
								<td><a href="<%=basePath%>Main/renzheng" class="renzheng">认证</a></td>
								 
							</tr>
                    </c:if>
                    <c:if test="${renzheng==1 }">
                          <tr>
                            	<td class="first"><span class="iconfont active"><a href="#1">&#xe61c;</a><em>&#xe61b;</em></span></td>
	                            <td><p style="color:#ff503f">实名认证</p></td>
	                            <td>${identity }</td>
	                            <td><p style="color:#888">保障账户安全，只有完成实名认证才能充值提款</p></td>
	                            <td>认证完成</td>
                          </tr>
							<tr>
								<td class="first"><span class="iconfont active"><a href="#1">&#xe61c;</a><em>&#xe61b;</em></span></td>
								<td><p style="color:#ff503f">绑卡认证</p></td>
								<td>已绑定</td>
								<td><p style="color:#888">保障账户安全，只有完成实名绑卡认证才能充值提款</p></td>
								<td><a href="<%=basePath%>Main/memberBankcardView" class="renzheng">查看</a></td>
							</tr>
                    </c:if>
                          <tr>
                            <td class="first"><span class="iconfont active"><a href="#1">&#xe61d;</a><em>&#xe61b;</em></span></td>
                            <td><p style="color:#ff503f">绑定手机</p></td>
                            <td>${phone }</td>
                            <td><p style="color:#888">手机号码是您在盈+金融的重要身份凭证</p></td>
                            <td>绑定完成</td>
                          </tr>
                          <tr>
                            <td class="first"><span class="iconfont active"><a href="#1">&#xe61a;</a><em>&#xe61b;</em></span></td>
                            <td><p style="color:#ff503f">登录密码</p></td>
                            <td>已设置</td>
                            <td><p style="color:#888">登录盈+金融网站时需要输入的密码</p></td>
                            <td><a onclick="$('#changePWModal').modal(); return false;" href="javascript:;" class="renzheng">修改</a></td>
                          </tr>
                          <c:if test="${tikuan==0 }">
                          <tr>
	                            <td class="first"><span class="iconfont"><a href="#1">&#xe61e;</a><em>&#xe61b;</em></span></td>
	                            <td><p style="color:#ff503f">提款密码</p></td>
	                            <td>未设置</td>
	                            <td><p style="color:#888">保障资金安全，提款需要设置提款密码</p></td>
	                            <td><a onclick="$('#setWithdrawPWModel').modal(); return false;" href="javascript:;" class="renzheng">设置</a></td>								
                          </tr>
                          </c:if>
                          <c:if test="${tikuan==1 }">
                          <tr>
	                            <td class="first"><span class="iconfont active"><a href="#1">&#xe61e;</a><em>&#xe61b;</em></span></td>
	                            <td><p style="color:#ff503f">提款密码</p></td>
	                            <td>已设置</td>
	                            <td><p style="color:#888">保障资金安全，提款需要设置提款密码</p></td>
	                            <td>已设置</td>								
                          </tr>
                          </c:if>
                        </table>
                    </div>
                </div>
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
<div id="changePWModal" class="modal fade infoModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content" style="border-radius: 0px;">
			<div class="modal-header">
				<span>修改登录密码</span>
				<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			</div>
			<div class="modal-body text-center">
				<form class="form-horizontal" id="changePWModalForm">
					<div class="form-group" id="oldLoginPwGroup">
						<label class="control-label col-sm-3" for="oldLoginPw">原登录密码: </label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="oldLoginPw" placeholder="原登录密码" />
						</div>
						<div class="col-sm-4 help-block text-left">
							<span class="error-info"></span>
						</div>
					</div>
					<div class="form-group" id="newLoginPwGroup">
						<label class="control-label col-sm-3" for="newLoginPw">新登录密码: </label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="newLoginPw" placeholder="新登录密码" />
						</div>
						<div class="col-sm-4 help-block text-left">
							<span class="error-info"></span>
						</div>
					</div>
					<div class="form-group" id="newLoginPwConfirmGroup">
						<label class="control-label col-sm-3" for="newLoginPwConfirm">确认新密码: </label>
						<div class="col-sm-5">
							<input type="password" class="form-control" id="newLoginPwConfirm" placeholder="确认新密码" />
						</div>
						<div class="col-sm-4 help-block text-left">
							<span class="error-info"></span>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-success" onclick="changeLoginPW();">提交</button>
				<button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<div id="changePWResultModal" class="modal fade infoModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content jddModalContnt" style="border-radius: 0px;width:400px;">
			<div class="modal-header">
				<span>操作成功</span>
				<button type="button" class="close" data-dismiss="modal" >
					<span aria-hidden="true">×</span>
					<span class="sr-only">关闭</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<div class="content">
				</div>
			</div>
		</div>
	</div>
</div>

    <div id="setWithdrawPWModel" class="modal fade infoModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content" style="border-radius: 0px;">
                <div class="modal-header">
                    <span>设置提款密码</span>
                    <button type="button" class="close" data-dismiss="modal" ><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                </div>
                <div class="modal-body text-center">
                    <form class="form-horizontal" id="setWithdrawPWForm">
                        <div class="form-group" id="withdrawPWGroup">
                            <label class="control-label col-sm-3" for="withdrawPW">提款密码: </label>
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="withdrawPW" placeholder="提款密码" />
                            </div>
                            <div class="col-sm-4 help-block text-left">
                                <span class="error-info"></span>
                            </div>
                        </div>
                        <div class="form-group" id="withdrawPWConfirmGroup">
                            <label class="control-label col-sm-3" for="withdrawPWConfirm">确认提款密码: </label>
                            <div class="col-sm-5">
                                <input type="password" class="form-control" id="withdrawPWConfirm" placeholder="确认提款密码" />
                            </div>
                            <div class="col-sm-4 help-block text-left">
                                <span class="error-info"></span>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-success" onclick="setWithdrawPw();">提交</button>
                    <button type="button" class="btn btn-primary btn-sm" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>
    

<div id="setWithdrawPWResultModel" class="modal fade infoModal" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content jddModalContnt" style="border-radius: 0px;width:400px;">
			<div class="modal-header">
				<span class="title">操作成功</span>
				<button type="button" class="close" data-dismiss="modal" >
					<span aria-hidden="true">×</span>
					<span class="sr-only">关闭</span>
				</button>
			</div>
			<div class="modal-body text-center">
				<div class="content">
					设置提款密码成功
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	var baseContext = "<%=basePath%>";
</script>
<script src="<%=basePath%>resources/web/js/security_changeloginpwd.js"></script>
<script src="<%=basePath%>resources/web/js/security_withdrawpwd.js"></script>
</body>
</html>