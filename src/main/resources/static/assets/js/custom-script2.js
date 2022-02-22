function central(nbr,el){
	$(".selex").removeClass('active');
	$(el).addClass("active");
	if(nbr==0){

		$("#deco").addClass('d-none');
		$("#central").removeClass('d-none');


	}else if (nbr==1) {
		$("#central").addClass('d-none');
		$("#deco").removeClass('d-none');
	}
}

function zone_text(nbr){
	event.preventDefault();
	console.log("ooo");
	$(".zone_text").addClass('d-none');
	if (nbr==0) {
		$("#blk_content").hide('slow');
		$("#blk_select").show('slow');
	} else if(nbr==1){
		if($("#blk_select:visible").length>0){
			$("#blk_content").show('slow');
			$("#blk_select").hide('slow');
		}
		$("#zone_1").removeClass('d-none');

	}else if(nbr==2){
		if($("#blk_select:visible").length>0){
			$("#blk_content").show('slow');
			$("#blk_select").hide('slow');
		}
		$("#zone_2").removeClass('d-none');
		
	}else if(nbr==3){

		if($("#blk_select:visible").length>0){
			$("#blk_content").show('slow');
			$("#blk_select").hide('slow');
		}
		$("#zone_3").removeClass('d-none');
		
	}
}


function add_membre(){
  
  if(!$("#add_membre input").val()){
    alert('Le nom de l\'équipement de sécurité est obligatoire!');
    return false
  }
  $("#list_membre").append( '<div class="row p-0 m-0 mb-1"><div class="col-11 pl-0"><input disabled type="text" name="" value="'+$("#add_membre input").val()+'" class="form-control"></div><div class="col-1 pr-0 pl-0"> <button onclick="remove_membre(this)" class="btn btn-danger btn-block" style="padding: 5px"><i class="flaticon-delete-cross" ></i></button></div></div>');
  $("#add_membre input").val("");
}

function remove_membre(val){
  $(val).parents(".row:first").remove();
}


function open_link(url){
	url = url+".html";
	window.location=url;
}

function suivie(){
	if(!$.trim($("#num_dmd").val())){
		alert("le numeros est obligatoire");
		return false
	}
  $("#etape").show('slow');

}
/*
$(document).ready(function() {
	// SmartWizard initialize
  $('#smartwizard').smartWizard({
  	theme: 'dots',
  	cycleSteps: false,
  	toolbarSettings: {
      toolbarPosition: 'none', // none, top, bottom, both
  },
   anchorSettings: {
      anchorClickable: true, // Enable/Disable anchor navigation
      enableAllAnchors: false, // Activates all anchors clickable all times
      markDoneStep: false, // Add done css
      markAllPreviousStepsAsDone: false, // When a step selected by url hash, all previous steps are marked done
      removeDoneStepOnNavigateBack: false, // While navigate back done step after active step will be cleared
      enableAnchorOnDoneStep: false // Enable/Disable the done steps navigation
  },

  });
});*/


function switch_active(val){
	$(".btn_kd").removeClass('active');

	$(val).addClass('active');
	
}


function msg(nbr){
	if(nbr==2){
		Swal.fire(
		  'Votre dossier est complet',
		  '',
		  'success',
		)
	}

	if(nbr==1){
		Swal.fire(
		  'Votre Demande est enregistrer',
		  '',
		  'success'
		)
	}


	if(nbr==3){
		Swal.fire(
		  'la Demande est en attente',
		  'il faut ajouter le fichier x',
		  'warning'
		)
	}

	if(nbr==4){
		Swal.fire(
		  'la Demande est rejeté',
		  'Dossier non complet',
		  'error'
		)
	}


}