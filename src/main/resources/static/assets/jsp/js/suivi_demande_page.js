function searchNotificationSuivi(){
     etats={
        "demande_avis_ministre":["En Cours","primary"],
        "valide":["Valider","success"],
        "demande_avis_commerce":["En Cours","primary"],
        "en_attente":["en Attente","warning"],
        "refuse":["Refuse","danger"],
        "non_complet":["dossier non Complet","secondary"]
    };

    $("#searchResult").empty();

    var searchDossier=$("input[name=searchDossier]").val();
    if(searchDossier!=''){
        $.get( "/checknotif/"+searchDossier, function( dataNotif ) {

            var data=dataNotif.notif;

            if(searchDossier!=''){
                if(data!=null){
                    var will_be_added = "<div class=\"alert alert-"+etats[data.etat][1]+" alert-dismissible fade show\">" +
                        "<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" +
                        etats[data.etat][0] +"</div>"

                    $("#searchResult").empty();
                    $("#searchResult").append(will_be_added)
                }else{
                    var will_be_added = "<div class=\"alert alert-danger alert-dismissible fade show\">" +
                        "<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>resultat introuvable</div>"
                    $("#searchResult").empty();
                    $("#searchResult").append(will_be_added)
                }
            }

        });
    }
}




function searchdemandesuivieie(){
    etats={

        "en_attente":["en Attente","warning"],
        "refuse":["Refuse","danger"],
        "attachement_enquet_public":["Attacher L'enquête Public","success"],
        "on_reunion":["en reunion","primary"],
        "accepter":["Attente dépôt EIE","success"],
        "depot_depose":["EIE Déposée","success"],
        "etablis_acc":["Etablissement de l’acceptabilité","success"],
        "arretexam":["Arrêt d’examen","danger"],
        "nonacceptable":["Non Acceptable","danger"],
        "dmndcompl":["Demande de complément","danger"],
        "noatteint":["Quorum no atteint","danger"],
        "signature":["Attente Signature","primary"],
        "signature_final":["signée","success"],
    };

    $("#searchResult_eie").empty();

    var searchDossier=$("input[name=searchDossier_eie]").val();
    if(searchDossier!=''){
        $.get( "/checkdemande_eie/"+searchDossier, function( dataDemande ) {

            var data=dataDemande.dmnd;

            if(searchDossier!=''){
                if(data!=null){
                    var will_be_added = "<div class=\"alert alert-"+etats[data.etat][1]+" alert-dismissible fade show\">" +
                        "<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>" +
                        etats[data.etat][0] +"</div>"

                    $("#searchResult_eie").empty();
                    $("#searchResult_eie").append(will_be_added)
                }else{
                    var will_be_added = "<div class=\"alert alert-danger alert-dismissible fade show\">" +
                        "<button type=\"button\" class=\"close\" data-dismiss=\"alert\">&times;</button>resultat introuvable</div>"
                    $("#searchResult_eie").empty();
                    $("#searchResult_eie").append(will_be_added)
                }
            }

        });
    }
}