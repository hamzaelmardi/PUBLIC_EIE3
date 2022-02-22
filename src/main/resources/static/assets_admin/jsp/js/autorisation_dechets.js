/**
$(document).ready(function() {
    $('table').DataTable({
        "searching": false,
        "bLengthChange": false,
        language: {
            "sProcessing":     "Traitement en cours...",
            "sSearch":         "Rechercher&nbsp;:",
            "sLengthMenu":     "Afficher _MENU_ &eacute;l&eacute;ments",
            "sInfo":           "Affichage de l'&eacute;l&eacute;ment _START_ &agrave; _END_ sur _TOTAL_ &eacute;l&eacute;ments",
            "sInfoEmpty":      "Affichage de l'&eacute;l&eacute;ment 0 &agrave; 0 sur 0 &eacute;l&eacute;ment",
            "sInfoFiltered":   "(filtr&eacute; de _MAX_ &eacute;l&eacute;ments au total)",
            "sInfoPostFix":    "",
            "sLoadingRecords": "Chargement en cours...",
            "sZeroRecords":    "Aucun &eacute;l&eacute;ment &agrave; afficher",
            "sEmptyTable":     "Aucune donn&eacute;e disponible dans le tableau",
            "oPaginate": {
                "sFirst":      "Premier",
                "sPrevious":   "Pr&eacute;c&eacute;dent",
                "sNext":       "Suivant",
                "sLast":       "Dernier"
            },
            "oAria": {
                "sSortAscending":  ": activer pour trier la colonne par ordre croissant",
                "sSortDescending": ": activer pour trier la colonne par ordre d&eacute;croissant"
            },
            "select": {
                "rows": {
                    _: "%d lignes séléctionnées",
                    0: "Aucune ligne séléctionnée",
                    1: "1 ligne séléctionnée"
                }
            }
        }
    });
} );
 **/



function lod_modal(id){

    $("#myModal").addClass("modal"+id);
    $("#idntf").val(id);

}



function favorablefunct(){
    var date1 = $("#date1").val();
    var date2 = $("#date2").val();
    var favorable = $("#favorable").val();
    var cause_fav = $("#cause_fav").val();
    var idntf = $("#idntf").val();

    $.get("/admin/favorable/"+date1+"/"+date2+"/"+favorable+"/"+cause_fav+"/"+idntf, function(rep) {

        window.location.href = "/admin/autorisation";
    });


}



function view(file,compid){

    var i=0;
    var autorisations={
        'analyses_fiche':'Analyses/Fiche d’identification DD',
        'assurance_responsabilite':'Assurance  Responsabilité Civile',
        'autorisation_collecte':'Autorisation de Collecte et transport',
        'autorisation_exploitation':'Autorisation d’exploitation l’installation',
        'autorisation_installation':'Autorisation de l’installation',
        'cahier_charge':'Cahier de charge',
        'cap':'CAP',
        'contrat':'Contrat',
        'declaration_honneur':'Déclaration  l’honneur l’exactitude',
        'doc_mouvement':'DOC Mouvement',
        'doc_notifi':'DOC Notification',
        'garantie_Financiere':'Garantie Financière',
        'demandeautorisation':'Demande Autorisation',

    }

    $("#myModalfile").addClass("modalfl"+file);
    $("#id_notifcheck").val(file);
    $("#id_composcheck").val(compid);
    $.get("/lod_more/"+file , function(data) {

        if(data){

            $("#blockOner").empty();
            $("#blocktwor").empty();

        }



        for (const auto in data) {

            if(auto == "id"){ $("#blockOner").append('<input type="hidden" value="'+data.id+'" name="id_composdossier">');
            }
            if(auto == "id_notif"){ $("#blockOner").append('<input type="hidden" value="'+ data.id_notif+'" name="id_notif">');
            }
            if(auto != "id" && auto != "id_notif"){



                if(i<7){

                    var x=data[auto]==''?'#':'/upload/'+data[auto];
                    $("#blockOner").append("<div class='"+auto+" d-flex justify-content-between'>");
                    $("."+auto).append('<div><i class="mdi mdi-file'+getRightIcone(data[auto])+'"></i> '+autorisations[auto]+'</div> <div> <input type="checkbox" '+getdisabled(data[auto])+' name="'+auto+'" onclick="grtcheck()"  id="check_'+auto+'"><a target="_blank" href="'+x+'"><i class="mdi mdi-download" style="text-align: right;color: '+getColorDownloadIcone(data[auto])+'"></i></a></div>')
                    i+=1;
                }else{
                    var x=data[auto]==''?'#':'/upload/'+data[auto];
                    $("#blocktwor").append("<div class='"+auto+" d-flex justify-content-between'>");
                    $("."+auto).append('<div><i class="mdi mdi-file'+getRightIcone(data[auto])+'"></i> '+autorisations[auto]+' </div><div> <input type="checkbox" '+getdisabled(data[auto])+'  name="'+auto+'" onclick="grtcheck()"  id="check_'+auto+'"><a target="_blank" href="'+x+'"><i class="mdi mdi-download" style="text-align: right;color: '+getColorDownloadIcone(data[auto])+'"></i></a></div>')
                    i+=1;
                }

            }



        }


        $.get("/lod_check/"+file , function(data2) {


            $("#etatdech").val(data2.nt.etat).trigger("change");
            $("#causedech").val(data2.nt.cause);


            for (const auto in data2.cm) {
                var dt = data2.cm[auto];
                if (auto != "id" && auto != "id_notif" && auto != "id_composdossier"){

                    if (dt == "on") {
                        $('#check_' + auto).prop('checked', true)
                    } else {
                        $('#check_' + auto).prop("checked", false)
                    }
                }
            }

        });

    });


}


function  getdisabled(fl){
    if(fl=="" || fl==null){
        return "disabled"
    }else{
        return ""
    }
}
function getColorDownloadIcone(MyFile){
    if(MyFile=="" || MyFile==null){
        return "red"
    }else{
        return "blue"
    }
}
function getRightIcone(MyFile){

    if(MyFile!="" && MyFile!=null){

        var ext=MyFile.split(".");
        if(ext[1]=="pdf"){
            return "-pdf";
        }else if(ext[1]=="docx"){
            return "-word"
        }
    }
    return ""
}


function grtcheck(){
    $.post("/add_composdossier_check",$("#composcheck").serialize(), function(result){

    });
}