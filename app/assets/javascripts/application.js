// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require twitter/bootstrap
//= require jquery.remotipart
//= require lazybox
//= require_tree .


$(document).ready(function() {
  
  $('a#show_tipo_documento_link').lazybox({closeImg: true});
  
  $('a[rel*=lazybox]').lazybox({close: false, modal: false, opacity: 0.7, klass: 'lazybox', speed: 200});
  $.lazybox.settings = {cancelClass: "button green", submitClass: 'button red', closeImg: false, niceClose: false}
  $.rails.allowAction = $.lazybox.confirm;
  

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
