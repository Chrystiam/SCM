$(document).ready(function(){
	
    $('.time_picker').timepicker();

		
	$('#programas').css('display','none');
	$('.coordinador').change(function(){
		var coordinadorselec = $('.coordinador :selected').val();

		if (coordinadorselec != "") {
			$('#programas').css('display','block');
			crear_progra(coordinadorselec)
		}
		else{
			$('#programas').css('display','none');
		}

		function  crear_progra(coordinador_id) {  
	        $.ajax({
	        url: "/update_programa",
	        type: "GET",
	        data: ("coordinador_id=" +  coordinador_id),
	        dataType: "html",
		        success: function(data) {
		          jQuery('#programas').html(data);
		        }
		    });
        }

	})
});