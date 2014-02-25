$(document).ready(function(){
	$('#divapren').css('display','none');
	$('.programacoor').change(function(){

		
		var programa = $('.programacoor :selected').val();
		if (programa != "") {
			$('#divapren').css('display','block');
			update_aprendices(programa)
		}
		else{
			$('#divapren').css('display','none');
		}

	    function  update_aprendices(programa_id) {  
	        $.ajax({
	        url: "/update_aprendices",
	        type: "GET",
	        data: ("programa_id=" +  programa_id),
	        dataType: "html",
		        success: function(data) {
		          jQuery('#divapren').html(data);
		        }
		    });
	    }
	});
});