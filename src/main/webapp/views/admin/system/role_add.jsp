<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="renderer" content="webkit">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="<%=basePath %>/resources/sys/ying/iconfont.css">
	<link rel="stylesheet" href="<%=basePath %>/resources/sys/ying/font2.css">
	<link rel="stylesheet" href="<%=basePath %>/resources/sys/style/bootstrap.css">
	<link rel="stylesheet" href="<%=basePath %>/resources/sys/style/style.css">
	<title>盈+后台管理中心</title>
</head>
<body>
<div class="box-right-main">
     <h2><span class="glyphicon glyphicon-play" style="margin-right:5px"></span>添加角色</h2>
       <form class="form-horizontal col-xs-pull-3" id="addroleForm" name="addroleForm" method="post" action="addrole">
        	<div class="form-group">
            <label class="col-sm-3 control-label">角色名</label>
            <div class="col-lg-5">
                <input type="text" class="form-control" name="cname" />
            </div>
            </div>
            <div class="form-group">
                 <label class="col-sm-3 control-label">英文名</label>
                 <div class="col-lg-5">
                     <input type="text" class="form-control" name="ename" id="ename" />
                 </div>
             </div>
            <div class="form-group">
                 <label class="col-sm-3 control-label">描述</label>
                 <div class="col-lg-5">
                     <input type="text" class="form-control" name="remark" id="remark" />
                 </div>
             </div>
            <div class="form-group">
            	  <label class="col-sm-3 control-label"></label>
            	  <div class="col-lg-5">
                 <button type="submit" class="btn btn-primary btn-sm">确认 </button>
                 </div>
            </div>
       </form>
  </div>
<script type="text/javascript">
$(document).ready(function() {
    $('#addroleForm')s.bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
            	cname: {
                    message: '角色名不能为空',
                    validators: {
                        notEmpty: {
                            message: '角色名不能为空'
                        }
                    }
                },
                ename: {
                    validators: {
                        notEmpty: {
                            message: '权限不能为空'
                        },
                        remote: {
                            url: '${base}/sys/checkRoleExsit'+$("#ename").val(),
                            message: '权限名称已被占用'
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
            	window.location.href="${base}/sys/rolelist";
            }, 'json');
        });
});
</script>
</body>
</html>