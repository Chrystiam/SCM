/* select de fichas/ aparecer y desaparecer*/
$(document).ready(function() {
  
  $("#programasDiv").css('display','none');
  $('#centro_id').bind('change',function(e){
    var cent = $(this).val();
         
    if (cent != ""){
      $("#programasDiv").css('display','block'); 
      update_programas_div(cent)
    }
    else{
      $("#programasDiv").css('display','none');
    }

    function update_programas_div(centro_id) {  
      jQuery.ajax({
        url: "/update_programas",
        type: "GET",
        data: {"centro_id" : centro_id},
        dataType: "html",
        success: function(data) {
          jQuery("#programasDiv").html(data);
        }
      });
    }
  });
});