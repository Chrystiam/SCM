/* funcion para sacar la fecha como calendario*/


$(document).ready(function(){
	
    $('.time_picker').timepicker();
	$(".datepicker").datepicker({
		"format":"yyyy-mm-dd",
		"weekStart":1,
		"language":'es',
		"autoclose":true
	});
	
	$(function(){

		
		
		
			setTimeout(hola, 1000); 
		

	})

	function hola(){

		var si = $("#user").attr("data-usid")

	     if (si == "coordinador") {
	     	alert(si);
	     };
		    
		
	   
			
	}
		
	

	/*
	$('#env').click(function(){
		$("#env").css('display','none');

	});
    */
});