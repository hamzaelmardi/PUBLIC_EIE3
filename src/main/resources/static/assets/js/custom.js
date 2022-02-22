function show_sing_sele(val) {
    show_etape_perso()
    $(".single_check").prop("checked", false);
    $(val).prop("checked", true);
}

function fun_setqulaif() {
    event.preventDefault();
    var id_install = $("#id_installation").val();

    if ($.trim(id_install) == "" || id_install == 0 || id_install == null) {
        return false;
    }
    var data = new FormData();
    var ins = document.getElementById("qualif").files.length;
    for (var x = 0; x < ins; x++) {
        data.append("fileToUpload", document.getElementById("qualif").files[x]);
    }


    $.ajax({

        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/setFilQualifToInstall/" + id_install,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (response) {

        },
        error: function () {

        }
    });


}

function affiche_eie_zone(id_show, id_btn_to_active) {
    if (event != null)
        event.preventDefault();
    $(".cls_step").removeClass("active");
    $(id_btn_to_active).addClass('active');

    $(".z_collecteur").hide();
    $(id_show).show();

}

function affiche_nume_zone(val) {
    $(".zone_tab").slideUp();

    $("#" + val).slideDown({
        "duration": "5000",
        "start": function () {
            $('#' + val).css('display', 'flex')
        },
        "done": function () {
            window.scrollTo(0, document.body.scrollHeight)
        },
    });


}

function show_etape_perso(id) {

    if (id == null || id == "") {
        swal("Merci de choisir un type d'autorisation");
        return false;
    }

    $("#zone_rech").addClass("d-none");
    $("#dev_step").removeClass("d-none");
    $("#dev_list_slc").addClass("d-none");

    $.ajax({
        url: '/getProcedureAuto/'+id,
        type: 'POST',
        data: {},
    })
        .done(function(response) {
            $("#procedure_content").html(response);
            $("#zone_rech").addClass("d-none");
            $("#dev_step").removeClass("d-none");
            $("#dev_list_slc").addClass("d-none");
            $(".select2").select2();
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        });

}

function show_etape_normal() {

    $("#zone_rech").removeClass("d-none");
    $("#dev_step").addClass("d-none");
    $("#dev_list_slc").addClass("d-none");
    $("#EIE_groupe").removeClass("d-none");
    $("#autorisation_groupe").removeClass("d-none");

}

function show_zone(hideClass, val) {
    $(".clss_hide").hide();
    $("." + hideClass).show();
    $(".btn_step_perso").removeClass("btn-success");
    $(".btn_step_perso").addClass("btn_gris");
    $(val).removeClass("btn_gris");
    $(val).addClass("btn-success");
    if(hideClass==="attache"){
        var type = $(val).attr("data_type");
        if (type===""){
            return false;
        }
        $.ajax({
            url: '/getAccordionDoc/'+type,
            type: 'POST',
            data: {},
        })
            .done(function(response) {
                $(val).attr("data_type","");
                $("#accordion").html(response);
                $("#accordion").accordion({
                    collapsible: false,
                    heightStyle: "content",
                    active:false,
                });
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
    }
}

function go_to(url) {
    window.location.href = url;
}

function sectautoris_table_select(nbr) {
    if(nbr==="auth"){
        $("#zone_rech").addClass("d-none");
        $("#dev_list_slc").removeClass("d-none");
        $("#dev_list_slc2").addClass("d-none");
    }else if(nbr==="EIE"){
        $("#zone_rech").addClass("d-none");
        $("#dev_list_slc2").removeClass("d-none");
        $("#dev_list_slc").addClass("d-none");
    }

    if(nbr===1){
        $("#dev_list_slc").removeClass("d-none");
        $("#zone_rech").addClass("d-none");
        $("#autorisation_groupe").removeClass("d-none");
        $("#EIE_groupe").addClass("d-none");
    }else if(nbr===2){
        $("#dev_list_slc").removeClass("d-none");
        $("#zone_rech").addClass("d-none");
        $("#EIE_groupe").removeClass("d-none");
        $("#autorisation_groupe").addClass("d-none");
    }
    if(nbr===3){
        $("#dev_list_slc").removeClass("d-none");
        $("#zone_rech").addClass("d-none");
        $("#autorisation_groupe").removeClass("d-none");
        $("#dev_step").addClass("d-none");
        $("#EIE_groupe").addClass("d-none");
    }else if(nbr===4){
        $("#dev_list_slc").removeClass("d-none");
        $("#zone_rech").addClass("d-none");
        $("#dev_step").addClass("d-none");
        $("#EIE_groupe").removeClass("d-none");
        $("#autorisation_groupe").addClass("d-none");
    }

}

function secteie_table_select() {
    $("#zone_rech").addClass("d-none");
    $("#dev_list_slc").removeClass("d-none");
}

function openCity2(id_active, cityName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(cityName).style.display = "block";
    $(id_active).addClass("active");
}




function getOptionByFilter(val, table, select_id) {
    alert_error_disabled("Select[name=classification_id]");
    alert_error_disabled("Select[name=code_id]");
    $.get('/api/tronsactionCO/select/' + table + '/delete_date_time is null and ' + val, function (data) {

        $("#" + select_id)
            .empty()
            .append('<option selected="selected" dir="auto" value="">Choisir</option>');

        $.each(data, function (i, v) {
            //console.log("data : ", $(data));
            //console.log("v : ", $(v));
            //$("#" + select_id).prepend(new Option(v[1], v[0]));
            $("#" + select_id).append('<option  value="'+v[0]+'">'+v[1]+'</option>');
        })


        if ($(data).length == 1) {
            $.each(data, function (i, v) {
                $("#" + select_id)
                    .empty()
                    .append('<option  selected="selected" value="'+v[0]+'">'+v[1]+'</option>');
            })

        }

        $("#" + select_id).trigger("change");
    })
    ;
}

$(function () {
    $("#accordion").accordion({
        collapsible: true,
        heightStyle: "content",
        active : false,
    });
});

function addDoc_eie(id_name, type, idInput) {
    var data = new FormData();

    var ins = document.getElementById(idInput).files.length;

    for (var x = 0; x < ins; x++) {
        data.append("fileToUpload", document.getElementById(idInput).files[x]);
    }
    var id = $("#" + id_name).val();
    if ($.trim(id) == "" || !$.isNumeric(id) || id == null) {
        swal("Avertissement !", "le numero de EIE n'est pas valide", "error");
        return false;
    }


    $.ajax({

        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/addDoc/" + id + "/" + type,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (response) {


        },
        error: function () {


        }
    });
}

/*function updateRegionDemandeInfomration(type, id_name, next_step, id_btn) {
    if(event!=null)
        event.preventDefault();

    var region = ""
    var prefecture = "";
    var commune = "";

    var trans = $("#interregion").val();
    if (trans == "non") {
        if (next_step != "end") {
            $(".cls_step").removeClass('active')
            $(id_btn).addClass('active');
            $(".z_collecteur").hide();
            $(next_step).show();
            return false;
        } else if (next_step == "end") {
           // window.location.href = "/api/ListeEie/"+type;

        }
    }


    var tmp = $("#id_region").val();
    if(trans != "oui" && type!="NT" && type!='AE' ){
        if( tmp.length < 2 ){
            swal("Avertissement ! ","Merci de choisir aux moins deux régions","error");
            return false;
        }
    }

    if(trans == "oui" || type=="AE" || type=="NT" ){
        region = $("#id_region").val().join();
        prefecture = $("#id_prefecture").val().join();
        commune = $("#id_commune").val().join();
    }else if(trans=="non"){
        region = "0";
        prefecture = "0";
        commune = "0";
    }



    var formdata = new FormData();
    formdata.append('region', region);
    formdata.append("prefecture", prefecture);
    formdata.append('commune', commune);

    var id = $("#id_demande_information").val();
    var link_recap = "/api/recapEie/" + id+"/"+type;
    $.ajax({
        type: "POST",
        url: "/api/updateRegionDemandeInformation/" + id + "/" + type,
        contentType: false,
        processData: false,
        data: formdata,
        success: function (response) {
            if (next_step != "end") {
                $(".cls_step").removeClass('active')
                $(id_btn).addClass('active');
                $(".z_collecteur").hide();
                $(next_step).show();
            } else if (next_step == "end") {
                Swal.fire({
                    title: '<strong>Votre demande est déposée avec succès</strong>',
                    icon: 'success',
                    html:'<a href="' + link_recap + '" class="btn btn-success ml-2 ">Afficher le Récapitulatif</a>',
                    showCloseButton: false,
                    showCancelButton: false,
                    showConfirmButton: false,
                    focusConfirm: false,
                })
            }
        },
        error: function (response) {

            alert('Erreur ajout non effectue');

        }
    });

}*/

function changer_statut(id_name, code_statut, msg_alert) {
    if(event!=null)
        event.preventDefault();
    var id = $("#" + id_name).val();
    var link_recap = "/api/recapEie/" + id;
    if ($.trim(id) == "" || !$.isNumeric(id) || id == null) {
        swal("Avertissement !", "le numero de EIE n'est pas valide", "error");
        return false;
    }

    $.ajax({
        url: "/api/changerStatuts/" + id + "/" + code_statut,
        type: 'GET',
        data: {},
    })
        .done(function (data) {
            Swal.fire({
                title: '<strong>' + msg_alert + '</strong>',
                icon: 'success',
                html:'<a href="' + link_recap + '" class="btn btn-success ml-2 ">Afficher le Récapitulatif</a>',
                showCloseButton: false,
                showCancelButton: false,
                showConfirmButton: false,
                focusConfirm: false,
            })
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}

function changer_statut_type(id_name, code_statut, msg_alert, type) {
    if(event!=null)
        event.preventDefault();
    var id = $("#" + id_name).val();
    var doc = $("#docp")[0].files.length;
    var test=false;
    var link_recap = "/api/recapEie/" + id+"/"+type;
    if ($.trim(id) == "" || !$.isNumeric(id) || id == null) {
        swal("Avertissement !", "le numero de EIE n'est pas valide", "error");
        return false;
    }
    if(type==="EE"){
        var docEE = $("#docr")[0].files.length;
        if(docEE===0 || doc===0){
            swal("Avertissement !", "le numero de EIE n'est pas valide", "error");
            test=true;
        }
    }
    else if(type==="AE"){
        var docAE = $("#docr2")[0].files.length;
        if(docAE===0 || doc===0){
            swal("Avertissement !", "le numero de EIE n'est pas valide", "error");
            test=true;
        }
    }
    else {
        var docNT = $("#docp")[0].files.length;
        if(docNT===0 || doc===0){
            swal("Avertissement !", "le numero de EIE n'est pas valide", "error");
            test=true;
        }
    }

    if(test){
        swal("Avertissement !", "Tous les fichiers is obligatoire", "error");
    }
    else{
        $.ajax({
            url: "/api/changerStatuts/" + id + "/" + code_statut,
            type: 'GET',
            data: {},
            success: function (response) {
                Swal.fire({
                    title: '<strong>' + msg_alert + '</strong>',
                    icon: 'success',
                    html:'<a href="' + link_recap + '" class="btn btn-success ml-2 ">Afficher le Récapitulatif</a>',
                    showCloseButton: false,
                    showCancelButton: false,
                    showConfirmButton: false,
                    focusConfirm: false,
                })
            },
            error: function () {

            }
        });
    }
}



function set_avis_projet(val_id, id_dmd) {
    event.preventDefault();
    var id_demande = $(id_dmd).val();
    if ($.trim(id_demande) == "" || id_demande == 0 || id_demande == null) {
        return false;
    }

    var data = new FormData();
    var file = $(val_id);
    if ($(file)[0].files.length == 0)
        return false;

    data.append("fileToUpload", $(file)[0].files[0]);


    $.ajax({

        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/setAvisProjet/" + id_demande,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (response) {
            swal({
                    title: "Document enregistrer",
                    text: "L'avis du projet à été Enregistré avec succès",
                    type: "success",
                    showCancelButton: false,
                    confirmButtonText: "Retour",
                    closeOnConfirm: false,
                },
                function (isConfirm) {
                    if (isConfirm) {
                        window.location.href = "/api/checkEIESelect/EE";
                    }
                });
        },
        error: function () {

        }
    });

}


function validateEmail($email) {
    var emailReg = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return emailReg.test( $email );
}

function validatePhone($tel) {
    var filter = /^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/;
    return filter.test( $tel );
}
function validateFax($tel) {
    var filter = /^\\+[0-9]{1,3}-[0-9]{3}-[0-9]{7}$/;
    return filter.test( $tel );
}


/*$(function() {
// Initialize form validation on the registration form.
// It has the name attribute "registration"
    $("form[name='zone_form1']").validate({
        rules: {
            mail: {
                required: true,
                email: true,
                accept:"[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}"
            },
            tel : {
                required: true,
                number : true,
                minlength:10,
                maxlength:10
            },
            /!*fax : {
                required: true,
                number : true,
                minlength:10,
                maxlength:10
            },*!/
        },

        messages: {
            mail: "S'il vous plaît, mettez une adresse email valide",
            tel: "S'il vous plaît, mettez un telephone valide",
            //fax: "S'il vous plaît, mettez un fax valide",

        },
        submitHandler: function(form) {
            form.submit();
        }

    });
});*/

function removePort(btn,id,id_name,id_trans){
    if(event!=null)
        event.preventDefault();
    var id_notif = $("#" + id_name).val();
    $.ajax({
        url: '/api/deletePort/' + id_notif +'/'+ id +'/'+id_trans,
        type: 'POST',
        data: {},
    })
        .success(function (data) {
            $("#row_from_groupe_port").html(data);
            $("#"+btn).hide();
        })
        .error(function () {
            console.log("error");
        })

}
function ajouterTranporteur_EtrangerNational(id_name,val) {

    //event.preventDefault();
    var id = $("#" + id_name).val();
    var raison = $("#raison_social_n").val();
    var matricule = $("#num_matriule_n").val();
    var type_vehicule = $("#type_vehicule_n").val();
    var adresse = $("#adresseTr_n").val();
    var local=$("#local").val();
    if(local!="ar"){
        var fn="fr";
    }
    else{
        var fn="ar";
    }

    if (raison == "" || matricule=="" || type_vehicule=="") {
        if(fn=='ar')
        {
            swal({
                title: " ! تحذير  ",
                text: "كل الحقول إلزامية",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "اغلاق ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });
        }
        else
        {
            swal({
                title: "Avertissement !",
                text: "tous les champs sont obligatoire",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "OK ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });
        }
        return false;
    }
    var id_trans = $("#id_trans_n").val();
    if ($.trim(id_trans) === "" || id_trans == null || !$.isNumeric(id_trans)) {
        id_trans = 0;
    }
    var data = new FormData();
    data.append("raison", raison);
    data.append("matricule", matricule);
    data.append("type_vehicule", type_vehicule);
    data.append("adresse", adresse);


    var ins = document.getElementById("doc_assurance_n").files.length;
    /*if (ins == 0 && !$("#btn_downolad").is(":visible")) {
        if(fn=='ar')
        {
            swal({
                title: " ! تحذير  ",
                text: "أضف ملف",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "اغلاق ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });
        }
        else
        {
            swal({
                title: " Avertissement !  ",
                text: "Le fichier est obligatoire",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "OK ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });
        }
        return false;
    }*/

    if(ins!=0){
        for (var x = 0; x < ins; x++) {
            var file = document.getElementById("doc_assurance_n").files[x];
            if (file.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
                swal("Alert", "Type de fichier non pris en charge", "error");
                return false;
            }
            data.append("fileToUpload", file);
        }
    }else{
        data.append("fileToUpload", null);
    }


    $(val).prop("disabled", "true");
    $('#loader_modal').modal('show');
    $.ajax({
        url: '/api/addTransporteuretrangerNational/' + id + "/" + id_trans,
        type: 'POST',
        processData: false,
        contentType: false,
        cache: false,
        data: data,
    })
        .done(function (data) {
            $("#row_from_groupe").html(data);
            $(val).prop("disabled", "false");
            $('#loader_modal').modal('hide');
        })
        .fail(function () {
            console.log("error");
            $(val).prop("disabled", "false");
            $('#loader_modal').modal('hide');
        })
        .always(function () {
            $("#id_trans_n").val("");
            console.log("id : ",$("#id_trans_n").val());
            console.log("complete");
            $(val).prop("disabled", "false");
            $('#loader_modal').modal('hide');

        });

}

function delete_transp_etrang(id, id_name, type,lng){
    var id_notif = $("#" + id_name).val();
    $.ajax({
        url: '/api/deleteTransporteuretranger/' + id_notif + '/' + id + "/" + type,
        type: 'POST',
        data: {},
    })
        .done(function (data) {
            if(lng!='ar')
            {

                swal({
                        title: "Suppression",
                        text: "Le transporteur à été supprimer avec succès",
                        type: "success",
                        showCancelButton: false,
                        confirmButtonColor: "#256144",
                        confirmButtonText: "OK ",
                        //closeOnConfirm: true,
                        //showLoaderOnConfirm: true,
                        html: false
                    },

                    function () {
                        $("#row_from_groupe").html(data);
                        $("#tr_"+id).hide();
                    });
            }
            else {

                swal({
                        title: "حذف",
                        text: "تمت إزالة شركة النقل  بنجاح",
                        type: "success",
                        showCancelButton: false,
                        confirmButtonColor: "#256144",
                        confirmButtonText: "اغلاق ",
                        //closeOnConfirm: true,
                        //showLoaderOnConfirm: true,
                        html: false
                    },

                    function () {
                        $("#row_from_groupe").html(data);
                        $("#tr_"+id).hide();
                    });

            }


        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}
function delete_transp_etrang2(id, id_name, type) {
    var id_notif = $("#" + id_name).val();
    var local=$("#local").val();
    if(local!="ar"){
        var fn="fr";
    }
    else{
        var fn="ar";
    }
    $.ajax({
        url: '/api/deleteTransporteuretranger/' + id_notif + '/' + id + "/" + type,
        type: 'POST',
        data: {},
    })
        .done(function (data) {
            if(fn!='ar')
            {

                swal({
                        title: "Suppression",
                        text: "Le transporteurs à été supprimer avec succès",
                        type: "success",
                        showCancelButton: false,
                        confirmButtonColor: "#256144",
                        confirmButtonText: "OK",
                        //closeOnConfirm: true,
                        //showLoaderOnConfirm: true,
                        html: false
                    },
                    function () {
                        $("#row_from_groupe_port").html(data);
                        $("#trr_"+id).hide();
                    });
            }
            else
            {

                swal({
                        title: "حذف",
                        text: "تمت إزالة شركة النقل بنجاح",
                        type: "success",
                        showCancelButton: false,
                        confirmButtonColor: "#256144",
                        confirmButtonText: "اغلاق  ",
                        //closeOnConfirm: true,
                        //showLoaderOnConfirm: true,
                        html: false
                    },
                    function () {
                        $("#row_from_groupe_port").html(data);
                        $("#trr_"+id).hide();
                    });
            }


        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}


function deleteProducteurNotification(id_prod, id_name) {
    var id_notif = $("#" + id_name).val();

    var local=$("#local").val();
    if(local!="ar"){
        var fn="fr";
    }
    else{
        var fn="ar";
    }

    $.ajax({
        url: '/api/deleteProducteurNotification/' + id_notif + '/' + id_prod,
        type: 'POST',
        data: {},
    })
        .done(function (data) {
            if(fn=='ar')
            {
                swal({
                        title: "حذف",
                        text: "تم حذف المنتج بنجاح",
                        type: "success",
                        showCancelButton: false,
                        confirmButtonColor: "#256144",
                        confirmButtonText: "اغلاق  ",
                        //closeOnConfirm: true,
                        //showLoaderOnConfirm: true,
                        html: false
                    },
                    function () {
                        $("#producteur_table").html(data);
                        $("#trr_"+id_prod).hide();
                    });



            }else
            {
                swal({
                        title: "Suppression",
                        text: "Le producteur a été supprimé avec succès",
                        type: "success",
                        showCancelButton: false,
                        confirmButtonColor: "#256144",
                        confirmButtonText: "OK  ",
                        //closeOnConfirm: true,
                        //showLoaderOnConfirm: true,
                        html: false
                    },
                    function () {
                        $("#producteur_table").html(data);
                        $("#trr_"+id_prod).hide();
                    });


            }


        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}


function deleteAutoriteNotif(id_aut, id_name) {
    var id_notif = $("#" + id_name).val();
    $.ajax({
        url: '/api/deleteAutoriteNotif/' + id_notif + '/' + id_aut,
        type: 'POST',
        data: {},
    })
        .done(function (data) {
            swal({
                    title: "Suppression ",
                    text: "L'autorité à été supprimer avec succès",
                    type: "success",
                },
                function () {
                    $("#pays_table").html(data);
                    $("#trr_"+id_aut).hide();
                });

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}

function edit_transp_trang(id, id_name, type) {
    var id_notif = $("#" + id_name).val();
    $.ajax({
        url: '/api/getoneTransporteuretranger/' + id + '/' + id_notif + "/" + type,
        type: 'POST',
        data: {},
    })
        .done(function (data) {
            if (type === "nationale")
                $("#row_from_groupe").html(data);
            else if (type === "etranger")
                $("#row_from_groupe_port").html(data);

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
            if (type === "nationale")
                show_form_trans();
            else if (type === "etranger")
                fun_affiche_from_55();
        });
}

function edit_transp_trangXD(id, id_name, type) {
    var id_notif = $("#" + id_name).val();
    $.ajax({
        url: '/api/getoneTransporteuretrangerXD/' + id + '/' + id_notif + "/" + type,
        type: 'POST',
        data: {},
    })
        .done(function (data) {
            if (type === "nationale")
                $("#row_from_groupe").html(data);
            else if (type === "etranger")
                $("#row_from_groupe_port").html(data);
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}

function edit_producteur_notification(id_prod, id_name) {
    var id_notif = $("#" + id_name).val();
    $.ajax({
        url: '/api/getoneProducteurNotification/' + id_prod + '/' + id_notif,
        type: 'POST',
        data: {},
    })
        .done(function (data) {
            $("#producteur_table").html(data);
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}

function changer_quantite(val) {
    var qte = $(val).val();
    $(".quantiteTotalPrevu").val(qte);
}

function changer_zoneFranche(val) {
    var id = $(val).val();
    $(".changerZonneFranche").val(id);
    $(".changerZonneFranche").trigger("change");
}

function changer_unite(val) {
    var id = $(val).val();
    $(".changerUnite").val(id);
    $(".changerUnite").trigger("change");
}

function affche_message(form) {
    event.preventDefault();
    var se = $("#" + form).serializeObject();

    $.ajax({
        type: "POST",
        url: "/api/addDemandeInformation/" + region + "/" + categorie,
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(se),
        success: function (response) {
            console.log(response);
            Swal.fire({
                title: '<strong>Votre demande a été déposée avec succès</strong>',
                icon: 'success',
                html: '<a href="/api/checkEIESelect"+ class="btn btn-success ml-2 ">Retour</a>',
                showCloseButton: false,
                showCancelButton: false,
                showConfirmButton: false,
                focusConfirm: false,
            })
        },
        error: function (response) {

            alert('Erreur ajout non effectue');

        }
    });


}

function fun_disabled_region(val) {
    var id = $(val).val();
    if (id === "") {
        return false;
    }
    if (id == "non") {
        $(".id_region").attr("disabled", true);
        $(".id_commune").attr("disabled", true);
        $(".id_prefecture").attr("disabled", true);
    } else if (id == "oui") {
        $(".id_region").attr("disabled", false);
        $(".id_commune").attr("disabled", false);
        $(".id_prefecture").attr("disabled", false);
    }
}

function load_commune_by_pref(val) {
    if (event != null)
        event.preventDefault();
    var id = $(val).val();
    id = ($.trim(id) == "" || id == null) ? 0 : id;

    var id_obj = $("#id_demande_information").val();
    if (id_obj === "" || id_obj == null) {
        return false;
    }
    $('#loader_modal').modal('show');
    $.ajax({
        url: '/api/getCommuneByPref/' + id + "/" + id_obj,
        type: 'post',
        dataType: "html",
        data: {},
    })
        .done(function (data) {
            $('#loader_modal').modal('hide');
            var row = $(val).closest('.row');
            $(row).find(".id_commune option").remove();
            $(row).find(".id_commune").append(data);
            $(row).find("#id_commune select").trigger("change");
        })
        .fail(function () {
            $('#loader_modal').modal('hide');
            alert("error");
        })
        .always(function () {
            $('#loader_modal').modal('hide');
            console.log("complete");
        });

}

function load_pref_by_region(val) {

    if (event != null)
        event.preventDefault();

    var id = $(val).val();
    id = ($.trim(id) == "" || id == null) ? 0 : id;

    var id_obj = $("#id_demande_information").val();
    if (id_obj === "" || id_obj == null) {
        return false;
    }
    $('#loader_modal').modal('show');
    $.ajax({
        url: '/api/getPrefectureByRegion/' + id + "/" + id_obj,
        type: 'post',
        data: {},
    })
        .done(function (data) {
            $('#loader_modal').modal('hide');
            var row = $(val).closest('.row');
            $(row).find(".id_prefecture option").remove();
            $(row).find(".id_prefecture").append(data);
            $(row).find(".id_prefecture").trigger("change");
            var el = document.getElementById("id_prefecture");
            load_commune_by_pref(el);

        })
        .fail(function () {
            $('#loader_modal').modal('hide');
            alert("error");
        })
        .always(function () {
            $('#loader_modal').modal('hide');
            console.log("complete");
        });

}

function saveCommuneDetailregion(val) {
    if (event != null)
        event.preventDefault();

    var id = $(val).val();
    if (id === "" || id == null) {
        return false;
    }

    var id_obj = $("#id_demande_information").val();
    if (id_obj === "" || id_obj == null) {
        return false;
    }

    $.ajax({
        url: '/api/savecommuneDetailregion/' + id + "/" + id_obj,
        type: 'post',
        dataType: "html",
        data: {},
    })
        .done(function (data) {

        })
        .fail(function () {
            alert("error");
        })
        .always(function () {
            console.log("complete");
        });
}

/*function updateDemandeInfomration(form, id_name, step, id_btn_step) {
    if (event != null)
        event.preventDefault();

    $("#"+form).validate();
    var id = $("#" + id_name).val();
    if ($.trim(id) === "" || id == null) {
        return false;
    }

    var montant = $("input[name=montant_investissement]").val();
    if ($.trim(montant) == "" || montant == null || !$.isNumeric(montant)) {
        swal("Avertissement ! ", 'Le champs Montant d\'investissement est incorrecte', 'error');
        return false;
    }
    var intitule = $("input[name=intitule_projet]").val();
    if ($.trim(intitule) == "" || intitule == null) {
        swal("Avertissement ! ", 'Le champs Intitulé du projet est obligatoire', 'error');
        return false;
    }

    var se = $("#"+form).serialize();

    /!*$empty = $('#'+form).find("input").filter(function() {
        return this.value === "";
    });
    if($empty.length) {
        swal("Avertissement ! ", 'Tous Les Champs est obligatoire', 'error');
        return false;
    } else {*!/
        $.ajax({
            type: "GET",
            url: "/api/updateDemandeInfomration/" + id ,

            data: se,
            success: function (response) {
                console.log("success : " + response);
                affiche_eie_zone(step, id_btn_step);
            },
            error: function (response) {

                alert('Erreur ajout non effectue');

            }
        });
}*/

/*function updateDemandeInfomrationEE(form, id_name, step, id_btn_step) {
    if (event != null)
        event.preventDefault();
    var id = $("#" + id_name).val();
    if ($.trim(id) === "" || id == null) {
        return false;
    }

    var montant = $("input[name=montant_investissement]").val();
    if ($.trim(montant) == "" || montant == null || !$.isNumeric(montant)) {
        swal("Avertissement ! ", 'Le champs Montant d\'investissement est incorrecte', 'error');
        return false;
    }
    var se = $("#"+form).serialize();

    $.ajax({
        type: "GET",
        url: "/api/updateDemandeInfomrationEE/" + id,
        contentType: 'application/json; charset=utf-8',
        data: se,
        success: function (response) {
            console.log("success : " + response);
            affiche_eie_zone(step, id_btn_step);
        },
        error: function (response) {

            alert('Erreur ajout non effectue');

        }
    });
}*/



function affiche_files(id) {
    $.ajax({
        url: '/api/getfileByIdDemande/' + id + "/getfile",
        type: 'POST',
        data: {},
    })
        .done(function (data) {
            $("#zone_tab_fichier").html(data);
            $("#modal_fichiers").modal("show");
            console.log("success");

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}


function affiche_msg_file(id_dmd) {
    if ($.trim(id_dmd) === "") {
        return false;
    }

    $.ajax({
        url: '/api/getfileByIdDemande/' + id_dmd + "/sendfile",
        type: 'POST',
        data: {},
    })
        .done(function (data) {
            $("#complementDocument").modal("show");
            $("#completerlesdocuments").html(data);
            console.log("success");

        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });

}

function setfileReunionToDemande(id_dmd,type) {

    var data = new FormData();
    var ins = document.getElementById("file_to_complete").files.length;
    for (var x = 0; x < ins; x++) {
        data.append("fileToUpload", document.getElementById("file_to_complete").files[x]);
    }

    $.ajax({

        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/setFileReunionToDemande/" + id_dmd,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (response) {

            swal({
                    title: "Document envoyé ! ",
                    text: "les documents ont été envoyé avec succès",
                    type: "success",
                },
                function () {
                    window.location.href = '/api/ListeEie/'+type;
                });

        },
        error: function () {

        }
    });
}

function fun_prescription_hide() {
    $("#azertyui").hide();
}

function fun_prescription_show() {
    $("#azertyui").show();
}

function rech_transporteur(val){
    var code = $(val).val();
    if($.trim(code)==="" || code==null || !$.isNumeric(code)){
        $("#tab_transporteur").html("");
        return false;
    }


    $.ajax({
        url: '/getTabtransporteur/'+code,
        type: 'POST',
        data: {},
    })
        .done(function (data) {
            $("#tab_transporteur").html(data);
            console.log("success");
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}



/*function getTabtransporteur(form,table,url,nameId,btn){

    alert_error("Select[name=classification_id]");
    alert_error("Select[name=code_id]");
    alert_error("#Zone_Franche");
    alert_error("#id_type");
    alert_error("#unite");

    var code=$("#code").val();

    var find = false;
    $(".select_test").each(function(indx,elem){
        if($(elem).hasClass("bg_errorSlecte") && !find){
            find=true;
        }
    })

    var qte = $("#quantite").val();
    if($.trim(qte)===""|| !$.isNumeric(qte) || qte==null || qte<=0){
        swal("Avertissement !","La quantité est incorrecte","error");
        return false
    }

    if (find){
        swal("Avertissement !","un ou plusieurs champs obligatoires sont vides","error");
        return false;
    }
    else{
        addObjectGeneral(form,table,url,nameId,btn);
    }


}*/

/*function verifier_champ_vide(form,table,url,nameId,btn){
    alert_error("Select[name=classification_id]");
    alert_error("Select[name=code_id]");
    alert_error("#Zone_Franche");
    alert_error("#id_type");
    alert_error("#unite");

    var code=$("#code").val();

    var find = false;
    $(".select_test").each(function(indx,elem){
        if($(elem).hasClass("bg_errorSlecte") && !find){
            find=true;
        }
    })

    var qte = $("#quantite").val();
    if($.trim(qte)===""|| !$.isNumeric(qte) || qte==null || qte<=0){
        swal("Avertissement !","La quantité est incorrecte","error");
        return false
    }

    if (find){
        swal("Avertissement !","un ou plusieurs champs obligatoires sont vides","error");
        return false;
    }
    var code=$("#code").val();
    var Classification = $("#Classification").val();
    $.ajax({
        type: "GET",
        url: "/api/getTabtransporteur/" + code,
        data: {},
        success: function (response) {
            if(Classification==1){
                if(response==="1"){
                    addObjectGeneral(form,table,url,nameId,btn);
                    return true;
                }else{
                    swal("Avertissement !","aucun transporteur ne traite dans ce type des déchets","error");
                    return false;
                }
            }else{
                addObjectGeneral(form,table,url,nameId,btn);
                return true;
            }

        },
        error: function () {

        }
    });
}*/

function alert_error(select){
    var val = $(select).val();
    if($.trim(val)==="" || val==null){
        $(select).closest(".form-group").addClass("bg_errorSlecte");
    }else{
        $(select).closest(".form-group").removeClass("bg_errorSlecte");
    }
    return 0;
}

function alert_error_disabled(select){
    var val = $(select).val();
    if($.trim(val)!=="" && val!=null){
        $(select).closest(".form-group").removeClass("bg_errorSlecte");
    }

}

function add_detail_mouvement(id_notif,val){
    if(event!=null)
        event.preventDefault();

    var id = $("#id_detail_unit").val();
    var qte = $("#qte_unit").val();
    var files = $("#file_unit")[0].files.length;
    var nbr_colis = $("#nbr_colis").val();
    var tr = $("#detail_mouvement table tbody tr:not(.text-center)").length;
    var qteTotal = parseInt($("#qte_prevue").val()) - (parseInt($("#qteTotale").val()) +parseInt(qte));
    var local=$("#local").val();
    if(local!="ar"){
        var fn="fr";
    }
    else{
        var fn="ar";
    }


    if(qteTotal<0 ){
        if(fn=='ar')
        {
            swal({
                title: "! تحذير",
                text: "الكمية التي تم إدخالها أكبر من المبلغ الإجمالي المتوقع",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "اغلاق ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });


        }
        else {
            swal({
                title: "Avertissement !",
                text: "La quantité saisie est supérieure à la somme totale prévue",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "OK ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });

        }

        return false;
    }

    if($.trim(id)==="" || id==null || !$.isNumeric(id)){
        id=0;
    }
    if($.trim(qte)==="" || qte==null || !$.isNumeric(qte)){
        if(fn=='ar')
        {
            swal({
                title: "! تحذير",
                text: "الكمية غير صالحة",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "اغلاق ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });


        }else
        {
            swal({
                title: "Avertissement !",
                text: "La quantité est invalide",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "OK ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });


        }

        return false;
    }
    if(files==0){

        if(fn=='ar')
        {
            swal({
                title: "! تحذير",
                text: "أدخل الملف",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "اغلاق ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });


        }
        else {
            swal({
                title: "Avertissement !",
                text: "Le fichier est obligatoire",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "OK ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });


        }
        return false;
    }
    if($.trim(nbr_colis)==="" || nbr_colis==null || !$.isNumeric(nbr_colis) || nbr_colis===0 || nbr_colis<=tr){
        if(fn=='ar')
        {
            swal({
                title: "! تحذير",
                text: "تم الوصول إلى الحد الأقصى لعدد الطرود الرجاء تغيير عدد الطرود",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "اغلاق ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });


        }
        else {
            swal({
                title: "Avertissement !",
                text: "Nombre de colis maximum atteind\nMerci de Changer le nombre de colis",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "OK ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });


        }
        return false;
    }
    var data = new FormData();
    data.append("qte", parseInt(qte));
    data.append("id_detail", parseInt(id));
    data.append("file",$("#file_unit")[0].files[0]);

    $(val).prop("disabled", "true");
    $('#loader_modal').modal('show');
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/setDocMouvementDetail/" + id_notif,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (response) {
            $("#detail_mouvement").html(response);

            $(val).prop("disabled", "false");
            $('#loader_modal').modal('hide');
        },
        error: function () {
            $(val).prop("disabled", "false");
            $('#loader_modal').modal('hide');
        }
    });
}

function delete_docMouv(id,id_notif){
    if(event!=null)
        event.preventDefault();
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/deleteDocMouv/" + id+"/"+id_notif,
        data: {},
        success: function (response) {
            $("#detail_mouvement").html(response);
        },
        error: function () {

        }
    });
}

function setnbrColis(val,id_notif){
    if(event!=null)
        event.preventDefault();
    var nbr = $(val).val();
    var tr = $("#detail_mouvement tbody tr").length;
    if($.trim(nbr)==="" || nbr==null || !$.isNumeric(nbr) || nbr<tr){
        swal("Avertissement ! ","La valeur saisie est incorecte","error");
        return false
    }
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/setNbrColie/" + id_notif+"/"+nbr,
        data: {},
        success: function (response) {
            if(nbr<tr)
                $("#btn_add_detail").prop("disabled",true);
            else
                $("#btn_add_detail").prop("disabled",false);
        },
        error: function () {

        }
    });
}

function updateFile(id_notif,val,type){
    if(event!=null)
        event.preventDefault();
    var data = new FormData();
    var files = $(val)[0].files.length;
    if(files==0){
        swal("Avertissement !","Le fichier est obligatoire","error");
        return false;
    }

    data.append("file",$(val)[0].files[0]);

    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/setDocumentDocMouvement/" + id_notif+"/"+type,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (response) {

        },
        error: function () {

        }
    });


}

function changer_Statut_zf_auth(id_notif, id_statut, type, val) {
    if(event!=null)
        event.preventDefault();
    var link_recap = "/api/getnotifById1/" + type + "/" + id_notif;
    var local=$("#local").val();
    if(local!="ar"){
        var fn="fr";
    }
    else{
        var fn="ar";
    }
    $(val).prop("disabled", "true");
    $('#loader_modal').modal('show');
    $.ajax({
        url: '/api/changerStatus',
        type: 'POST',
        data: {"id_notif": parseInt(id_notif), "id_statut": parseInt(id_statut), "type": type},
    })
        .done(function () {
            if(fn=='ar'){
                Swal.fire({
                    title: '<strong>تمت إضافة  شهادة التخلص بنجاح</strong>',
                    icon: 'success',
                    html:
                        '<a href="' + link_recap + '" class="btn btn-success ml-2 ">عرض الملخص</a>',
                    showCloseButton: false,
                    showCancelButton: false,
                    showConfirmButton: false,
                    focusConfirm: false,
                    allowOutsideClick: false
                });


            }else
            {
                Swal.fire({
                    title: '<strong><spring:message=L’ajout du Certificat d’élimination a été effectuée avec succèss</strong>',
                    icon: 'success',
                    html:
                        '<a href="' + link_recap + '" class="btn btn-success ml-2 ">Afficher le Récapitulatif</a>',
                    showCloseButton: false,
                    showCancelButton: false,
                    showConfirmButton: false,
                    focusConfirm: false,
                    allowOutsideClick: false
                });

            }


        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
            $(val).prop("disabled", "false");
            $('#loader_modal').modal('hide');
        });


}


function changer_Statut_zf_auth_non_dangereux(id_notif, id_statut, type) {
    if(event!=null)
        event.preventDefault();
    var link_recap = "/api/getnotifById1/" + type + "/" + id_notif;
    var local=$("#local").val();
    if(local!="ar"){
        var fn="fr";
    }
    else{
        var fn="ar";
    }
    $('#loader_modal').modal('show');
    $.ajax({
        url: '/api/changerStatus',
        type: 'POST',
        data: {"id_notif": parseInt(id_notif), "id_statut": parseInt(id_statut), "type": type},
    })
        .done(function () {
            if(fn=='ar'){
                Swal.fire({
                    title: '<strong>تمت إضافة وثيقة الحركة بنجاح</strong>',
                    icon: 'success',
                    html:
                        '<a href="' + link_recap + '" class="btn btn-success ml-2 ">عرض الملخص</a>',
                    showCloseButton: false,
                    showCancelButton: false,
                    showConfirmButton: false,
                    focusConfirm: false,
                    allowOutsideClick: false
                });


            }else
            {
                Swal.fire({
                    title: '<strong><spring:message=L’ajout de document de mouvement a été effectuée avec succèss</strong>',
                    icon: 'success',
                    html:
                        '<a href="' + link_recap + '" class="btn btn-success ml-2 ">Afficher le Récapitulatif</a>',
                    showCloseButton: false,
                    showCancelButton: false,
                    showConfirmButton: false,
                    focusConfirm: false,
                    allowOutsideClick: false
                });

            }


        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
            $('#loader_modal').modal('hide');
        });


}

function changer_Statut_zf_auth_test(id_notif, id_statut, type,val){
    if(event!=null)
        event.preventDefault();
    var tr = $("#detail_mouvement tbody tr").length;
    var trtext = $("#detail_mouvement tbody tr td").text();
    var nbr = $("#nbr_colis").val();
    var local=$("#local").val();
    if(local!="ar"){
        var fn="fr";
    }
    else{
        var fn="ar";
    }
    if(trtext=="لا توجد كمية" || trtext== "Aucune Quantité" || tr!=nbr){

        if(fn=='ar')
        {
            swal({
                title: "! تحذير ",
                text: "عدد الطرود أكبر من عدد الكميات الرجاء تغيير عدد الطرود",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "اغلاق ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });



        }
        else
        {
            swal({
                title: "Avertissement !",
                text: "Le nombre de colis est superieur au nombre des quantité\nMerci de modifier le nombre de colis",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "OK ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });


        }
        return false;
    }
    changer_Statut_zf_auth(id_notif, id_statut, type,val);
}

function go_link(url){
    window.location.href=url;
}

function fun_setimpacts() {
    event.preventDefault();
    var id_demande = $("#id_demande_information").val();
    if ($.trim(id_demande) == "" || id_demande == 0 || id_demande == null) {
        return false;
    }
    var data = new FormData();
    var d = document.getElementById("impacts").files.length;
    for (var x = 0; x < d; x++) {
        data.append("fileToUpload", document.getElementById("impacts").files[x]);
    }
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/setFilImpactToDemandeInfo/" + id_demande,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (response) {
        },
        error: function () {

        }
    });


}

function load_modal_transporteur(id_notif){
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/addTransporteurFinal/" + id_notif,
        data: {},
        success: function (response) {
            $("#declarationTransp").modal("show");
            $("#groupe_select").html(response);
            if($("#declarationTransp select").length>0){
                $("#declarationTransp select").trigger("change");
                $("#id_notif").val(id_notif);
            }else{
                $("#btn_valide_trans").hide();
            }


        },
        error: function () {

        }
    });

}


function saveDeclarationTransporteur(){
    var id_trans = $("#id_transp").val();
    var data = new FormData();
    if(id_trans==null){
        $("#declarationTransp").modal("hide");
        return false;
    }
    if($.trim(id_trans)==="" || !$.isNumeric(id_trans)){
        swal("Avertissement ! ","Merci de séléctionner un transporteur valide","error");
        return false;
    }

    var ins = document.getElementById("file_declaration").files.length;
    for (var x = 0; x < ins; x++) {
        data.append("fileToUpload", document.getElementById("file_declaration").files[x]);
    }


    var id_notif = $("#id_notif").val();
    if($.trim(id_notif)==="" || id_notif==null || !$.isNumeric(id_notif)){
        return false;
    }

    var id_decla = $("#id_declaration").val();
    if($.trim(id_decla)==="" || id_decla==null || !$.isNumeric(id_decla)){
        id_decla = 0;
    }

    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/saveDeclarationTransporteur/" + id_trans + "/" + id_notif + "/" + id_decla,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (response) {
            $("#declarationTransp").modal("hide");
            swal("Success","Le transporteur a été ajoutée avec succèss","success");
            window.location.href="/api/ListeAutorisation/ZF/d"
        },
        error: function () {

        }
    });
    $("#declarationTransp").modal("show");
}

// ---- login 7 --------------
function show_zone2(hideClass, val) {
    $(".clss_hide").hide();
    $("." + hideClass).show();
    $(".btn_step_perso").removeClass("btn-success");
    $(".btn_step_perso").addClass("btn_gris");
    $(val).removeClass("btn_gris");
    $(val).addClass("btn-success");
    if(hideClass==="attache"){
        var type = $(val).attr("data_type");
        if (type===""){
            return false;
        }
        $.ajax({
            url: '/getAccordionDoc2/'+type,
            type: 'POST',
            data: {},
        })
            .done(function(response) {
                $(val).attr("data_type","");
                $("#accordion").html(response);
                $("#accordion").accordion({
                    collapsible: true,
                    heightStyle: "content",
                    active : false,
                });
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
    }
}
function show_zone_2(hideClass, val) {
    $(".clss_hide").hide();
    $("." + hideClass).show();
    $(".btn_step_perso").removeClass("btn-success");
    $(".btn_step_perso").addClass("btn_gris");
    $(".monCard .card .btn").removeClass("btn-success");
    $(".monCard .card").removeClass("active");
    $(val).addClass("active");
    if(hideClass==="attache"){
        var type = $(val).attr("data_type");
        if (type===""){
            return false;
        }
        $.ajax({
            url: '/getAccordionDoc2/'+type,
            type: 'POST',
            data: {},
        })
            .done(function(response) {
                $(val).attr("data_type","");
                $("#accordion").html(response);
                $("#accordion").accordion({
                    collapsible: true,
                    heightStyle: "content",
                    active : false,
                });
            })
            .fail(function() {
                console.log("error");
            })
            .always(function() {
                console.log("complete");
            });
    }
}
function show_etape_perso2(id) {
    debugger
    if (id == null || id == "") {
        swal("Merci de choisir un type d'autorisation");
        return false;
    }

    $("#zone_rech").addClass("d-none");
    $("#dev_step").removeClass("d-none");
    $("#dev_list_slc").addClass("d-none");

    $.ajax({
        url: '/getProcedureAuto2/'+id,
        type: 'POST',
        data: {},
    })
        .done(function(response) {
            $("#procedure_content").html(response);
            $("#zone_rech").addClass("d-none");
            $("#dev_step").removeClass("d-none");
            $("#dev_list_slc").addClass("d-none");
            $(".select2").select2();
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        });

}
// ---- End login 7 --------------

function afficher_accord(val){
    var id = $(val).val();
    if(id==1){
        $(".Grp_dang").removeClass('d-none');
        $(".Grp_simpl").addClass('d-none');
    }else{
        $(".Grp_simpl").removeClass('d-none');
        $(".Grp_dang").addClass('d-none');
    }
    $(".zone_resul_2 > span").addClass("disp_none");
    $(".zone_resul > span").addClass("disp_none");
    $(".ct_calcule input").val("0");
    $(".gf_calcule input").val("0");
}

function verifier_reg_pref(btn,id,lng){
    /*if(event=null)
        event.preventDefault();*/
    var reg = $("#region_id").val();
    var pref = $("#prefecture_id").val();
    var id_notif = $("#id_notification").val();
    if(
        $.trim(reg)==="" || reg==null ||  reg==="0" ||
        $.trim(pref)==="" || pref==null ||  pref==="0"
    ){
        if(lng=="fr"){
            swal({
                title: "Champs vide",
                text: "merci de saisir le champs region et prefecture",
                type: "warning",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "OK",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });

        }
        else{

            swal({
                title: "الحقول الفارغة",
                text: "الرجاء إدخال حقول الجهة والمحافظة",
                type: "warning",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "اغلاق ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });
        }
        return false;
    }

    openCity1(btn,id);
}

function change(){
    var id_notif = $("#id_notification").val();
    changer_Statut1(id_notif,48);
    openCity1('Btn2','2');
}

function changeStatutNum(btn,id){
    var id_notif = $("#id_notification").val();
    changer_Statut1(id_notif,48);
    openCity1(btn,id);
}

function changer_Statut1(id_notif, id_statut) {

    $.ajax({
        url: '/api/changerStatus1',
        type: 'POST',
        data: {"id_notif": parseInt(id_notif), "id_statut": parseInt(id_statut)},
    })
}

function update_new_AE(){
    if(event!=null)
        event.preventDefault();

    var id_dmd = $("#id_demande_information").val();
    if($.trim(id_dmd)==="" || id_dmd==null){
        return false;
    }

    var data = new FormData();
    var ins = document.getElementById("file_frm").files.length;
    if(ins==0){
        swal("Avertissement ! ","le fichier est obligatoire","error");
        return false;
    }
    for (var x = 0; x < ins; x++) {
        data.append("fileToUpload", document.getElementById("file_frm").files[x]);
    }

    $.ajax({

        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/save_DemandeAE/" + id_dmd,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (response) {

        },
        error: function () {

        }
    });
}

function set_doc_AE(id_dmd,id_ae,val){
    if(event!=null)
        event.preventDefault();
    var data = new FormData();
    var files = $(val)[0].files.length;
    if(files==0){
        swal("Avertissement !","Le fichier est obligatoire","error");
        return false;
    }

    data.append("file",$(val)[0].files[0]);

    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/setDocument_ae/" + id_dmd+"/"+id_ae,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (response) {

        },
        error: function () {

        }
    });
}

function changer_statut1_AE(id_name, code_statut, msg_alert,type) {
    if(event!=null)
        event.preventDefault();

    var find = false;
    var isVisible = $(".btn_down").is( ":visible");
    $("input[type=file]").each(function(idx,el){
        if(!isVisible && !find &&($.trim($(el).val())==="" || el==null)  ) {
            find = true
            $(el).addClass("bg_error")
        }else if($(el).hasClass("bg_error")){
            $(el).removeClass("bg_error")
        }
    });
    if(find && !isVisible){
        swal("Avertissement ! ","Le fichier est obligatoire","error");
        return false;
    }

    var id = $("#" + id_name).val();
    var link_recap = "/api/ListeEie/"+type;
    if ($.trim(id) == "" || !$.isNumeric(id) || id == null) {
        swal("Avertissement !", "le numero de EIE n'est pas valide", "error");
        return false;
    }

    $.ajax({
        url: "/api/changerStatuts/" + id + "/" + code_statut,
        type: 'GET',
        data: {},
    })
        .done(function (data) {
            Swal.fire({
                title: '<strong>' + msg_alert + '</strong>',
                icon: 'success',
                html:'<a href="' + link_recap + '" class="btn btn-success ml-2 ">Afficher le Récapitulatif</a>',
                showCloseButton: false,
                showCancelButton: false,
                showConfirmButton: false,
                focusConfirm: false,
            })
        })
        .fail(function () {
            console.log("error");
        })
        .always(function () {
            console.log("complete");
        });
}

function ajouter_rapport_ae(id){
    if(event!=null)
        event.preventDefault();
    $("#modal_AE").modal("show");
    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/affiche_FRM_Add_rapport_ae/" + id,
        data:{},
        success: function (response) {
            $("#zone_AE_fichier").html(response);
        },
        error: function () {

        }
    });
}

function setfileRapport_AE(id,val,id_rapport){
    if(event!=null)
        event.preventDefault();
    var data = new FormData();
    var files = $(val)[0].files.length;
    if(files==0){
        swal("Avertissement !","Le fichier est obligatoire","error");
        return false;
    }

    data.append("file",$(val)[0].files[0]);

    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url: "/api/setRapport_ae/"+id+"/"+id_rapport,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success: function (response) {

        },
        error: function () {

        }
    });
}

function affiche_captcha(id_saisie,login,pass){

    $("#"+id_saisie).show();
    $(".pass").addClass("hidden");

    /*var login = $("#"+login).val();
    var pass = $("#"+pass).val();

    var is_show = $("#"+id_saisie).is(":visible");

    if(!is_show && !login.empty() && !pass.empty() ){

    }else{
        $("#"+id_saisie).hide();
    }*/
    function ajouterTranporteur_Etranger_XD(id_name) {
        if(event!=null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        var raison = $("#raison_social").val();
        var matricule = $("#num_matriule").val();
        var type_vehicule = $("#type_vehicule").val();
        var adresse = $("#adresseTr").val();

        var port = $('input[name^=port]').map(function (idx, elem) {
            return $(elem).val();
        }).get();


        var id_trans = $("#id_trans_xd").val();
        var data = new FormData();
        data.append("raison", raison);
        data.append("matricule", matricule);
        data.append("type_vehicule", type_vehicule);
        data.append("adresse", adresse);
        data.append("port", port);

        var ins = document.getElementById("doc_assurance").files.length;
        if (ins == 0 && !$("#btn_downolad2").is(":visible")) {
            swal("Avertissement ! ", "Le fichier est obligatoire", 'error');
            return false;
        }

        for (var x = 0; x < ins; x++) {
            var file = document.getElementById("doc_assurance").files[x];
            if (file.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
                swal("Alert", "Type de fichier non pris en charge", "error");
                return false;
            }
            data.append("fileToUpload", file);
        }


        $.ajax({
            url: '/api/addTransporteuretrangerXD/' + id + "/" + id_trans,
            type: 'POST',
            processData: false,
            contentType: false,
            cache: false,
            data: data,
        })
            .done(function (data) {
                $("#row_from_groupe_port").html(data);
            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
            });

    }

    function ajouterTranporteur_Etranger_XD(id_name) {
        if(event!=null)
            event.preventDefault();
        var id = $("#" + id_name).val();
        var raison = $("#raison_social").val();
        var matricule = $("#num_matriule").val();
        var type_vehicule = $("#type_vehicule").val();
        var adresse = $("#adresseTr").val();

        var port = $('input[name^=port]').map(function (idx, elem) {
            return $(elem).val();
        }).get();


        var id_trans = $("#id_trans_xd").val();
        var data = new FormData();
        data.append("raison", raison);
        data.append("matricule", matricule);
        data.append("type_vehicule", type_vehicule);
        data.append("adresse", adresse);
        data.append("port", port);

        var ins = document.getElementById("doc_assurance").files.length;
        if (ins == 0 && !$("#btn_downolad2").is(":visible")) {
            swal("Avertissement ! ", "Le fichier est obligatoire", 'error');
            return false;
        }

        for (var x = 0; x < ins; x++) {
            var file = document.getElementById("doc_assurance").files[x];
            if (file.type === "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") {
                swal("Alert", "Type de fichier non pris en charge", "error");
                return false;
            }
            data.append("fileToUpload", file);
        }


        $.ajax({
            url: '/api/addTransporteuretrangerXD/' + id + "/" + id_trans,
            type: 'POST',
            processData: false,
            contentType: false,
            cache: false,
            data: data,
        })
            .done(function (data) {
                $("#row_from_groupe_port").html(data);
            })
            .fail(function () {
                console.log("error");
            })
            .always(function () {
                console.log("complete");
            });

    }

}

$(document).ready(function(){
    $(':input[type="number"]').keypress(function (e) {
        if (String.fromCharCode(e.keyCode).match(/[^0-9]/g)) return false;
    });
});

function showpassword(val){
    var x = $(val).parents(".input-group");
    var y;
    var prop = $(x).find("input").prop("type");
    if(prop=="text"){
        $(x).find("input").prop("type","password");
        y = $(x).find(".fa-eye-slash").addClass("fa-eye").removeClass("fa-eye-slash");
    }else{
        $(x).find("input").prop("type","text");
        y = $(x).find(".fa-eye").addClass("fa-eye-slash").removeClass("fa-eye");
    }

    console.log(y);

}

function show_form_trans(){
    if($("#frm_trans_card").hasClass("hidden")){
        $("#frm_trans_card").removeClass("hidden");
    }
}

function show_form_trans_cls(){
    $("#id_trans_n").val("");
    edit_transp_trang('0','id_notification','nationale');
}




function fun_affiche_from_55(){
    if($("#card_55").hasClass("hidden")){
        $("#card_55").removeClass("hidden");
    }
}


