<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="<%=basePath%>resources/sys/ying/iconfont.css">
    <link rel="stylesheet" href="<%=basePath%>resources/sys/style/bootstrap.css">
    <link rel="stylesheet" href="<%=basePath%>resources/sys/style/style.css">
    <script src='<%=basePath%>resources/dist/js/jquery.min.js'></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>resources/ueditor1_4_3_1/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>resources/ueditor1_4_3_1/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="<%=basePath%>resources/ueditor1_4_3_1/lang/zh-cn/zh-cn.js"></script>

    <link rel="stylesheet" href="<%=basePath%>resources/date/bootstrap-datetimepicker.min.css">
    <script type="text/javascript" src="<%=basePath%>resources/date/bootstrap-datetimepicker.js" charset="UTF-8"></script>
    <script type="text/javascript" src="<%=basePath%>resources/date/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>

    <script src='<%=basePath%>resources/js/jquery.form.js'></script>
    <script src="<%=basePath%>resources/dist/js/bootstrapValidator.min.js"></script>
    <script src="<%=basePath%>resources/bootstrap-fileinput/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="<%=basePath%>resources/bootstrap-fileinput/js/plugins/canvas-to-blob.min.js" type="text/javascript"></script>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/uploadify/uploadify.css">
    <script src="<%=basePath%>resources/uploadify/jquery.uploadify.min.js" type="text/javascript"></script>
    <title>后台首页</title>
</head>
<body>

<div class="box-right-main">
    <h2>
        <span class="glyphicon glyphicon-play" style="margin-right: 5px"></span>海外配置
    </h2>

    <form action="<%=basePath%>overseaSys/overseaConfig" method="post" id="valForm" enctype="multipart/form-data">
        <input type="hidden" name="id" value="${overseaConfig.id }">
        <div class="tablelist">
            <!-- 表单 -->
            <div class="row bdlist">
                <div class="col-md-6">
                    <div class="form-group">
                        <label class="col-sm-3 control-label">名称：</label>

                        <div class="col-sm-9">
                            <input name="title" class="form-control" placeholder="请输入文本" type="text"
                                   value="${overseaConfig.title }">
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">子标题：</label>

                        <div class="col-sm-9">
                            <input name="child_title" class="form-control" placeholder="请输入文本" type="text"
                                   value="${overseaConfig.child_title }">
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-3 control-label">描述：</label>

                        <div class="col-sm-9">
                            <input name="description" class="form-control" placeholder="请输入文本" type="text"
                                   value="${overseaConfig.description }">
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-3 control-label">用户群体：</label>

                        <div class="col-sm-9">
                            <input name="user_type" class="form-control" placeholder="请输入文本" type="text"
                                   value="${overseaConfig.user_type }">
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="col-sm-3 control-label">排序值：</label>

                        <div class="col-sm-9">
                            <input name="sortcolum" class="form-control" placeholder="请输入数字" type="text"
                                   value="${overseaConfig.sortcolum }">
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">状态：</label>

                        <div class="col-sm-9">
                            <select class="form-control" name="status" id="status">
                            <c:forEach items="${financestaus }" var="fina">
                             <option value="${fina.statu }" ${overseaConfig.status==fina.statu?"selected='selected'":"" }>${fina.name }</option>
                            </c:forEach>
                               
                             
                            </select>
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">开始时间：</label>

                        <div class="col-sm-9">
                            <input name="start_date" class="form-control time" placeholder="请输入文本" type="text" value="${overseaConfig.start_date}">
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">结束时间：</label>

                        <div class="col-sm-9">
                            <input name="end_date" class="form-control time" placeholder="请输入文本" type="text" value="${overseaConfig.end_date}">
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label">图标：</label>

                        <div class="col-sm-9">
                            <div id="avatar" style="text-align:left">
                                <input type="file" name="avatar_link" id="avatar_link">
                                <input type="hidden" name="oversea_icon" id="productManagerPic" value="${overseaConfig.oversea_icon }"/>
                            </div>
                            <span style="visibility: hidden">验证提示预留位置</span>
                        </div>
                    </div>

                </div>
            </div>

        </div>
        <div class="row bdlist">
            <div class="col-md-11" style="margin-left: 30px">
                <div>
                    <div><textarea name="content" id="content"
                                   style="height: 300px;"></textarea></div>
                    <script type="text/javascript">
                        var UEDITOR_HOME_URL = "/winplus";//从项目的根目录开始
                        var ue = UE.getEditor('content');
                    </script>
                </div>
            </div>
        </div>
        <div class="tablebaocun">
            <br>
            <button type="submit" class="btn btn-primary btn-sm"
                    style="margin-left: 40%; margin-bottom: 20px; padding: 10px 30px">保存
            </button>
        </div>
    </form>
    <!-- 内容结束 -->
</div>
<!-- 容器结束 -->
</body>


<script type="text/javascript">
    $(function () {

        $('.time').datetimepicker({
            format : 'yyyy-mm-dd',
            language: 'zh-CN',
            weekStart: 1,
            todayBtn: 1,
            todayHighlight: 1,
            startView: 2,
            minView: 2,
            forceParse: 0,
            autoclose : 1
        }).on('changeDate', function(ev) {
            $(this).focus();
            $('.time').datetimepicker('hide');
            $('#valForm').bootstrapValidator('revalidateField', 'startDate');
            $('#valForm').bootstrapValidator('revalidateField', 'endDate');
        });

        $('#avatar_link').uploadify({
            'swf': '<%=basePath%>resources/uploadify/uploadify.swf', //指定上传控件的主体文件，默认‘uploader.swf’
            'uploader': '<%=basePath%>upload/fileupload', //指定服务器端上传处理文件
            'auto': true, //手动上传
            'buttonImage': '<%=basePath%>resources/uploadify/uploadify-browse.png', //浏览按钮背景图片
            'multi': false, //单文件上传
            'fileTypeExts': '*.gif; *.jpg; *.png;', //允许上传的文件后缀
            'fileSizeLimit': '10MB', //上传文件的大小限制，单位为B, KB, MB, 或 GB
            'successTimeout': 30, //成功等待时间
            'queueSizeLimit': 1,
            'fileObjName': 'file',
            'onUploadSuccess': function (file, data,response) {//每成功完成一次文件上传时触发一次
                var image = eval("[" + data + ']')[0];
                $(".uploadvedio").remove();
                $('#avatar').append("<div id=" + image.msg + " class='uploadvedio'> <a href=<%=basePath%>" + image.msg + " target='_black'>" + image.msg + "</a> " +
                        "<a href=javascript:delimg('" + image.msg + "','productManagerPic')>删除</a> </div>");
                $("#productManagerPic").val(image.msg);
            },
            'onUploadError': function (file, data, response) {//当上传返回错误时触发
                $('#avatar').append("<li>" + data + "</li>");

            }
        });

        $('#valForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                title: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '名称不能为空!'
                        },

                        stringLength: {
                            min: 2,
                            max: 100,
                            message: '名称长度为2-100个字符!'
                        }
                    }
                },
                child_title: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '子标题不能为空!'
                        },

                        stringLength: {
                            min: 2,
                            max: 100,
                            message: '子标题长度为2-100个字符!'
                        }
                    }
                },
                description: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '描述不能为空!'
                        },

                        stringLength: {
                            min: 2,
                            max: 100,
                            message: '描述长度为2-100个字符!'
                        }
                    }
                },
                user_type: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '用户群体不能为空!'
                        },

                        stringLength: {
                            min: 2,
                            max: 100,
                            message: '用户群体为2-100个字符!'
                        }
                    }
                },
                sortcolum: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '排序值不能为空!'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: '排序值为整数类型'
                        }
                    }
                },
                start_date: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '开始日期不能为空!'
                        }
                    }
                },
                end_date: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '结束日期不能为空!'
                        }
                    }
                },
                oversea_icon: {
                    message: '',
                    validators: {
                        notEmpty: {
                            message: '图标不能为空!'
                        }
                    }
                }

            }
        })
    });

    <!--删除图片-->
    function delimg(obj, tval) {
        var url = "<%=basePath%>upload/delimg";
        $.post(url, {'imgpath': obj}, function (data) {
            if (data.code == 0) {
                document.getElementById(obj).remove();
                document.getElementById(tval).value = "";
            }
        });
    }


</script>
</html>
