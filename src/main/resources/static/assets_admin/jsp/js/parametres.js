$(document).ready(function() {
    $('.dropdown-toggle').dropdown();
    $(".select2").select2();


    $(".tab_trash").on({
        mouseenter: function() {
            $(this).parent().find(".icon_trash_1").addClass('d-none');
            $(this).parent().find(".icon_trash_2").removeClass('d-none');

        },
        mouseleave: function() {
            $(this).parent().find(".icon_trash_2").addClass('d-none');
            $(this).parent().find(".icon_trash_1").removeClass('d-none');

        }
    });



});
function frm_search(id){
    if($("#"+id+" #zone_search:visible").length!=0)
        $("#"+id+" #zone_search:visible").hide('slow');
    else
        $("#"+id+" #zone_search").show('slow');
}



function traitement_(id){
    $(".from_add").hide();
    $(".z_tab").hide();
    $(".flip-card-front").css({'background':'#fff',"color":"black"});
    $('h6.card-title2').css('color', 'black');

    if($("#subtab_"+id+":visible").length!=0){
        $("#subtab_"+id+":visible").hide('slow');
        $('div.flip-card-front:eq('+id+')').css('background-color', '#fff');
        $('div.flip-card-front:eq('+id+')').css('color', 'black');
        $('h6.card-title2:eq('+id+')').css('color', 'black');
        $('h6.card-title2:eq('+id+')').css('font-weight', '500');
    }
    else {
        for (var iter = 0; iter < 22; iter++) {
            if (iter != id) {
                $("#subtab_"+id).hide('slow');
            }
        }
        $("#subtab_"+id).show('slow');
        $('div.flip-card-front:eq('+id+')').css('background-color', '#003366');
        $('div.flip-card-front:eq('+id+')').css('color', '#fff');
        $('h6.card-title2:eq('+id+')').css('color', '#fff');

    }
}

function frm_table(id_tab,id_form){
    /*'subtab_0','frm_etatDoss'*/
    $("#"+id_tab).hide("slow");
    $("#"+id_form).show("slow");
}


function delete_tr(val){
    swal({
        title: 'Êtes-vous sûr ?',
        text: "Vous ne pourrez pas revenir sur cela !",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#00695c',
        cancelButtonColor: '#d33',
        confirmButtonText: 'Oui, supprimer !',
        cancelButtonText: "Annuler",
    }, function (isConfirm) {
        if (isConfirm) {
            swal("Supprimé!", "L'élément a bien été supprimé", "success");
            //tableProfils.row($(btn).parents('tr')).remove().draw(false);
            $(val).parents("tr:first").remove();
        } else {
            swal("Annulé!", "L'élément n'a pas été supprimé", "error");
        }
    });
}