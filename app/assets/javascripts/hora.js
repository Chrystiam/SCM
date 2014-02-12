$(document).ready(function(){

	$('.time_picker').timepicker();

	var ids  = $('#ids').val();
	var ids1 = String(ids)
    var ids2 = ids1.split(",");
    var tr = $("#tr").val();


	var  valuediv = $(".hora").attr("data-valor")
	var h = $(".h").val();

	$('.hora').click(function(){

		var trcont = $("#tr").val();
	    var tr0 = $(".trap").attr("data-valort");
		var idapdiv = $(".hora").attr("data-value");
		   alert(h+"//"+idapdiv+"//"+tr0+"//"+trcont);

		for (var i = 1;i < tr0; i) {
			$("")

		};
	});
});
