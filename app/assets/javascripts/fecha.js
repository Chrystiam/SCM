/* funcion para sacar la fecha como calendario*/


$(document).ready(function(){
	
  	$('.time_picker').timepicker();
  	
	$(".datepicker").datepicker({
		"format":"yyyy-mm-dd",
		"weekStart":1,
		"language":'es',
		"autoclose":true
	});
	// AJAX Form Submit
  $(".submit").click(function(event) {
 
      // Show Progress Indicator
      $(".ajax-progress").show();
 
    });
// END
});
