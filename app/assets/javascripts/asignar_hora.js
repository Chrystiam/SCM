$('.time_picker').timepicker();
$('#asignar').click(function(){

	var programasele = $('.programacoor :selected').val();
	var fcomitesele = $('.fcomite :selected').val();
	var  ids= $("input#ids").val();

    var horas = new Array()
	$(".hora").each(function(){
	  	horas.push($(this).val())
	})
	
	asignar_hora(horas,ids,programasele,fcomitesele)
})
function  asignar_hora(hora,ids,programasele,fcomitesele) {  
   $.ajax({
	    url:"/asignacioncomites/asignar_hora", //Defined in your routes file
	    data: ("horas=" +  hora + "&" + "ids=" + ids + "&"+ "programa_id=" + programasele + "&"+ "fcomite_id=" + fcomitesele)
    });

}