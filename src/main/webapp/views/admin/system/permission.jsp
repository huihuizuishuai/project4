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
    <title>角色管理</title>
    <meta name="content-type" content="text/html; charset=UTF-8">
    
<meta name="keywords" content="盈+，盈，社区金融，O2O社区金融，社区金融O2O，O2O，互联网+社区金融，O2O连锁，社区门店，首家社区金融，社区金融服务，综合金融，互联网金融，体验中心，普惠金融，金融创新，社区化，普惠化，全渠道化，互联网线上平台，O2O交易，全国首家，盈十，金融衍生品，固收类理财，私募基金，股权基金，股指期货，玩转股指，商品期货，国际期货，外盘，A50，沪深300，中证500，上证50" />
<meta name="description" content="盈+——全国首家互联网金融交流体验中心，与您共盈，给财富做加法。" />
<link href="/winplus/resources/web/images/icon.ico" type="image/x-icon" rel="shortcut icon">

    <link href="/winplus/resources/style/iconfont.css" rel="stylesheet" type="text/css"/>
    <link href="/winplus/resources/style/bootstrap.css" rel="stylesheet" type="text/css"/>
    <link href="/winplus/resources/dist/css/bootstrapValidator.css" rel="stylesheet" type="text/css"/>
	<link href="/winplus/resources/style/pintuer.css"  rel="stylesheet"  type="text/css"/>
	<link href="/winplus/resources/style/button.css" rel="stylesheet" type="text/css"/>
	<link href="/winplus/resources/style/style.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="/winplus/resources/js/jquery.js"></script>
    <script type="text/javascript" src="/winplus/resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/winplus/resources/dist/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="/winplus/resources/js/pintuer.js"></script>
    <script type="text/javascript" src="/winplus/resources/js/yy.js"></script>
    <script type="text/javascript" src="/winplus/resources/js/yz.js"></script>

    <script src='/winplus/resources/dist/js/jquery.min.js'></script>
    <script src="/winplus/resources/dist/js/bootstrapValidator.min.js"></script>
    <script src="/winplus/resources/dist/js/ace-extra.min.js"></script>
    <script src="/winplus/resources/dist/js/bootstrap.min.js"></script>
    <script src="/winplus/resources/dist/js/ace-elements.min.js"></script>
    <script src="/winplus/resources/dist/js/ace.min.js"></script>
    <script src="/winplus/resources/dist/js/jquery.gritter.min.js"></script>

	  <link rel="stylesheet" href="/winplus/resources/dist/css/bootstrapValidator.min.css"/> 
	  <link rel="stylesheet" href="/winplus/resources/dist/css/font-awesome.min.css" /> 
	  <link rel="stylesheet" href="/winplus/resources/dist/css/ace-fonts.min.css" /> 
	  <link rel="stylesheet" href="/winplus/resources/dist/css/jquery.gritter.min.css" /> 
	  <!-- <link rel="stylesheet" href="/winplus/resources/dist/css/ace.min.css" />  -->
<!--  <style type="text/css"> -->
<!--      input{ -->
<!--          margin-right: 10px; -->
<!--      } -->
<!--      .has-feedback label ~ .form-control-feedback{ -->
<!--          top: 0px; -->
<!--      } -->
<!--      .form-horizontal .has-feedback .form-control-feedback{ -->
<!--          right: 280px; -->
<!--      } -->
<!--  </style> -->
  </head>
  <body>
	   <form name="roleForm" method="post" action="rolelist" class="roleForm">
	   <input type="hidden" name="roleId" value="1"/>
		   	<table class="table">
		      <tr style="background:#f5f5f5">
		         <td>主菜单</td>
		         <td style="padding-left:45px">子菜单名称</td>
		      </tr>
       		  <tr>
       			<td ><input  class="ruleMenuTitle" name="enameStr" type="checkbox" checked="checked" value="licai_mangere" />理财产品</td>
       			<td>
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="licai_gsl_p2p_manager" />固收类/P2P<br/>   
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="licai_sml_p2p_manager" />私募类<br/>   
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="licai_gql_p2p_manager" />股权类<br/>   
                </td>
	      	  </tr>
       		  <tr>
       			<td ><input  class="ruleMenuTitle" name="enameStr" type="checkbox" checked="checked" value="qianbao_mangere" />钱包管理</td>
       			<td>
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="qianbao_sjczjl_manager" />钱包缴费记录<br/>   
                </td>
	      	  </tr>
       		  <tr>
       			<td ><input  class="ruleMenuTitle" name="enameStr" type="checkbox" checked="checked" value="xueyuan_mangere" />学院管理</td>
       			<td>
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="xueyuan_zxgl_manager" />资讯管理<br/>   
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="xueyuan_spgl_manager" />资讯管理<br/>   
                </td>
	      	  </tr>
       		  <tr>
       			<td ><input  class="ruleMenuTitle" name="enameStr" type="checkbox" checked="checked" value="huiyuan_mangere" />会员管理</td>
       			<td>
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="huiyuan_zhgl_manager" />账号管理<br/>   
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="huiyuan_lcssh_manager" />理财师审核<br/>   
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="huiyuan_bkgl_manager" />绑卡管理<br/>   
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="huiyuan_fxgl_manager" />付息计划<br/>   
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="huiyuan_czgl_manager" />充值管理<br/>   
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="huiyuan_txgl_manager" />提现管理<br/>   
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="huiyuan_yqjl_manager" />邀请奖励<br/>   
                </td>
	      	  </tr>
       		  <tr>
       			<td ><input  class="ruleMenuTitle" name="enameStr" type="checkbox" checked="checked" value="yingjia_statistics" />盈+统计</td>
       			<td>
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="yingjia_statistics_finance" />财务统计<br/>   
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="yingjia_statistics_user" />用户综合统计<br/>   
                </td>
	      	  </tr>
       		  <tr>
       			<td ><input  class="ruleMenuTitle" name="enameStr" type="checkbox" checked="checked" value="yingjia_mangere" />盈+设置 </td>
       			<td>
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="yingjia_notice_manager" />发布公告<br/>   
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="yingjia_yjfk_manager" />意见反馈<br/>   
                </td>
	      	  </tr>
       		  <tr>
       			<td ><input  class="ruleMenuTitle" name="enameStr" type="checkbox" checked="checked" value="xitong_mangere" />系统管理</td>
       			<td>
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="xitong_userlist_manager" />管理员账户<br/>   
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="xitong_rolelist_manager" />管理员角色<br/>   
        	    <input  class="rulePowerList er" name="enameStr" type="checkbox" checked="checked" value="xitong_psw_manager" />修改密码<br/>   
                </td>
	      	  </tr>
		 </table>
		 <div class="col-sm-12  col-sm-offset-5 ">
              <button type="submit" class="btn btn-primary btn-sm submit">确认</button>
       	 </div>
		</form>

<script type="text/javascript">
$(function(){
		//一级选中
		$(".roleForm").delegate(".ruleMenuTitle","click",function(event){
				var ts = $(this),
				tsChk = ts.prop("checked"),
				ruleMenuTitle = ts.parent().parent(),
				rulePowerList = ruleMenuTitle.find("input");
				rulePowerList.each(function(k,e) {
					$(e).prop("checked",tsChk);
				});
				1
				event.stopPropagation();
		});
});
</script>
</body>
</html>
