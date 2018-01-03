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
	<link rel="stylesheet" href="<%=basePath %>/resources/sys/ying/font2.css">
	<link rel="stylesheet" href="<%=basePath %>/resources/sys/style/bootstrap.css">
	<link rel="stylesheet" href="<%=basePath %>/resources/sys/style/style.css">
	<title>盈+后台管理中心</title>
</head>
<body>
<!-- 容器开始 -->
	<div class="container-layout">
	     <!-- 头部开始	 -->
	     <div class="row">
           <div id="top">
           <div class="col-sm-2">
           	     <div class="top-left">
           	     	<img src="<%=basePath %>/resources/sys/images/logo.jpg" alt="">
           	     </div>
           </div>

           <div class="col-sm-10">
           	  <div class="top-right">
           	    <ul class="nav nav-pills">
               <li><p>
               <span class="iconfont"><a href="#">&#xe605;</a></span></p><p>${username }</p>
               </li>
               <li style="width:100px"><p><a href="<%=basePath %>Admin/login"><span class="iconfont">&#xe606;</span></a></p><p>退出</p></li>
                </ul>
           	     </div>
          </div>
          </div>
          </div>
         <!-- 头部结束 -->

         <!-- 内容开始 -->
            <div class="row">
             <div id="box">
                <div class="col-sm-2">
             	  <div class="box-left">
                      <ul class="nav nav-pills nav-stacked">
                       <li><a href="javascript:;" class="titlea"><span class="iconfont">&#xe609;</span>理财产品</a></li>
		               <ul class="list-group">
			               <li class="list-group-item"><a href="<%=basePath %>XIAO/main" target="rightkj">固收类</a></li>
			               <!--  <li class="list-group-item"><a href="<%=basePath %>/views/financeProductFunds/list" target="rightkj">私募/股权类</a></li>
			               <li class="list-group-item"><a href="<%=basePath %>/overseaSys/overseaConfig" target="rightkj">海外配置</a></li>-->
		               </ul>
 					  <li><a href="javascript:;" class="titlea"><span class="iconfont">&#xe60c;</span>钱包管理</a></li>
              		  <ul class="list-group">
			               <li class="list-group-item"><a href="<%=basePath %>/dailycash/list" target="rightkj">钱包缴费记录</a></li>
                      </ul>
		              <li><a href="javascript:;" class="titlea"><span class="iconfont">&#xe60b;</span>学院管理</a></li>
		              <ul class="list-group">
			               <li class="list-group-item"><a href="<%=basePath %>/newsType/index" target="rightkj">资讯分类</a></li>
			               <li class="list-group-item"><a href="<%=basePath %>/news/index" target="rightkj">资讯管理</a></li>
		               
		              </ul>
		              <li><a href="javascript:;" class="titlea"><span class="iconfont">&#xe608;</span>会员管理</a>
		              </li>
		              <ul class="list-group">
			               <li class="list-group-item"><a href="<%=basePath %>Li/members" target="rightkj"></span>账号管理</a></li>
			               <li class="list-group-item"><a href="<%=basePath %>Li/planner" target="rightkj">理财师审核</a></li>
			               <li class="list-group-item"><a href="<%=basePath %>Li/likebank" target="rightkj">绑卡管理</a></li>
			               <li class="list-group-item"><a href="<%=basePath %>Li/subject" target="rightkj">付息计划</a></li>
			               <li class="list-group-item"><a href="<%=basePath %>Li/czpage" target="rightkj">充值管理</a></li>
			               <li class="list-group-item"><a href="<%=basePath %>Li/spr" target="rightkj">提现管理</a></li>
			              <!--   <li class="list-group-item"><a href="<%=basePath %>/sysmember/inviteRewards" target="rightkj">邀请奖励</a></li>-->
		              </ul>
		             
		              <li><a href="javascript:;" class="titlea"><span class="iconfont">&#xe60a;</span>盈+统计</a></li>
		              <ul class="list-group">
			               <li class="list-group-item"><a href="<%=basePath %>/statistics/financeList" target="rightkj">财务统计</a></li>
			               <li class="list-group-item"><a href="<%=basePath %>/statistics/userStatistics" target="rightkj">用户综合统计</a></li>
		              </ul>
		             
		              <li><a href="javascript:;" class="titlea"><span class="iconfont">&#xe60a;</span>盈+设置</a></li>
		              <ul class="list-group">
			               <li class="list-group-item"><a href="<%=basePath %>/setting/noticelist" target="rightkj">公告管理</a></li>
			               <li class="list-group-item"><a href="<%=basePath %>/setting/feedbackList" target="rightkj">意见反馈</a></li>
		              </ul>
		              <li><a href="javascript:;" class="titlea"><span class="iconfont">&#xe60d;</span>系统设置</a></li>
		              <ul class="list-group">
			               <li class="list-group-item"><a href="<%=basePath %>CJZ/userlist" target="rightkj">账户设置</a></li>
			               <li class="list-group-item"><a href="<%=basePath %>CJZ/rolelist	" target="rightkj">角色设置</a></li>
<%-- 			               <li class="list-group-item"><a href="<%=basePath %>CJZ/passwd/${username }" target="rightkj">密码设置</a></li> --%>
                      </ul>
		               </ul>
                </div>
                </div>
                <div class="col-sm-10">
                <div class="box-right">
                <iframe width="100%" id="kuangjia" name="rightkj" frameborder=0 scrolling=auto  src="<%=basePath %>Admin/index"></iframe>
               </div>
         </div>
         <!-- 内容结束 -->
	</div>
<!-- 容器结束 -->
</body>
 <script src="<%=basePath %>/resources/sys/js/jquery.js"></script>
  <script src="<%=basePath %>/resources/sys/js/bootstrap.js"></script>
  <script src="<%=basePath %>/resources/sys/js/yj.js"></script>
</html>
