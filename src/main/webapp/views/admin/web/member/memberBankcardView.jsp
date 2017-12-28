<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>收益记录-会员中心-盈+</title>
	<link href="http://www.ying158.com/images/icon.ico" type="image/x-icon" rel="shortcut icon">
	<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
	<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">
    <link href="<%=basePath%>resources/web/font/iconfont.css" rel="stylesheet">
    <script src="<%=basePath%>resources/web/js/jquery.js"></script>
    <script src="<%=basePath%>resources/web/js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/web/location/area.js"></script>
    <script type="text/javascript" src="<%=basePath%>resources/web/location/location.js"></script>
        <script type="text/javascript" >
            $(document).ready(function() {
                showLocation();
            });

        </script>
        <style>
            .clearfix:after {
                content: '\0020';
                display: block;
                height: 0;
                clear: both;
            }

            .clearfix {
                *zoom: 1;
            }

            #conBox .box .title {
                font-weight: bold;
                font-size: 20px;
                padding-top: 20px;
                padding-left: 30px;
                margin-bottom: 40px;
            }

            .myBankCards {

            }

            .myBankCards .card {
                float: left;
                width: 300px;
                border: 1px solid #eaeaea;
                padding: 5px;
                position: relative;
                margin-left: 35px;
                margin-bottom: 20px;
            }

            .myBankCards .card .banklogo {
                width: 150px;
                height: 45px;
            }

            .myBankCards .card img {
                width: 150px;
                margin-left: 10px;
            }

            .myBankCards .card .cardno {
                margin-top: 5px;
                margin-left: 15px;
            }

            .myBankCards .card .btns {
                position: absolute;
                right: 1px;
                bottom: 1px;
                display: none;
            }

            .myBankCards .card .btns a {
                background: #d7d7d7;
                color: #9b8888;
                text-decoration: none;
            }
        </style>

</head>
<body>
<div class="admin-right">
        	<div class="tbConBox">
                <div class="tab">
                    <a class="select" href="javascript:;">银行卡管理</a>
                </div>
                <div id="conBox">
                    <div class="box"  style="display:block">
                        <div class="myBankCards clearfix">
                                <div class="card" id="bankcard_396">
                                    <div class="banklogo"><img src="<%=basePath%>resources/web/images/banks/${type }.jpg"></div>
                                    <div class="cardno"><strong>${bankCard }</strong></div>
                                    <div class="cardno"><strong>${cardaddress }</strong></div>

                                </div>
                                <div style="clear: both;">
                                    <strong>
					                                    您可以通过盈+理财APP申请更换安全银行卡，盈+理财会为您进行信息核对，换卡申请通过后，原银行卡自动失效，您可以绑定一张新的银行卡。<br>
					                                    换卡需要您提供如下资料：<br> </strong>
                                    1）手持身份证照片：手持身份证正面与本人头部合影，同时需确保本人头部与身份证无遮挡；<br>
                                    2）原卡注销证明：需前往对应银行开具盖有银行公章的旧银行卡注销或挂失证明。<br><br>
									发送至邮箱 vip@hzgeway.com 或 vip@ying158.com <br>
									联系400-999-158电话<br>
                                   
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</body>
</html>