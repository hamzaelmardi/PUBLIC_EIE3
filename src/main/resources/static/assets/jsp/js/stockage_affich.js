
$(document).ready(function() {
    $(".page-link").click(function () {
        var pg = $(this).text();
        $(".actall").removeClass("active");
        $(".act_"+pg).addClass("active");
        $.post("/stockage_detail", {pages: pg}, function (data) {

            $("#bodystockaffich").html("");
            $.each(data.notificaion, function(i, item) {

                var code="";
                if(item.code==1){code = 'code 1'; }
                if(item.code==2){code = 'code 2'; }
                if(item.code==3){code = 'code 3'; }
                if(item.code==4){code = 'code 4'; }

                var source="";
                if(item.source==1){source = 'source 1'; }
                if(item.source==2){source = 'source 2'; }
                if(item.source==3){source = 'source 3'; }
                if(item.source==4){source = 'source 4'; }

                var typee="";
                if(item.type==1){typee = 'type 1'; }
                if(item.type==2){typee = 'type 2'; }
                if(item.type==3){typee = 'type 3'; }
                if(item.type==4){typee = 'type 4'; }


                var unite="";
                if(item.unite==1){unite = 'Kg'; }
                if(item.unite==2){unite = 'L'; }
                if(item.unite==3){unite = 'Km'; }
                if(item.unite==4){unite = 'M'; }


                var etat ="";
                if(item.etat=="en_attente"){etat = '<i class="badge badge-warning">en attente </i>'; }
                if(item.etat=="refuse"){etat = '<i class="badge badge-danger">réfusé </i>'; }
                if(item.etat=="valide"){etat = '<i class="badge badge-success">validé </i>'; }
                if(item.etat=="non_complet"){etat = '<i class="badge badge-primary">dossier non complet</i>'; }
                if(item.etat=="demande_avis_commerce" || item.etat=="demande_avis_ministre"  ){etat = '<i class="badge badge-info">en cours</i>'; }


                var edit='<a href="/stockageedit?id="'+item.id+' class="btn btn-primary rounded-circle tab_edit"><i class="fa fa-edit"></i> </a>';

                var commentaire ="";
                if(item.cause=="null"){commentaire="";}


                $("#bodystockaffich").append('<tr>' +
                    '<td>'+item.num_notification+'</td>' +
                    '<td>'+code+'</td>' +
                    '<td>'+source+'</td>' +
                    '<td>'+typee+'</td>' +
                    '<td>'+item.quantite+'</td>' +
                    '<td>'+unite+'</td>' +
                    '<td>'+etat+'</td>' +
                    '<td>'+commentaire+'</td>' +
                    '<td> '+edit+' </td>' +
                    '</tr>');

            });

        });
    });
});




    function lod_more(file){
        // $("#dossierbd").html("");

        $("#myModal").addClass("modal"+file);

        var color1,color2,color3,color4,color5,color6,color7,color8,color9,color10,color11,color12;

        $.get("/lod_more/"+file , function(data) {

            $.each(data, function(i, item) {

                console.table(item);
                if(item.doc_notifi==""){item.doc_notifi="#"; color1 = "danger"; }else{item.doc_notifi="/upload/"+item.doc_notifi; color1 = "primary";}
                if(item.doc_mouvement==""){item.doc_mouvement="#"; color2 = "danger"; }else{item.doc_mouvement="/upload/"+item.doc_mouvement; color2 = "primary"; }
                if(item.garantie_Financiere==""){item.garantie_Financiere="#"; color3 = "danger"; }else{item.garantie_Financiere="/upload/"+item.garantie_Financiere; color3 = "primary";}
                if(item.contrat==""){item.contrat="#"; color4 = "danger"; }else{item.contrat="/upload/"+item.contrat; color4 = "primary";}
                if(item.analyses_fiche==""){item.analyses_fiche="#"; color5 = "danger"; }else{item.analyses_fiche="/upload/"+item.analyses_fiche; color5 = "primary";}
                if(item.cap==""){item.cap="#"; color6 = "danger"; }else{item.cap="/upload/"+item.cap; color6 = "primary";}
                if(item.autorisation_exploitation==""){item.autorisation_exploitation="#"; color7 = "danger"; }else{item.autorisation_exploitation="/upload/"+item.autorisation_exploitation; color7 = "primary";}
                if(item.autorisation_installation==""){item.autorisation_installation="#"; color8 = "danger"; }else{item.autorisation_installation="/upload/"+item.autorisation_installation; color8 = "primary";}
                if(item.assurance_responsabilite==""){item.assurance_responsabilite="#"; color9 = "danger"; }else{item.assurance_responsabilite="/upload/"+item.assurance_responsabilite; color9 = "primary";}
                if(item.autorisation_collecte==""){item.autorisation_collecte="#"; color10 = "danger"; }else{item.autorisation_collecte="/upload/"+item.autorisation_collecte; color10 = "primary";}
                if(item.declaration_honneur==""){item.declaration_honneur="#"; color11 = "danger"; }else{item.declaration_honneur="/upload/"+item.declaration_honneur; color11 = "primary";}
                if(item.cahier_charge==""){item.cahier_charge="#"; color12 = "danger"; }else{item.cahier_charge="/upload/"+item.cahier_charge; color12 = "primary";}



                $("#dossierbd").append("<ul>");
/* just for fun
                $("#dossierbd").append('<li>DOC Notification <a  target="_blank" class="btn btn-'+color1+' rounded-circle tab_edit" href="'+item.doc_notifi+'"><i class="fa fa-download"></i></a></li>');
                $("#dossierbd").append('<li>DOC Mouvement <a  target="_blank" class="btn btn-'+color2+' rounded-circle tab_edit" href="'+item.doc_mouvement+'"><i class="fa fa-download"></i></a></li>');
                $("#dossierbd").append('<li>Garantie Financière <a  target="_blank" class="btn btn-'+color3+' rounded-circle tab_edit" href="'+item.garantie_Financiere+'"><i class="fa fa-download"></i></a></li>');
                $("#dossierbd").append('<li>Contrat <a  target="_blank" class="btn btn-'+color4+' rounded-circle tab_edit" href="'+item.contrat+'"><i class="fa fa-download"></i></a></li>');
                $("#dossierbd").append('<li>Analyses/Fiche d’identification DD <a  target="_blank" class="btn btn-'+color5+' rounded-circle tab_edit" href="'+item.analyses_fiche+'"><i class="fa fa-download"></i></a></li>');
                $("#dossierbd").append('<li>CAP<a  target="_blank" class="btn btn-'+color6+' rounded-circle tab_edit" href="'+item.cap+'"><i class="fa fa-download"></i></a></li>');
                $("#dossierbd").append('<li>Autorisation d’exploitation de l’installation <a  target="_blank" class="btn btn-'+color7+' rounded-circle tab_edit" href="'+item.autorisation_exploitation+'"><i class="fa fa-download"></i></a></li>');
                $("#dossierbd").append('<li>Autorisation de l’installation <a  target="_blank" class="btn btn-'+color8+' rounded-circle tab_edit" href="'+item.autorisation_installation+'"><i class="fa fa-download"></i></a></li>');
                $("#dossierbd").append('<li>Assurance de la Responsabilité Civile de l’installation<a  target="_blank" class="btn btn-'+color9+' rounded-circle tab_edit" href="'+item.assurance_responsabilite+'"><i class="fa fa-download"></i></a></li>');
                $("#dossierbd").append('<li>Autorisation de Collecte et transport <a  target="_blank" class="btn btn-'+color10+' rounded-circle tab_edit" href="'+item.autorisation_collecte+'"><i class="fa fa-download"></i></a></li>');
                $("#dossierbd").append('<li>Déclaration sur l’honneur sur l’exactitude des informations présentées <a  target="_blank" class="btn btn-'+color11+' rounded-circle tab_edit" href="'+item.declaration_honneur+'"><i class="fa fa-download"></i></a></li>');
                $("#dossierbd").append('<li>Cahier de charge <a  target="_blank" class="btn btn-'+color12+' rounded-circle tab_edit" href="'+item.cahier_charge+'"><i class="fa fa-download"></i></a></li>');
                $("#dossierbd").append("</ul>");
*/
            });

        });

    }


    function view(file){
        $("#blockOne").empty();
        $("#blocktwo").empty();
        var i=0;
        var autorisations={
            'analyses_fiche':'Analyses/Fiche d’identification DD',
            'assurance_responsabilite':'Assurance de la Responsabilité Civile de l’installation',
            'autorisation_collecte':'Autorisation de Collecte et transport',
            'autorisation_exploitation':'Autorisation d’exploitation de l’installation',
            'autorisation_installation':'Autorisation de l’installation',
            'cahier_charge':'Cahier de charge',
            'cap':'CAP',
            'contrat':'Contrat',
            'declaration_honneur':'Déclaration sur l’honneur sur l’exactitude des informations présentées',
            'doc_mouvement':'DOC Mouvement',
            'doc_notifi':'DOC Notification',
            'garantie_Financiere':'Garantie Financière',
        }

        $("#myModal").addClass("modal"+file);
        $.get("/lod_more/"+file , function(data) {
            for (const auto in data) {
                if(auto != "id" && auto != "id_notif"){
                    if(i<6){
                        var x=data[auto]==''?'#':'/upload/'+data[auto];
                        $("#blockOne").append("<div class='"+auto+" d-flex justify-content-between'>");
                        $("."+auto).append('<div><i class="far fa-file'+getRightIcon(data[auto])+'"></i> '+autorisations[auto]+' </div><div><a target="_blank" href="'+x+'"><i class="fa fa-download" style="text-align: right;color: '+getColorDownloadIcon(data[auto])+'"></i></a></div>')
                        i+=1;
                    }else{
                        var x=data[auto]==''?'#':'/upload/'+data[auto];
                        $("#blocktwo").append("<div class='"+auto+" d-flex justify-content-between'>");
                        $("."+auto).append('<div><i class="far fa-file'+getRightIcon(data[auto])+'"></i> '+autorisations[auto]+' </div><div><a target="_blank" href="'+x+'"><i class="fa fa-download" style="text-align: right;color: '+getColorDownloadIcon(data[auto])+'"></i></a></div>')
                        i+=1;
                    }

                }
            }
        });
    }

    function getColorDownloadIcon(MyFile){
        if(MyFile==""){
            return "red"
        }else{
            return "blue"
        }
    }

    function getRightIcon(MyFile){
        if(MyFile!=""){
            var ext=MyFile.split(".");
            if(ext[1]=="pdf"){
                return "-pdf";
            }else if(ext[1]=="docx"){
                return "-word"
            }
        }
        return ""
    }