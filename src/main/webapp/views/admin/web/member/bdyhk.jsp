<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    
<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="/resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<meta name="renderer" content="webkit">
    <meta name="viewport" content="width=device-width,maximum-scale=1.0,user-scalable=yes">
	<meta name="Keywords" content="股指体验交易，股指单手交易，股指多手交易">
	<meta name="description" content="申请实盘交易账户，直接进行实盘交易。">
	<title>收益记录-会员中心-盈+</title>
	<link href="http://www.ying158.com/images/icon.ico" type="image/x-icon" rel="shortcut icon">
	<link href="<%=basePath %>/resources/web/css/common.css" rel="stylesheet">
	<link href="<%=basePath %>/resources/web/css/jw.css" rel="stylesheet">
    <link href="<%=basePath %>/resources/web/font/iconfont.css" rel="stylesheet">
    <script src="<%=basePath %>/resources/web/js/jquery.js"></script>
    <script src="<%=basePath %>/resources/web/js/bootstrap.js"></script>
    <script type="text/javascript" src="<%=basePath %>/resources/web/location/area.js"></script>
    <script type="text/javascript" src="<%=basePath %>/resources/web/location/location.js"></script>
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
                                <div class="title">绑定银行卡</div>
                                <table class="txTable" width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td align="right">姓名：</td>
                                        <td><input type="text" class="tytxt" id="username" name="username"  placeholder="姓名"></td>
                                        <td style="color:#ff6a00">实名信息提交后不可修改，请务必认真填写真实资料</td>
                                    </tr>
                                    <tr>
                                        <td width="140" align="right">身份证：</td>
                                        <td><input type="text" class="tytxt" id="identity" name="identity" placeholder="身份证"></td>
                                        <td style="color:#ff6a00">一个身份证只能绑定一个帐号</td>
                                    </tr>

                                    <tr>
                                        <td align="right">开户银行：</td>
                                        <td colspan="2"><select class="form-control" id="type">
                                            <option value="GSYH">工商银行</option>
                                            <option value="GDYH">光大银行</option>
                                            <option value="GFYH">广发银行</option>
                                            <option value="HXYH">华夏银行</option>
                                            <option value="JSYH">建设银行</option>
                                            <option value="JTYH">交通银行</option>
                                            <option value="MSYH">民生银行</option>
                                            <option value="NYYH">农业银行</option>
                                            <option value="PFYH">浦发银行</option>
                                            <option value="XYYH">兴业银行</option>
                                            <option value="YZCX">邮政储蓄</option>
                                            <option value="ZSYH">招商银行</option>
                                            <option value="ZGYH">中国银行</option>
                                            <option value="ZXYH">中信银行</option>
                                        </select></td>
                                    </tr>

                                    <tr>
                                        <td align="right">开户地：</td>
                                        <td colspan="2"><div style="float:left;">
                                            <select id="loc_province" style="width:80px;"></select>
                                            <select id="loc_city" style="width:100px;"></select>
                                            <select id="loc_town" style="width:120px;"></select>
                                            <input type="hidden" name="location_id"  id="cardaddress"/>
                                        </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td align="right">开户支行：</td>
                                        <td><div  style="float:left;"><input type="text" class="tytxt" name="cardaddress1" id="cardaddress1" placeholder="开户支行"></div></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td align="right">银行卡号：</td>
                                        <td><input type="text" class="tytxt" id="bankCardNum" placeholder="银行卡号"></td>
                                    </tr>
                                    <tr>
                                        <td align="right">确认卡号：</td>
                                        <td>
                                            <input type="text" class="tytxt" id="bankCardNumConfirm" placeholder="确认卡号">

                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td><button class="tybutton" id="buttonsubmit">保存</button></td>
                                        <td></td>
                                    </tr>
                                </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade errorInfo infoModal" id="withdrawErrorModal" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content jddModalContnt" style="border-radius: 0px;width:400px;">
                <div class="modal-header">
                    <span>通知</span>
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                </div>
                <div class="modal-body">
                    <div id="withdrawError"></div>
                    <button class="btn btn-success confirmBtn" data-dismiss="modal">确认</button>
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
</body>
<script type="text/javascript">
    var baseContext = "<%=basePath %>";
    //绑定银行卡
    $("#buttonsubmit").click(function () {
        var username=$("#username").val();
        var identity=$("#identity").val();
        var bankCard = $("#bankCardNum").val();
        var bankCardConfirm = $("#bankCardNumConfirm").val();
        var type = $("#type").val();
        var loc_province = $("#loc_province").find("option:selected").text();
        var loc_city = $("#loc_city").find("option:selected").text();
        var loc_town = $("#loc_town").find("option:selected").text();
        var cardaddress=loc_province+"-"+loc_city+"-"+loc_town;
        var cardaddress1 = $("#cardaddress1").val();
        if (username=="" || username==undefined) {
            $("#withdrawError").html("请输入姓名");
            $("#withdrawErrorModal").modal();
            return;
        }
        if (identity=="" || identity==undefined) {
            $("#withdrawError").html("请输入身份证");
            $("#withdrawErrorModal").modal();
            return;
        }
        if (!isIdentityNumber(identity)) {
            $("#withdrawError").html("请输入正确的身份证号码");
            $("#withdrawErrorModal").modal();
            return;
        }
        if(loc_province=="省份"){
            $("#withdrawError").html("请选择省份");
            $("#withdrawErrorModal").modal();
            return;
        }
        if(loc_city=="地级市"){
            $("#withdrawError").html("请选择地级市");
            $("#withdrawErrorModal").modal();
            return;
        }
        if(loc_town=="市、县、区") {
            $("#withdrawError").html("请选择市、县、区");
            $("#withdrawErrorModal").modal();
            return;
        }

        if (bankCard == "" || bankCard == undefined) {
            $("#withdrawError").html("请输入银行卡号");
            $("#withdrawErrorModal").modal();
            return;
        }

        if (bankCardConfirm == "" || bankCardConfirm == undefined) {
            $("#withdrawError").html("请再次输入银行卡号");
            $("#withdrawErrorModal").modal();
            return;
        }
        if (bankCardConfirm != bankCard) {
            $("#withdrawError").html("两次输入的银行卡号不一致");
            $("#withdrawErrorModal").modal();
            return;
        }

        $("#buttonsubmit").addClass("disabled");
        $.ajax({
            type : "POST",
            dataType : "json",
            async : true,
            url : 'addBankCard',
            data : {
                userName : username,
                identity :identity,
                bankCard: bankCard,
                type:type,
                cardaddress:cardaddress+"-"+cardaddress1
            },
            success : function(resp) {
                if (resp.code == 0) {
                    $("#withdrawError").html(resp.msg);
                    $("#withdrawErrorModal").modal();
                    window.location.href = baseContext + "Main/memberBankcardView";
                } else {
                    $("#withdrawError").html(resp.msg);
                    $("#withdrawErrorModal").modal();
                }

            }
        });

    });

    var isIdentityNumber = function(number) {
        if($.trim(number)==''||!/^[0-9]{17}[0-9X]$/.test(number)){
            return false;
        }
        var weights = new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2);
        var parityBits = new Array("1", "0", "X", "9", "8", "7", "6", "5", "4","3", "2");
        var power = 0;
        for ( var i = 0; i < 17; i++) {
            power += parseInt(number.charAt(i),10)*weights[i];
        }
        return parityBits[power%11]==number.substr(17);
    }
</script>
</html>