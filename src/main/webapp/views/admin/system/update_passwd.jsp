<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="renderer" content="webkit">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%=basePath %>/resources/sys/ying/iconfont.css">
	<link rel="stylesheet" href="<%=basePath %>/resources/sys/style/bootstrap.css">
	<link rel="stylesheet" href="<%=basePath %>/resources/sys/style/style.css">
<title>盈+后台管理中心</title>
</head>
<body>
 <div class="box-right-main">
     <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>修改密码</h2>
		<form action="<%=basePath %>CJZ/newpasswd" id="form1" method="GET" class="form-horizontal" >
		<input type="hidden" id="hiddenid" value="${findUser.usersPassword}" />
	<div class="tablelist">
	  <div class="row bdlist">
					<div class="col-md-5">
						<div class="form-group">
							<label class="col-sm-3 control-label">原密码：</label>
							<div class="col-sm-9">
								<input class="form-control" id="oldpassword" placeholder="请输入密码" type="password"  >
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">新密码：</label>
							<div class="col-sm-9">
								<input class="form-control" id="usersPassword" placeholder="请输入密码"
									type="password">
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-3 control-label">重复新密码：</label>
							<div class="col-sm-9">
								<input class="form-control" id="confirmPassword"
									placeholder="请输入密码" type="password">
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-9">
								<label></label> <input onclick="run(${findUser.usersId});" type="submit"
									class="btn btn-primary btn-sm" style="margin-left: 40px;"
									value="确认修改" />
							</div>
						</div>
					</div>
				</div>
      </div>
 </form>
<script type="text/javascript" src="<%=basePath %>/resources/sys/js/jquery.js"></script>
<script type="text/javascript">
// function run(id){
// 	alert(id);
// 	document.forms['form1'].action="/winplus/CJZ/newpasswd?id="+id;
// 	document.froms['form1'].submit();
// };
$(document).ready(function() {
    $('#savePassword').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	oldpassword: {
                    message: '原密码不能为空',
                    validators: {
                        notEmpty: {
                            message: '原密码不能为空'
                        },
                        stringLength: {
                            min: 3,
                            max: 30, 
                            message: '原密码长度错误'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9_\.]+$/,
                            message: '原密码格式错误'
                        }
                    }
                },
                usersPassword: {
                    validators: {
                        notEmpty: {
                            message: '新密码不能为空'
                        },
                    }
                },
                confirmPassword: {
                    validators: {
                        notEmpty: {
                            message: '新密码不能为空'
                        },
                        identical: {
                            field: 'usersPassword',
                            message: '新密码不一致'
                        }
                    }
                }
            }
        })
        
});
function out() {
	var oldpwd=document.getElementById("oldpwd").value;	
	var userName=document.getElementById("uname").value;
	$.ajax({
		type : "POST", // 用POST方式传输
		url:'<%=basePath%>lddsystem/system/checkPasswordExsit',
				data : {
					"oldpassword" : oldpwd,
					"userName" : userName
				},
				success : function(data) {			
					if(data.code == '0'){
						$(".msg").html(data.msg).show();
					}else if(data.code == '1'){					
						$(".msg").html(data.msg).show();
						
					}
				}
			});
};

// function test(){
// 	var hiddenid = document.getElementById("hiddenid");
// 	var usersPassword = document.getElementById("usersPassword");
//     var password = document.getElementById("password");
//     var passwordConfirm = document.getElementById("confirmPassword");
// 	if (usersPassword.value != hiddenid.value) {
// 		alert("请填写正确的原密码！");
// 	    return false;
// 	}
//     if(password.value==null&&passwordConfirm.value==null){
//         alert("新密码不能为空!");
//    		return false;
//     }
//     if(passwordConfirm.value==null){
//         alert("重复新密码都不能为空!");
//     	return false;
//     }
//     if(password.value != passwordConfirm.value){
//         alert("对不起，您2次输入的密码不一致!");
//    		return false;
//     }else return true
// }
</script>
</body>
</html>