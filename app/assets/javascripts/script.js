$(document).ready(function() {

	$(".cpf").mask("999.999.999-99",{placeholder:" "});
	$(".rg").mask("99.999.999-X", {
								  translation: {
								  	'X':{
								  		pattern: /[X0-9]/
								  	}
								  }});
	$(".telefone").mask("(99) 99999-9999",{placeholder:" "});
	$(".cep").mask("99999-999",{placeholder:" "});
	$('.moeda').mask("###.###.##0,00", {reverse: true});

	$(".ano_faculdade").mask("9999",{placeholder:" "});

	$("#qtd_filhos").hide();

	$("#cliente_tem_filhos_true").change(function() {
		if($(this).is(":checked")) {
      $("#qtd_filhos").show();
    }
		else{
			$("#qtd_filhos").hide();
		}
	});
	$("#cliente_tem_filhos_false").change(function() {
		if($(this).is(":checked")) {
      $("#qtd_filhos").hide();
    }
		else{
			$("#qtd_filhos").show();
		}
	});
});
