$(function(){

	$('.box-left').css("height",$(window).height()-90);
	$('#kuangjia').css("height",$(window).height()-95);
	

	$(".box-left .nav-pills li").click(function(){

		$(this).next(".list-group").toggle(500);
	})

})