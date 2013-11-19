/* select de fichas/ aparecer y desaparecer*/

$(document).ready(function(){

  $("#fichasDiv").css('display','none');
  $('#queja_programa_id').bind("change",function(e){
    var program = $(this).val()

    if (program != "") {
      $("#fichasDiv").css('display','block');
      update_fichas(program)
    } 
    else{
      $("#fichasDiv").css('display','none')
    };

    
    function update_fichas(programa_id){
      jQuery.ajax({
        url: "/quejas/update_ficha",
        type: "GET",
        data: {"programa_id" : programa_id},
        dataType: "html",
        success: function(data){
          jQuery("#fichasDiv").html(data);
        }
      });
    };
    

  });
});
