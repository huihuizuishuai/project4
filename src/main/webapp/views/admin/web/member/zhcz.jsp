<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link href="<%=basePath%>resources/web/css/common.css" rel="stylesheet">
	<link href="<%=basePath%>resources/web/css/jw.css" rel="stylesheet">
    <link href="<%=basePath%>resources/web/font/iconfont.css" rel="stylesheet">
    <script src="<%=basePath%>resources/web/js/jquery.js"></script>
    <script src="<%=basePath%>resources/web/js/bootstrap.js"></script>
<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">
<title>Insert title here</title>
 <script>
	$(function(){
		$(".picTab a").click(function(){
			if(!$(this).hasClass("select")){
				var num=$(this).index();
				$(this).addClass("select").siblings().removeClass("select");
				$(".txtCon p").eq(num).show().siblings().hide();
			}
		})
		$(".tbConBox .tab a").click(function(){
			if(!$(this).hasClass("select")){
				var num=$(this).index();
				$(this).addClass("select").siblings().removeClass("select");
				$("#conBox .box").eq(num).show().siblings().hide();
			}
		})
	})	

	var baseContext = "";

    </script>
    <style type="text/css">
    .finish_pay {

		padding: 30px 0 30px 75px;
		color: #343434;
		font-size: 14px;
	}
	.finish_pay	.toTargetPage {
		color: #ff7e03;
		font-weight: bold;
	}
	.finish_pay	.payOver, .finish_pay .payError {

		line-height: 30px;
		height: 30px;
		padding-left: 15px;
	}	
	
	.finish_pay	.payOver a, .finish_pay .payError a {
		color: #2676c9;
		text-decoration: underline;
		margin-right: 10px;
	}	

    </style>
</head>
<body>
<script type="text/javascript">
    $(function(){
        function showIn(url){
            var info="<div class='mydig'><div class='bg'></div><div class='imgbox'><a href="+url+"></a></div></div>";
            $('body').append(info);
        }
            if (1!=null&&1==0){
                showIn("/account/bbinInfo/getBbinInfo");
            }

    });

</script>
<script>
  var menu_item="";
 $("#"+menu_item).addClass("select");
</script>

        <div class="admin-right">
        	<div class="tbConBox">
                <div class="tab">
                    <a class="select" href="javascript:;">网银充值</a>
                    <a href="javascript:;" id="hisTabLink">充值记录</a>
                </div>
                <div id="conBox">
                    <div class="box" style="display:block">
                    	<div class="picTab">
                    		<a class="select" href="javascript:">
                            	<img height="42px" src="<%=basePath %>/resources/web/images/fuiou.png">
                                <p>通过富友支付平台进行网银充值</p>
                            </a>
                        </div>   
                        <div class="formBox">
                        	<div class="czbox">
                        		<form id="depositForm" action="<%=basePath%>Main/gopay" method="POST" target="_blank">
									<div>充值银行卡：<strong>
								<c:if test="${type=='JSYH'}">建设银行</c:if>
								<c:if test="${type=='GSYH'}">工商银行</c:if>
								<c:if test="${type=='GDYH'}">光大银行</c:if>
								<c:if test="${type=='GFYH'}">广发银行</c:if>
								<c:if test="${type=='HXYH'}">华夏银行</c:if>
								<c:if test="${type=='JTYH'}">交通银行</c:if>
								<c:if test="${type=='MSYH'}">民生银行</c:if>
								<c:if test="${type=='NYYH'}">农业银行</c:if>
								<c:if test="${type=='PFYH'}">浦发银行</c:if>
								<c:if test="${type=='XYYH'}">兴业银行</c:if>
								<c:if test="${type=='YZCX'}">邮政储蓄</c:if>
								<c:if test="${type=='ZSYH'}">招商银行</c:if>
								<c:if test="${type=='ZGYH'}">中国银行</c:if>
								<c:if test="${type=='ZXYH'}">中信银行</c:if>
									-${cardNo }
									</strong></div><br>
	                        		<div>充值金额：<input class="tytxt" id="fee" name="fee" type="text">
	                        						<input type="hidden" name="cardType" value="${type }">
                        							<input type="hidden" name="cardNo" value="${cardNo }">
	                        		</div>
	                        		<button class="tybutton" id="btn_go_pay" type="button">前往充值</button>
	                        	</form>
                        	</div>
                        </div>
                        <div class="txtCon">
                            <p style="display: block;">上海富友金融网络技术有限公司自2008年创立至今，已发展成为一家大型综合性金融支付服务集团公司——注册资本2.0007亿元，实收资本3.8亿元，下设6家全资子公司，同时拥有6张支付及金融服务牌照，并在全国设立了35家分公司。富友以“打造便利金融生活”为愿景，以“专业——分享——价值”为理念，以“专业创新，差异化经营”为手段，立志成为网络金融和网络生活服务的领先者——用便利金融，让生活更美好。 2011年获得中国人民银行颁发的银行卡收单和互联网支付牌照，同时获得人民银行颁发的预付卡发行与受理牌照。2013年富友金融获得中国银联“收单外包机构注册认证”，在全国范围建立银行卡收单服务网络。2014年成为“上海市网络信贷服务业企业联盟”成员单位，在目前国家已颁布牌照的269家第三方支付公司中，获此殊荣的仅有4家公司</p>
                        </div> 
                    </div>
                    <div class="box">

<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath %>/resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">
<input type="hidden" id="basePath" value="<%=basePath %>">
<div class="ajaxContainer">
	<table class="tzlist" width="100%" border="1" bordercolor="#e9e9e9" cellspacing="0" cellpadding="0">
		<tr>
			<th width="30%">订单号</th>
			<th width="20%">金额</th>
			<th width="20%">状态</th>
			<th width="30%">时间</th>
		</tr>
		<c:forEach items="${mdrObj }" var="mdrObj">
			<tr>
				<td>${mdrObj[1] }</td>
				<td><font color="#ff503f">￥${mdrObj[3] }</font></td>
				<td>${mdrObj[4]==0?'充值失败':'充值成功' }</td>
				<td>${mdrObj[8] }</td>
			</tr>
		</c:forEach>
	</table>
	
	
	<div class="llpage">
		<div class="in">
			<a href="javascript:pagerequest(1);">首页</a>
				<a href="javascript:pagerequest(${page>1?page-1:1 });">上页</a>
					<a class="now" >${page }</a>
				<a href="javascript:pagerequest(${page<pageCount?page+1:pageCount });">下页</a>
				<a href="javascript:pagerequest(${pageCount });">尾页</a>
		</div>
	</div>
</div>
<script type="text/javascript">
	function getJsonInfo(url) {
		$.get(url, 'json', function(data) {
			$(".ajaxContainer").empty();
			$(".ajaxContainer").append(data);
		});
	}
</script>                    </div>
                </div>
            </div>
        </div>
<meta charset="UTF-8">
<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?06cf97732baac1a65bed8ae95f2384aa";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
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

<div class="modal fade errorInfo infoModal" id="withdrawNoticeModal" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content jddModalContnt" style="border-radius: 0px;width:400px;">
            <div class="modal-header">
                <span>提示信息</span>
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
            </div>
            <div class="modal-body">
            <div class="finish_pay">
				<p class="toTargetPage">请您在新打开的支付页面上完成充值！</p>				
				<p class="payOver">充值成功：<a href="javascript:;" id="showHistory">查看充值记录</a></p>
			</div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

$("#btn_go_pay").click(function() {
	var depositAmount = $("#fee").val();
    if ($.trim(depositAmount) == "") {
        $("#withdrawError").html("请填写充值金额");
        $("#withdrawErrorModal").modal();
        $("#fee").focus();
        return;
    }
    if (isNaN(depositAmount)) {
        $("#withdrawError").html("请填写正确的充值金额");
        $("#withdrawErrorModal").modal();
        $("#fee").val("");
        $("#fee").focus();
        return;
    }
    if (depositAmount <1) {
        $("#withdrawError").html("充值金额不可少于1元");
        $("#withdrawErrorModal").modal();
        $("#fee").val("");
        $("#fee").focus();
        return;
    } 
    $("#depositForm").submit();
    $("#withdrawNoticeModal").modal();
}); 


$("#showHistory").click(function() {
    $("#withdrawNoticeModal").modal("hide");
    $("#hisTabLink").click();
    var basePath = $("#basePath").val();
    getJsonInfo(basePath+'Main/czjl')
});
function pagerequest(page){
	location.href="<%=basePath%>Main/czjl?page="+page;
}
</script>
</body>
</html>