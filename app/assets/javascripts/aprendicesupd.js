$(document).ready(function(){

  $('.divapren').css('display','none');

  $('.selection').bind('change',function(){
    var  programaSelected = $('.selection :selected').val();
  
    if (programaSelected != "" ) {
      $('.divapren').css('display','block'); 
      update_aprendices(programaSelected);
    }
    else{
      $('.divapren').css('display','none');
    }

    function  update_aprendices(programa_id) {  
      jQuery.ajax({
        url: "/fcomites/update_aprendices",
        type: "GET",
        data: {"programa_id" : programa_id},
        dataType: "html",
        success: function(data) {
          jQuery('.divapren').html(data);
        }
      });
    }
  })  
});

 