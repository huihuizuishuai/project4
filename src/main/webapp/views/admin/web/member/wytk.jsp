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
	var baseContext = "<%=basePath%>";
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
</style>
</head>
<body>
<script>
  var menu_item="";
 $("#"+menu_item).addClass("select");
</script>

        <div class="admin-right">
        	<div class="tbConBox">
                <div class="tab">
                    <a class="select" href="javascript:;">我要提款</a>
                    <a href="javascript:;">提款记录</a>                    
                </div>
                <div id="conBox">
                    <div class="box" style="display:block">
													
                        <table class="txTable" width="100%" border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="140" align="right">账户余额：</td>
                            <td><strong>${ma.useableBalance==null?0.00:ma.useableBalance }</strong>元</td>
                          </tr>
							<tr>
								<td align="right"> 提款银行卡： </td>
								<td><strong>
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
									</strong>
									<input type="hidden" id="withdrawBankCard" value="${cardNo }"></td>
							</tr>
                          <tr>
                            <td align="right">提款金额：</td>
                            <td><input class="tytxt" type="text" id="withdrawAmount" style="width:250px"></td>
                          </tr>

                          <tr>
                            <td align="right"> 提款密码：</td>
                            <td>
                            <c:if test="${tikuan ==0 }">
                            	<input type="text" class="tytxt" style="width:250px;" value="请先设置提款密码" disabled="disabled">
                             </c:if>
                             <c:if test="${tikuan ==1 }">
                            	<input type="password" class="tytxt" id="withdrawPW" style="width:250px;">
                             </c:if>
                            </td>
                          </tr>
                          <tr>
                            <td>&nbsp;</td>
                            <td><button class="tybutton" id="withdrawConfirm">提交</button></td>
                          </tr>
                        </table> 
                    </div>
                    <div class="box">                    	

<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="<%=basePath%>resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

<div class="ajaxContainer">
	<table class="tzlist" width="100%" border="1" bordercolor="#e9e9e9" cellspacing="0" cellpadding="0">
		<tr>
			<th width="20%">时间</th>
			<th width="30%">订单号</th>
			<th width="20%">金额</th>
			<th width="10%">状态</th>
		</tr>
		<c:forEach items="${mwrObj }" var="mwrObj">
			<tr>
				<td>${mwrObj[10] }</td>
				<td>${mwrObj[1] }</td>
				<td><font color="#ff503f">￥${mwrObj[3] }</font></td>
				<td>
					<c:if test="${mwrObj[6]==0}">
						待审核
					</c:if>
					<c:if test="${mwrObj[6]==1}">
						已打款
					</c:if>
					<c:if test="${mwrObj[6]==2}">
						打款中
					</c:if>
					<c:if test="${mwrObj[6]==3}">
						打款失败
					</c:if>
				</td>
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
	<script type="text/javascript">
	function pagerequest(page){
		location.href="<%=basePath%>Main/tkjl?page="+page;
	}
	</script>


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

<div class="modal fade errorInfo infoModal" id="setWithdrawPWResultModel" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content jddModalContnt" style="border-radius: 0px;width:400px;">
					<div class="modal-header">
						<span>通知</span>
						<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
					</div>
					<div class="modal-body">
						<div id="setwithdrawError"></div>
						<button class="btn btn-success confirmBtn" data-dismiss="modal">确认</button>
					</div>
				</div>
			</div>
</div>
<script type="text/javascript">
	$("#withdrawConfirm").click(function () {
		var bankCard = $("#withdrawBankCard").val();
		var withdrawAmount = $("#withdrawAmount").val();
		var withdrawPW = $("#withdrawPW").val();
		if ($.trim(withdrawAmount) == "") {
			$("#withdrawError").html("请填写提款金额");
			$("#withdrawErrorModal").modal();
			$("#withdrawAmount").focus();
			return;
		}
		if (isNaN(withdrawAmount)) {
			$("#withdrawError").html("请填写正确的提款金额");
			$("#withdrawErrorModal").modal();
			$("#withdrawAmount").val("");
			$("#withdrawAmount").focus();
			return;
		}
		if (withdrawAmount < 10) {
			$("#withdrawError").html("提款金额不可少于10元");
			$("#withdrawErrorModal").modal();
			$("#withdrawAmount").val("");
			$("#withdrawAmount").focus();
			return;
		}
		if ($.trim(withdrawPW) == "") {
			$("#withdrawError").html("请填写提款密码");
			$("#withdrawErrorModal").modal();
			$("#withdrawPW").focus();
			return;
		}
		$("#withdrawConfirm").addClass("disabled");

		$.ajax({
			type : "POST",
			dataType : "json",
			async : true,
			url : baseContext+'Main/tk',
			data : {
				amount : withdrawAmount,
				withdrawalPassword : withdrawPW,
				bankCard: bankCard
			},
			success : function(resp) {
				if (resp.code == 0) {
					$("#withdrawError").html("提款申请提交成功");
					$("#withdrawErrorModal").modal();
					$("#withdrawErrorModal").on('hide.bs.modal', function () {
						window.location.reload();
					});
					setTimeout(function () { $("#withdrawErrorModal").modal('hide'); }, 3000);
				} else {
					$("#withdrawError").html(resp.msg);
					$("#withdrawErrorModal").modal();
				}
				$("#withdrawConfirm").removeClass("disabled");
			}
		});
	});
	</script>
</body>
</html>