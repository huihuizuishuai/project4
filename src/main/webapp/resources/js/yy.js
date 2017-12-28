
$(function(){
	$('.men').click(function(){
	     if($(this).next('.hider').is(':visible')){
			$(this).next('.hider').slideUp() 
		 }else{
		 	$(this).next('.hider').slideDown() 
		 }		
		
})
		
		
$('.btn-group span').click(function(){
		 $('.btn-group span').removeClass('active');
		 $(this).addClass('active');
		
	   })
 $('.pagination li').click(function(){
		 $('.pagination li').removeClass('active');
		 $(this).addClass('active');
		
	   })
 
 $("#er").bind("click", function () {
             var flag = $("#san").is(":hidden");
			if(flag){
				$("#san").show();
			}else{
				$("#san").hide();
			}
				   
            });
 
		
})

function select_all(){ 

    var a = document.getElementsByTagName("input");
    if(a[0].checked){
    for(var i = 0;i<a.length;i++){ 
    if(a[i].type == "checkbox") a[i].checked = false;
}
}
else{
    for(var i = 0;i<a.length;i++){
    if(a[i].type == "checkbox") a[i].checked = true;
}
}
}
