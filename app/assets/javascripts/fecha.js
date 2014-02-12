/* funcion para sacar la fecha como calendario*/


$(document).ready(function(){
	
    $('.time_picker').timepicker();
  
	$(".datepicker").datepicker({
		"format":"yyyy-mm-dd",
		"weekStart":1,
		"language":'es',
		"autoclose":true
	});


	$('#divapren').css('display','none');	
	$('.programas').change(function(){
		var programasele = $('.programas :selected').val();
		var fcomitesele = $('.fcomite :selected').val();
		var hora = $('.time_picker').val();
		if (programasele != "") {
			$('#divapren').css('display','block');
			var apren = $('#aprendiz').text();
			update_aprendices(programasele, hora, fcomitesele);
		}
		else{
			$('#divapren').css('display','none');
		}

	    function  update_aprendices(programa_id,hora) {  
	        $.ajax({
	        url: "/asignacioncomites/update_aprendices",
	        type: "GET",
	        data: ("programa_id=" +  programa_id + "&" + "hora=" + hora + "&"+ "fcomite_id=" + fcomitesele ),
	        dataType: "html",
		        success: function(data) {
		          jQuery('#divapren').html(data);
		        }
		    });
        }
	});

});