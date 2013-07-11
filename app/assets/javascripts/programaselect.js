$(document).ready(function() {
  
  $("#fichasDiv").css('display','none');
  $('#programa_id').bind('change',function(e){
    var program = $(this).val();
         
    if (program != ""){
      $("#fichasDiv").css('display','block'); 
      update_fichas_div(program)
    }
    else
      $("#fichasDiv").css('display','none');
    });
  });

  function update_fichas_div(programa_id) {  
  jQuery.ajax({
    url: "/update_fichas",
    type: "GET",
    data: {"programa_id" : programa_id},
    dataType: "html",
    success: function(data) {
      jQuery("#fichasDiv").html(data);
    }
  });

}