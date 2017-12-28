 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet"
	href="<%=basePath%>/resources/sys/ying/iconfont.css">
<link rel="stylesheet"
	href="<%=basePath%>/resources/sys/style/bootstrap.css">
<link rel="stylesheet"
	href="<%=basePath%>/resources/sys/style/style.css">
<script type="text/javascript" src="<%=basePath%>/resources/sys/js/jquery.js"></script>
<title>后台首页</title>
</head>
<body>
<div class="box-right-main">
     <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>添加用户</h2>
	<form name="form1" method="post" class="form-horizontal" action="addUser">
           <div class="form-group">
               <label class="col-sm-3 control-label">用户名</label>
               <div class="col-lg-5">
                   <input type="text" class="form-control" name="userName" id="userName"/>
               </div>
           </div>
           <div class="form-group">
               <label class="col-sm-3 control-label">密码</label>
               <div class="col-lg-5">
                   <input type="password" class="form-control" name="usersPassword" id="usersPassword"/>
               </div>
           </div>
           <div class="form-group">
               <label class="col-sm-3 control-label">重复密码</label>
               <div class="col-lg-5">
                   <input type="password" class="form-control" name="confirmPassword" id="confirmPassword"/>
               </div>
           </div>
           <div class="form-group">
               <label class="col-sm-3 control-label">手机号</label>
               <div class="col-lg-5">
                   <input type="text" id="mobilePhone" class="form-control" name="mobilePhone"/>
               </div>
           </div>
           <div class="form-group">
                <div class="group">
                	<label class="col-sm-3 control-label">角色</label>
            	<div class="col-lg-5">
            	 <select id="wy_provice"  name="userrole.userRoleId" data-bv-notempty data-bv-notempty-message="请选择角色" class="form-control">
            		 <option value="">选择角色</option>
                   <c:forEach items="${rlist }" var="rlist">
                	<option value="${rlist.userRoleId }" >${rlist.cname}</option>
                	</c:forEach>
                </select>
	           		</div>
                </div>
           </div>
            <div class="form-group">
             <label class="col-sm-3 control-label"></label>
                <div class="col-lg-5">
                 <input onclick="run();"  type="submit" class="btn btn-primary" value="确认"/>
            	</div>
           </div>
      </form> 
    </div>
<script type="text/javascript">
$(document).ready(function() {
    $('#addAccountForm')
        .bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	userName: {
                    message: '用户名不能为空',
                    validators: {
                        notEmpty: {
                            message: '用户名不能为空'
                        },
                        stringLength: {
                            min: 2,
                            max: 30,
                            message: '用户名长度必须为2-30个字符'
                        },
                        remote: {//ajax验证。server result:{"valid",true or false} 向服务发送当前input name值，获得一个json数据。例表示正确：{"valid",true}  
                            url: '<%=basePath%>syseckUserExsit',//验证地址
                            message: '用户已存在',//提示消息
                            delay :  1000,//每输入一个字符，就发ajax请求，服务器压力还是太大，设置2秒发送一次ajax（默认输入一个字符，提交一次，服务器压力太大）
                            type: 'POST',
                            /**自定义提交数据，默认值提交当前input value */
                              data: function(validator) {
                                  return {
                                	  username: $('[name="userName"]').val()
                                  };
                               }
                        }
                    }
                },
                usersPassword: {
                    validators: {
                        notEmpty: {
                            message: '密码不能为空'
                        }
                    }
                },
                confirmPassword: {
                    validators: {
                        notEmpty: {
                            message: '确认密码不能为空'
                        },
                        identical: {
                            field: 'password',
                            message: '两次密码不一致'
                        }
                    }
                },
                mobilePhone: {
                    validators: {
                        notEmpty: {
                            message: '手机号不能为空'
                        },
                        regexp: {
                            regexp: /^1[3-9][0-9]\d{8}$/,
                            message: '手机号格式不正确'
                        }
                    }
                }
            }
        })
        .on('success.form.bv', function(e) {
            e.preventDefault();
            var $form = $(e.target);
            var bv = $form.data('bootstrapValidator');
            $.post($form.attr('action'), $form.serialize(), function(result) {
            	alert(result.msg);
            	window.location.href="${base}/sys/userlist";
            }, 'json');
        });
});
// function run(){
// 	 var usersPassword = document.getElementById("usersPassword");
// 	 var confirmPassword = document.getElementById("confirmPassword");
// 	 if(usersPassword.value == confirmPassword.value){
// 		 document.form1.submit();
// 		 return false;
// 	 }else {
// 		alert("重复密码与密码不一致！");
// 		document.getElementById("usersPassword").value=usersPassword;
// 		return false;
// 		}
// 	}
</script>
</body>
</html>