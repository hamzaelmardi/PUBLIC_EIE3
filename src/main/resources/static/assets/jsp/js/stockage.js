$.fn.serializeObject = function () {
    var o = {};
    var a = this.serializeArray();
    $.each(a, function () {
        if (o[this.name]) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

function openCity1(idBtn, cityName) {
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
    $("#" + idBtn).addClass('active')

    if($("#zone_tableau").is(":visible") && $("#zone_list_tab").is(":visible") ){
        var h = $("#zone_tableau").innerHeight();
        $("#my_rows").attr("style",'height : '+h+'px !important');
    }
}

function searchByRecap(type) {

    $.ajax({
        url: "/api/checkUserHasRecap/"+type,
        type: "GET",
        data: {},
        success: function (response) {
            $("#recap_install").html(response);
            document.getElementById("EnregistrerInstallation").disabled=false;
        },
        error: function (response) {
            alert('Erreur ajout non effectué');
        }
    });
}

function searchByRecapCT(type) {

    $.ajax({
        url: "/api/checkUserHasRecap/"+type,
        type: "GET",
        data: {},
        success: function (response) {
            $("#recap_ct").html(response);
            document.getElementById("EnregistrerCollecte").disabled=false;
        },
        error: function (response) {
            alert('Erreur ajout non effectué');
        }
    });
}

function openCityValidate(idBtn, cityName,form,url) {

    if($('#'+form).valid()){
        window.location=url;
    }
    else{

    }

}

function schowform(blo_none, cityName) {

    document.getElementById(cityName).style.display = blo_none;
}


function addObject_step(from,table,tap,id_notif) {

    if(event!=null)
        event.preventDefault();
    var se = $("#"+from).serializeObject();
    // var se = $("#formnotif").serialize();
    var Notchange = true;
    if(!$.isNumeric(id_notif)){
        id_notif = $("#"+id_notif).val();
        Notchange=false;
    }
    var prefecture = $("#prefecture_id").val();
    var region = $("#region_id").val();
    var local=$("#local").val();
    if(local!="ar"){
        var fn="fr";
    }
    else{
        var fn="ar";
    }

    if( prefecture==="0" || region==="0"){
        if(fn=='ar')
        {
            swal({
                title: "الحقول الفارغة",
                text: "الرجاء إدخال حقول المنطقة والمحافظة",
                type: "warning",
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
                title: "Champs vide",
                text: "merci de saisir le champs region et prefecture",
                type: "warning",
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
    if ($("form[name='"+from+"']").valid()) {
        $.ajax({
            type: "POST",
            url: "/api/add_notification/" + table + "/" + id_notif,
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(se),
            success: function (response) {
                if (Notchange)
                    $("#id_notification").val(response);
                openCity1('Btn' + tap, tap);
                $(".my_tab:not(.montab)").removeAttr('disabled');
            },
            error: function (response) {

            }
        });
    }
}

function addObject(from,table,url) {
    var se = $("#"+from).serializeObject();
    // var se = $("#formnotif").serialize();
    console.log(se);
    $.ajax({
        type: "POST",
        url: "/api/add_notification/"+table+"/0" ,
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(se),
        success: function (response) {
            if(url=="")
            {
                $("#id_notification").val(response);
                $("#Btn2").addClass('active');


            }else {
                window.location = url;
            }
        },
        error: function (response) {
            alert('Erreur ajout non effectue');
        }
    });
}


function addObjectGeneral(from,table,url,nameId,btn) {
    var local=$("#local").val();
    if(local!="ar"){
        var fn="fr";
    }
    else{
        var fn="ar";
    }


    var se = $("#"+from).serializeObject();
    // var se = $("#formnotif").serialize();
    var test_id = $("#"+nameId).val();
    if(from=="formnotif") {
        var Classification = $ ('#Classification').val();
        var code = $ ('#code').val();
        var id_type = $ ('#id_type').val();
        var pays = $('#Zone_Franche').val();
        var unite =$('#unite').val();


        if (Classification==="0" || code==="0" || id_type==="0" || pays==="" || unite==="") {
            if(fn=='ar')
            {
                swal({
                    title: "حقل اجباري",
                    text: "حدد التصنيف والرمز والدولة والوحدة",
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
                    title: "Champs Obligatoire",
                    text: "Séléctionner classification et code et pays et unité",
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
    }

    if($.trim(test_id)!="" && test_id != null ){
        updateGeneral(from,table,'2',test_id,nameId,'non');
        return false;
    }

    if ($("form[name='"+from+"']").valid()) {
        $.ajax ({
            type: "POST",
            url: "/api/add_notification/" + table + "/0",
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify (se),
            success: function (response) {
                if (url == "") {
                    $ ("#" + nameId).val (response);
                    $ ("#Btn" + btn).addClass ('active');
                    $ (".my_tab" + btn).removeAttr ("disabled");
                    console.log (".my_tab" + btn);
                    openCity1 ('Btn' + btn, btn)
                } else {
                    window.location = url;
                }
            },
            error: function (response) {
                alert ('Erreur ajout non effectue');
            }
        });
    }
    else{
        return false;
    }
}

// UPDATE ALL
function updateGeneral(from,table,tap,id_notif,nameId,returns) {

    var se = $("#"+from).serializeObject();
    // var se = $("#formnotif").serialize();

    var local=$("#local").val();
    if(local!="ar"){
        var fn="fr";
    }
    else{
        var fn="ar";
    }
    if(id_notif==0){
        id_notif=$('#'+nameId).val();
    }
    if(from=="formimportateur") {
        var formation = $ ('#formation').val();
        var nbrHoraire = $ ('#Nom_ar').val();
        var nbrEqupe = $ ('#Nom_fr').val();

        if (formation==="" || nbrEqupe==="" || nbrHoraire==="") {
            if(fn=='ar')
            {
                swal({
                    title: "حقل اجباري",
                    text: "جميع الحقول مطلوبة",
                    type: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#256144",
                    confirmButtonText: "اغلاق  ",
                    //closeOnConfirm: true,
                    //showLoaderOnConfirm: true,
                    html: false
                });
            }
            else
            {
                swal({
                    title: "Champs Obligatoire",
                    text: "Tous les champs obligatoire",
                    type: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#256144",
                    confirmButtonText: "OK  ",
                    //closeOnConfirm: true,
                    //showLoaderOnConfirm: true,
                    html: false
                });
            }
            return false;
        }
        if (parseInt(nbrEqupe) >= parseInt(formation)) {
            if(fn=='ar')
            {
                swal({
                    title: "تحقق",
                    text: "يجب أن يكون عدد العناصر  أكبر من عدد الفرق",
                    type: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#256144",
                    confirmButtonText: "اغلاق  ",
                    //closeOnConfirm: true,
                    //showLoaderOnConfirm: true,
                    html: false
                });


            }
            else {
                swal({
                    title: "Vérifier",
                    text: "Nombre d\'éffictif doit être séperieure a Nombre d\'équipe",
                    type: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#256144",
                    confirmButtonText: "OK  ",
                    //closeOnConfirm: true,
                    //showLoaderOnConfirm: true,
                    html: false
                });


            }

            return false;
        }
    }
    if ($("form[name='"+from+"']").valid()) {
        $.ajax ({
            type: "POST",
            url: "/api/updateInstal/" + table + "/" + id_notif + "/" + nameId,
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify (se),
            success: function (response) {
                $ ("#" + nameId).val (response);
                if (returns == "non") {
                    $ (".my_tab" + tap).removeAttr ("disabled");
                    openCity1 ('Btn' + tap, tap)
                } else {

                    window.location = returns;
                }

            },
            error: function (response) {

            }
        });
    }
    else {
        return  false;
    }
}

//


















function getNotificationByFilter(controler) {
    $.get('/api/getNotificationById/' + val, function (data) {



        $("#" + controler)
            .empty();
        // $.each(data.transporteur, function (i, Tr_l) {
        //     $("#" + select_id).append('
        // <tr>
        //     <td>Tr_l.nom_fr </td>
        //     <td>Tr_l.nom_ar </td>
        //     <td>Tr_l.pattente </td>
        //     <td>${Tr_l.idf} </td>
        //     <td>${Tr_l.adresse_fr} </td>
        //     <td>${Tr_l.tel} </td>
        //     <td>${Tr_l.fax} </td>
        //     <td>${Tr_l.mail} </td>
        //     <td>${Tr_l.date_pris_charge} </td>
        //     <td >
        //     </td>
        //     </tr>')
        // })
    })
    ;
}


function addObject_TR(from,table,id,val) {
    var slc = $("select#id_Transporteur").val();
    var local=$("#local").val();
    if(local!="ar"){
        var fn="fr";
    }
    else{
        var fn="ar";
    }
    if(slc==null || slc==""){
        if(fn=='ar')
        {

            swal({
                title: "معلومة",
                text: "الرجاء اختيار شركة النقل",
                type: "info",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "اغلاق  ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });
        }
        else
        {
            swal({
                title: "Information",
                text: "merci de choisir un Transporteur",
                type: "info",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "OK  ",
                //closeOnConfirm: true,
                //showLoaderOnConfirm: true,
                html: false
            });
        }

        return false;
    }
    var se = $("#"+from).serializeObject();
    console.log(se);
    $(val).prop("disabled", "true");
    $('#loader_modal').modal('show');
    $.ajax({
        type: "POST",
        url: "/api/add_object_page/"+table+"/autorisationPublic-tableTransporteur/"+$("#id_notification4").val() ,
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(se),
        success: function (response) {
            $('#'+id).empty()
            $('#'+id).append(response)
            $("#"+from).find("#"+from+" select.select2").select2();

            $(val).prop("disabled", "false");
            $('#loader_modal').modal('hide');
        },
        error: function (response) {
            $(val).prop("disabled", "false");
            $('#loader_modal').modal('hide');
            alert('Erreur ajout non effectue');
        }
    });
}



function updateObject(from,table,url,tap,id_obj) {

    var se = $("#"+from).serializeObject();
    // var se = $("#formnotif").serialize();
    console.log(se);

    if ($("form[name='"+from+"']").valid()) {
        $.ajax({
            type: "POST",
            url: "/api/updateObject/" + table + "/" + id_obj,
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(se),
            success: function (response) {


                if (url == "") {
                    if (table == 'notification')
                        $("#id_notification").val(response);

                    openCity1('Btn' + tap, tap)
                } else {

                    window.location = url;
                }

            },
            error: function (response) {

                alert('Erreur ajout non effectue');

            }
        });
    }

}
function Notification(from) {

    var se = $("#"+from).serializeObject();
    // var se = $("#formnotif").serialize();
    console.log(se);

    $.ajax({
        type: "POST",
        url: "/api/add_notificationA",
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(se),
        success: function (response) {


            if(url=="")
            {
                $("#id_notification").val(response);
                openCity(event, '2');
                $("#Btn2").addClass('active')
            }else {

                window.location = url;
            }

        },
        error: function (response) {

            alert('Erreur ajout non effectue');

        }
    });

}

/*function addObject2(from,table,url) {

    var id =  $("#id_notification").val();
    id = id==""?"0":id;
    var se = $("#"+from).serializeObject();
    if ($("form[name='"+from+"']").valid()) {
        $.ajax({
            type: "POST",
            url: "/api/add_notification/" + table + "/" + id,
            contentType: 'application/json; charset=utf-8',
            data: JSON.stringify(se),
            success: function (response) {
                swal({

                    title: "Votre Numéro de notification est généré",
                    text: "Voulez-vous continuer?",
                    type: "success",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#00695c',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Continuer !',
                    cancelButtonText: 'Quitter ',

                }, function (isConfirm) {
                    if (isConfirm) {
                        window.location.href = "/api/addDemandNotification/" + id + "/" + url + "/N"
                    } else {
                        window.location.href = "/api/checkUserHasCollecte/" + url;
                    }
                });


            },
            error: function (response) {

                alert('Erreur ajout non effectue');

            }
        });
    }

}*/


function dejanotif() {

    $("#steep li").removeClass("active");
    $("#steep2").addClass("active");
    $("#stp1").hide();
    $("#stp2").show();

}

function addcompos() {

    console.table($("#formcompos").serialize());

    $.ajax({
        url: '/add_composdossier',
        type: 'POST',
        enctype: 'multipart/form-data',
        processData: false,  // Important!
        contentType: false,
        cache: false,
        data: $("#formcompos").serialize(),
        success: function (data) {

        },
        error: function () {
        }
    });

}


function add_composdossier() {
    e.preventDefault();
    $.ajax({
        data: $(this).serialize(),
        success: function (data) {

        },
        error: function (jXHR, textStatus, errorThrown) {
            alert(errorThrown);
        }
    });
}

function checkNumNotif(type) {
    event.preventDefault();
    if(type!="ZF"){
        return false;
    }
    var numnotif = $("#num_notifications").val();
    if (numnotif == "") {
        $('#Suivantes').prop("disabled", true);
    }

    $.ajax({
        type: "GET",
        url :"/api/checknotif/"+numnotif+"/"+type,
        success : function(response) {
            if(response=='0'){
                swal({
                    title: 'Demande de numero de notification ?',
                    text: "Vous devez Créer une demande de numero de notification!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#00695c',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Oui, Rediriger !',

                }, function (isConfirm) {
                    if (isConfirm) {
                        window.location.href="/api/addNumNotification/"+type+"/0";
                    }
                });
            }else {
                window.location="/api/addDemandNotification/"+response+"/"+type+"/N"
            }
        },
        error : function(response) {
            swal({
                title: 'Demande de numero de notification ?',
                text: "Vous devez Créer une demande de numero de notification!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#00695c',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Oui, Rediriger !',

            }, function (isConfirm) {
                if (isConfirm) {
                    window.location.href="/api/addNumNotification/"+type;
                }
            });
        }
    });
}

function checknotif() {
    var numnotif = $("#num_notifications").val();

    if (numnotif == "") {
        $('#Suivantes').prop("disabled", true);
    }


    $.get("/api/checknotif/" + numnotif, function (data) {


        $('#types').val("");
        $('#sources').val("");
        $('#codes').val("");
        $('#quantites').val("");
        $('#unites').val("");
        $('#Suivantes').val("");
        $('#entreprisetransport_ids').val("");

        $('#num_patentes').val("");
        $('#nom_installations').val("");
        $('#telephones').val("");
        $('#adresses').val("");
        $('#sventrprss').val("");


        // steep 1
        if (!$.trim(data.notif)) {

            $('#types').prop("disabled", false);
            $('#sources').prop("disabled", false);
            $('#codes').prop("disabled", false);
            $('#quantites').prop("disabled", false);
            $('#unites').prop("disabled", false);
            $('#Suivantes').prop("disabled", false);
            $('#entreprisetransport_ids').prop("disabled", false);
            $('#traitementRadios').prop("disabled", false);
            $('#valorisationRadios').prop("disabled", false);
            swal({
                title: 'Demande de notification ?',
                text: "Vous devez Créer une demande de notification!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#00695c',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Oui, Rediriger !',

            }, function (isConfirm) {
                if (isConfirm) {
                    window.location.href = "/stockage";
                }
            });

//                $('#Suivantes').attr("onclick", "addnotif()");

        } else {

            $('#types').prop("disabled", true);
            $('#sources').prop("disabled", true);
            $('#codes').prop("disabled", true);
            $('#quantites').prop("disabled", true);
            $('#unites').prop("disabled", true);
            $('#Suivantes').prop("disabled", false);
            $('#entreprisetransport_ids').prop("disabled", true);
            $('#traitementRadios').prop("disabled", true);
            $('#valorisationRadios').prop("disabled", true);

            $('#Suivantes').attr("onclick", "dejanotif()");

            $('#types').val(data.notif.type);
            $('#sources').val(data.notif.source);
            $('#codes').val(data.notif.code);
            $('#quantites').val(data.notif.quantite);
            $('#unites').val(data.notif.unite);
            $('#entreprisetransport_ids').val(data.notif.entreprisetransport_id);

            if (data.notif.val_ou_trait == "valorisation") {
                $("#valorisationRadios").prop("checked", true);
                $("#traitementRadios").prop("checked", false);
            }

            if (data.notif.val_ou_trait == "traitement") {
                $("#valorisationRadios").prop("checked", false);
                $("#traitementRadios").prop("checked", true);
            }


            $("#id_notifs").val(data.notif.id);
            $("#id_notifications").val(data.notif.id);

            if (data.notif.etat == "valide") {
                $('#Suivantes').prop("disabled", true);
                swal('Cette Notification est déjà validée !');
            }

            console.table(data.notif.id);

        }

        //steep 2
        if (!$.trim(data.entrprs)) {
            $('#num_patentes').prop("disabled", false);
            $('#nom_installations').prop("disabled", false);
            $('#telephones').prop("disabled", false);
            $('#adresses').prop("disabled", false);
            $('#sventrprss').prop("disabled", false);

            $('#sventrprss').attr("onclick", "addEntreprise()");


        } else {

            $('#num_patentes').prop("disabled", true);
            $('#nom_installations').prop("disabled", true);
            $('#telephones').prop("disabled", true);
            $('#adresses').prop("disabled", true);
            $('#sventrprss').prop("disabled", false);

            $('#sventrprss').attr("onclick", "dejaEntreprise()");


            $('#num_patentes').val(data.entrprs.num_patente);
            $('#nom_installations').val(data.entrprs.nom_installation);
            $('#telephones').val(data.entrprs.telephone);
            $('#adresses').val(data.entrprs.adresse);


        }


    })
}

function addEntreprise() {
    $.post("/addEntreprise", $("#formEntreprise").serialize(), function (data) {
        $("#entrepriseValOuTrait_id").val(data);
        $("#steep #step0").removeClass("active");
        $("#steep1").addClass("active");
        $("#stp0").hide();
        $("#stp1").show();
    })
}


$('input[name=trait]').click(function () {
    if ($('input[name=trait]').is(':checked')) {
        $("#val_ou_trait").val($(this).val())
    }
});


function checkNumPatente() {

    var numpat = $("#num_patente").val();

    $.get("/checkpatente/" + numpat, function (data) {


        if (!$.trim(data)) {
            $('#nom_installation').prop("disabled", false);
            $('#telephone').prop("disabled", false);
            $('#adresse').prop("disabled", false);
            $('#sventrprs').prop("disabled", false);

            $('#sventrprs').attr("onclick", "add_entreprise()");
        } else {
            $('#nom_installation').prop("disabled", true);
            $('#telephone').prop("disabled", true);
            $('#adresse').prop("disabled", true);
            $('#sventrprs').prop("disabled", false);
            $('#sventrprs').attr("onclick", "dejaEntreprise()");


            $('#nom_installation').val(data.nom_installation);
            $('#telephone').val(data.telephone);
            $('#adresse').val(data.adresse);
            $('#num_patente').val(data.num_patente);
            $("#id_notification").val(data.id_notification);


        }

    });
}


function dejaEntreprise() {

    $("#steep li").removeClass("active");
    $("#steep1").addClass("active");
    $("#stp1").hide();
    $("#stp2").hide();
    $("#stp3").show();

}


function add_entreprise() {


    $.post("/add_entreprise", $("#formEntreprise").serialize(), function (data) {
        $('#sventrprs').hide();
        swal({

            title: "Demande de notification",
            text: "Votre demande est enregistrer. Merci de vérifier votre email",
            type: "success",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#00695c',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Oui, Consulter !',

        }, function (isConfirm) {
            if (isConfirm) {
                window.location.href = "/stockage_affich";
            }
        });

        window.location.href = "/downloadRecuDepo/" + data;


    });
}

function getEtape2() {
    window.location.href = "/notificationAnc/" + $("#id_notifs").val();
    /*$('#etape1').hide();
    $('#etape2').show();*/
}


function addDocs(id,type,idInput,fileChosen){

    var data = new FormData();

    var ins = document.getElementById(idInput).files.length;

    for (var x = 0; x < ins; x++) {
        data.append("fileToUpload", document.getElementById(idInput).files[x]);
        $("#"+fileChosen).text(document.getElementById(idInput).files[0].name);
    }
    if (ins != 0) {
        $("#"+idInput).parent().removeClass("bg_error");
    }

    $.ajax({

        type: "POST",
        enctype: 'multipart/form-data',
        url : "/api/addDocAutorisation/"+id+"/"+type,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success : function(response) {
            $("#"+idInput).removeClass("bg_error");
        },
        error : function() {



        }
    });
}

function addDocs2(id_str,type,idInput,fileChosen){

    var data = new FormData();

    var ins = document.getElementById(idInput).files.length;

    for (var x = 0; x < ins; x++) {
        data.append("fileToUpload", document.getElementById(idInput).files[x]);
        $("#"+fileChosen).text(document.getElementById(idInput).files[0].name);
    }

    var id = $("#"+id_str).val();

    if (ins != 0) {
        $("#"+idInput).parent().removeClass("bg_error");
    }


    $.ajax({

        type: "POST",
        enctype: 'multipart/form-data',
        url : "/api/addDocAutorisation/"+id+"/"+type,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success : function(response) {
            $("#"+idInput).removeClass("bg_error");
        },
        error : function() {



        }
    });
}

function addDocG(id,type,idInput,typeauto,idcolon,fileChosen){
    if(id==0){
        var id=$("#"+idcolon).val();
    }
    else{
        id=id;
    }
    var data = new FormData();

    var ins = document.getElementById(idInput).files.length;

    for (var x = 0; x < ins; x++) {
        data.append("fileToUpload", document.getElementById(idInput).files[x]);
        $("#"+fileChosen).text(document.getElementById(idInput).files[0].name);
    }
    if (ins != 0) {
        $("#"+idInput).parent().removeClass("bg_error");
    }

    $.ajax({
        type: "POST",
        enctype: 'multipart/form-data',
        url : "/api/addDocAutorisationG/"+id+"/"+type+"/"+typeauto,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success : function(response) {
            $("#"+idInput).removeClass("bg_error");
        },
        error : function() {
        }
    });
}

function addDocG2(id,type,idInput,typeauto,idcolon,fileChosen){
    if(id==0){
        var id1=$("#"+idcolon).val();
    }
    else{
        id=id1;
    }
    var data = new FormData();

    var ins = document.getElementById(idInput).files.length;

    for (var x = 0; x < ins; x++) {
        data.append("fileToUpload", document.getElementById(idInput).files[x]);
        $("#"+fileChosen).text(document.getElementById(idInput).files[0].name);
    }


    $.ajax({

        type: "POST",
        enctype: 'multipart/form-data',
        url : "/api/addDocAutorisationG/"+id+"/"+type+"/"+typeauto,
        data: data,
        processData: false,
        contentType: false,
        cache: false,
        success : function(response) {
            $("#"+idInput).removeClass("bg_error");
        },
        error : function() {



        }
    });
}


$('form .emailValide').blur(function () {
    var email = $(this).val();
    var re = /[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}/igm;
    if (re.test(email)) {
        $(".checkmarktitle").text(" ");

    } else {
        $(this).val("");
        $(this).after('<span class="checkmarktitle" style="color:red;">Ajouter un email valide</span></label>');

    }

});


// UPDATE ALL
function updateGeneral_installation(from,table,tap,id_notif,nameId,returns) {
    var se = $("#"+from).serializeObject();

    var type=$("input[name='type']:checked").val();
    // var se = $("#formnotif").serialize();
    var local=$("#local").val();
    if(local!="ar"){
        var fn="fr";
    }
    else{
        var fn="ar";
    }
    if(id_notif==0){
        id_notif=$('#'+nameId).val();
    }
    if(from=="formimportateur1") {
        var $isChecked = $ ('#monT tr').length;
        var type=$("input[name='type']:checked").val();
        var uniteId=$("#id_unite").val();

        if (uniteId==="") {
            if(fn=='ar')
            {
                swal({
                    title: "حقل اجباري",
                    text: "اختر وحدة",
                    type: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#256144",
                    confirmButtonText: "اغلاق",
                    //closeOnConfirm: true,
                    //showLoaderOnConfirm: true,
                    html: false
                });
            }
            else
            {
                swal({
                    title: "Champs Obligatoire",
                    text: "Séléctionner une unité",
                    type: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#256144",
                    confirmButtonText: "OK  ",
                    //closeOnConfirm: true,
                    //showLoaderOnConfirm: true,
                    html: false
                });
            }

            return false;

        }
        if ($isChecked == 1 && type!="3") {
            if(fn=='ar')
            {
                swal({
                    title: "حقل اجباري",
                    text: "قمت بتحديد رمز نفايات واحد على الأقل",
                    type: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#256144",
                    confirmButtonText: "اغلاق  ",
                    //closeOnConfirm: true,
                    //showLoaderOnConfirm: true,
                    html: false
                });



            }else
            {
                swal({
                    title: "champs Obligatoire",
                    text: "vous selectionnez au moin un code de déchet",
                    type: "error",
                    showCancelButton: false,
                    confirmButtonColor: "#256144",
                    confirmButtonText: "OK  ",
                    //closeOnConfirm: true,
                    //showLoaderOnConfirm: true,
                    html: false
                });


            }

            return false;
        }
    }
    $.ajax({
        type: "POST",
        url: "/api/updateInstal/"+table+"/"+ id_notif+"/"+ nameId,
        contentType: 'application/json; charset=utf-8',
        data: JSON.stringify(se),
        success: function (response) {
            $("#"+nameId).val(response);
            if(returns=="non"){
                $(".my_tab"+tap).removeAttr("disabled");
                openCity1('Btn'+tap,tap)
            }
            else{

                window.location=returns;
            }

        },
        error: function (response) {

        }
    });
}

//
function suivantrans(){
    var $isChecked = $ ('#trsuivant tr').length;

    if ($isChecked == 1 ) {
        swal ("champs Obligatoire", "Ajouter au moin un Transportuer", "error");
        return false;
    }
    else{
        openCity1('Btn6','6');
    }

}
function suivantrans1(){
    var $isChecked = $ ('#trvalid tr').length;

    if ($isChecked == 1 ) {
        swal ("champs Obligatoire", "Ajouter au moin un Transportuer", "error");
        return false;
    }
    else{
        openCity1('Btn55','55');
    }

}


