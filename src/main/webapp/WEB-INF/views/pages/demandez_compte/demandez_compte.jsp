<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>


<jsp:include page="../../includes/head.jsp"/>

<style>
    .input-container {
        display: -ms-flexbox; /* IE10 */
        display: flex;
        width: 100%;
        margin-bottom: 15px;
    }
    .field_icon{
        background: dodgerblue;
        color: white;
        padding-top: 0.7rem !important;
        min-width: 50px;
        text-align: center;
    }
    input[type="checkbox"] {
        position: ${pageContext.response.locale!="ar"?'relative':'absolute'} !important;
        display: inline-block;
    }

    #message {
        display:none;
        color: #000;
        position: relative;
        padding: 10px;
    }

    #message p {
        font-family:"Open Sans", sans-serif;
        font-size: 14px;
        margin-left: 25px;
    }

    /* Add a green text color and a checkmark when the requirements are right */
    .valide {
        color: #50D2C2;
    }

    .valide:before {
        position: relative;
        left: -12px;
        font-family: "Font Awesome 5 Free";
        content: "\f058";
        margin-left:${pageContext.response.locale!='fr'?'20px':'0'};
    }

    /* Add a red text color and an "x" icon when the requirements are wrong */
    .invalide {
        color: #ee0000;
    }

    .invalide:before {
        position: relative;
        left: -12px;
        font-family: "Font Awesome 5 Free";
        content: "\f057";
        margin-left:${pageContext.response.locale!='fr'?'20px':'0'};
    }

</style>

<div class="container-fluid mt_cont" style="overflow:hidden" >
    <div class="page_content" style="margin-top: 11rem">
        <div class="row justify-content-center" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
            <div class="col-md-10 col-sm-12">
                <div class="row justify-content-center mt-5 m-2 border p-0">
                    <div class="col-lg-4 col-md-4 col-sm-12" >
                        <img src="${pageContext.request.contextPath}/assets/images/img1.png" style="height: 700px;margin-top:7%">
                    </div>
                    <div class="col-lg-8 col-md-8 col-sm-12" style="margin-top: -7%">
                        <div class="inner">
                            <div style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                <h2 style="margin-top: 16%"><spring:message code="label.Inscription"/></h2>
                            </div>
                            <form class="form-horizontal" id="registration1" name="registration1">
                                <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                    <div class="row mt-2">

                                        <div class="col-md-6">
                                            <label class="" style="float: left"><spring:message code="label.RaisonS"/> </label>
                                            <input   type="text" name="raison_fr" placeholder="<spring:message code="label.RaisonS"/>" value="${societe.st.raison_fr}" class="form-control"  onkeyup="ses_ras()"><p id="in_Raison_Sociale_fr"></p>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="" style="float: right">إسم الشركة</label>
                                            <input  dir="rtl" type="text" name="raison_ar" placeholder="إسم الشركة " value="${societe.st.raison_ar}" class="form-control"  onkeyup="ses_ras()"><p id="in_Raison_Sociale"></p>
                                        </div>
                                    </div>
                                    <div class="row mt-4" >
                                                <div class="col-md-6" >
                                                    <label class="numRc" style=""><spring:message code="label.NumeroRC"/></label>
                                                    <div class="input-group mb-3">
                                                        <input  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="text" name="numRc" value="${societe.st.numRc}" placeholder="<spring:message code="label.NumeroRC"/>" class="form-control"  onkeyup="ses_rc()"><p id="in_RC"></p>
                                                        <div class="input-group-append tooltip_">
                                                            <i  class="fa fa-info-circle field_icon m-0" style="background-color: #5d6974;"></i>
                                                            <div class="tooltiptext input-group-text"><img src="../../assets/css/images/RC.jpg" width="100%" style="width: 320px !important;max-width: unset;" /></div>
                                                        </div>
                                                    </div>
                                                </div>
                                        <div class="col-md-6">
                                            <label ><spring:message code="label.Username"/> </label>
                                            <input type="hidden" name="societesId" id="compteId" value="${societe.st.societesId}">
                                            <input required id="username"  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}"  type="text" name="name_fr"  value="${societe.st.name_fr}" placeholder="<spring:message code="label.Username"/>" class="form-control">
                                            <input type="hidden" name="etat" id="etat" >
                                        </div>
                                    </div>

                                    <div class="row mt-2">
                                        <div class="col-md-6">
                                            <label class="" style="float: left">Adresse</label>
                                        <textarea name="adresse_fr" placeholder="Adresse" class="form-control"  onkeyup="ses_ad()">${societe.st.adresse_fr}</textarea><p id="in_Adresse_fr"></p>
                                    </div>
                                        <div class="col-md-6">
                                            <label class="" style="float: right">العنوان</label>
                                            <textarea dir="rtl" name="adresse_ar" placeholder="العنوان" class="form-control"  onkeyup="ses_ad()">${societe.st.adresse_ar}</textarea><p id="in_Adresse"></p>
                                        </div>
                                    </div>
                                    <div class="row mt-2">
                                          <div class="col-md-6">
                                              <label class="" style=""><spring:message code="label.Telephone"/></label>
                                              <input dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="tel" name="tel" value="${societe.st.tel}" placeholder="<spring:message code="label.Telephone"/>" class="form-control"/><p id="in_Telephone"></p>
                                            </div>
                                            <div class="col-md-6">
                                                <input type="hidden" id="maill">
                                                <label class="" style=""><spring:message code="label.Emaile"/></label>
                                                <input dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="email" autocomplete="off"
                                                       name="email" value="${societe.emailRecup}"
                                                       placeholder="<spring:message code="label.Emaile"/>" onblur="checkmail1()"
                                                       class="form-control" id="emaily"/><p id="in_email"></p>
                                                <label id="chekmail" style=" color: red;"></label>
                                            </div>
                                    </div>
                                    <div class="border p-3" id="borderPassword">
                                        <div class="row mt-2">
                                            <div class="col-xl-6 col-lg-12" id="comptes" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                    <div class="col-md-12 pad0" >
                                                        <label class="" style=""><spring:message code="label.Motdepasse"/></label>
                                                        <div class="input-group mb-3">
                                                            <input required dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="password" value="${societe!=null?'drdrdrdr':'' }" placeholder="<spring:message code="label.Motdepasse"/>" name="password" class="form-control" id="psw">
                                                            <div class="input-group-append">
                                                                <i toggle="#password-field" class="fa fa-fw fa-eye field_icon toggle-password" style="background-color: #5d6974"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            <div class="col-xl-6 col-lg-12" id="comptes11" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                                                <div class="col-md-12 pad0" >
                                                    <label class="" style=""><spring:message code="label.ConfirmerMotdepasse"/> </label>
                                                    <div class="input-group mb-3">
                                                        <input onchange="validationmotpasse()"  dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="password" value="${societe!=null?'drdrdrdr':'' }" placeholder="<spring:message code="label.ConfirmerMotdepasse"/>" name="password11" class="form-control" id="psw11">
                                                        <div class="input-group-append">
                                                            <i toggle="#password-field1" class="fa fa-fw fa-eye field_icon toggle-password1" style="background-color: #5d6974"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                                <label id="passcom" style=" color: red;"></label>
                                            </div>
                                        </div>
                                        <div class="row  m-0 p-0" style="margin-top: -20px !important;">
                                            <div id="message" class="col-sm-12">
                                                <div class="row">
                                                    <div class="col-12">
                                                        <span style="font-size:8pt"><spring:message code="label.Mot8M"/>"</span>
                                                    </div>
                                                </div>
                                                <div class="row mt-2">
                                                    <div class="col-lg-6 m-0 p-0 col-md-12">
                                                        <p id="letter" class="invalide"><spring:message code="label.lettreminuscule"/></p>
                                                    </div>
                                                    <div class="col-lg-6 m-0 p-0 col-md-12">
                                                        <p id="capital" class="invalide"><spring:message code="label.lettremajuscule"/></p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-6 m-0 p-0 col-md-12">
                                                        <p id="number" class="invalide"><spring:message code="label.unnumber"/></p>
                                                    </div>
                                                    <div class="col-lg-6 m-0 p-0 col-md-12">
                                                        <p id="length" class="invalide"><spring:message code="label.huitcaractere"/></p>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-12 m-0 p-0">
                                                        <p id="symbole" class="invalide"><spring:message code="label.Symbole"/></p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="infor-supl" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'};margin-top: 20px;">
                                    <div class="form-group" style="width: 100%;margin-bottom: 15px;display: inline-block" >
                                        <div class="col2 select" style="position: relative;box-sizing: border-box;">
                                            <label style="display: block;font-size: 120%;margin-bottom: 7px;"><spring:message code="label.jesouhaiteformulermademandede"/> </label>
                                            <div class="row m-0 p-0">
                                                <div class="col-md-6  m-0 p-0 pt-2  incsc rounded" >
                                                    <div class="custom-control custom-checkbox  ">
                                                        <input  name="environnement" ${societe.st.environnement.equals('on')?'checked':''} type="checkbox" data-name="EIE1" class="custom-control-input" id="EIE">
                                                        <label class="custom-control-label pad4 m-2" for="EIE"><spring:message code="label.EvaluationEnvironnementale"/></label>
                                                    </div>
                                                </div>
                                                <div class="col-md-6 incsc rounded">
                                                    <div class="custom-control custom-checkbox  ">
                                                        <input name="autorisation" ${societe.st.autorisation.equals('on')?'checked':''} type="checkbox" data-name="Autorisation1" class="custom-control-input" id="AUT">
                                                        <label class="custom-control-label pad4" for="AUT" ><spring:message code="label.Autorisationdesdechets"/></label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div id="EIE_Autorisation1">
                                    <div class="row" >
                                        <div class="col-md-6 col-lg-6 ">
                                        <div class="form-group" style="" id="EIE1">
                                        <div class="custom-control ml-2 custom-checkbox">
                                        <input  type="checkbox" ${societe.st.EIE.equals('on')?'checked':''} class="custom-control-input" name="eie" id="EIE_1">
                                        <label class="custom-control-label" for="EIE_1"><spring:message code="label.etudeimpactenvironnemental"/></label>
                                        </div>
                                            <div class="custom-control ml-2 custom-checkbox">
                                                <input  type="checkbox" ${societe.st.NT.equals('on')?'checked':''} class="custom-control-input" name="nt" id="NI_1">
                                                <label class="custom-control-label" for="NI_1"><spring:message code="label.Noticedimpact"/></label>
                                            </div>
                                            <div class="custom-control ml-2 custom-checkbox" >
                                                <input  type="checkbox" ${societe.st.EA.equals('on')?'checked':''} class="custom-control-input" name="ea" id="AE_1" >
                                                <label class="custom-control-label" for="AE_1" ><spring:message code="label.Auditenvironnementale"/></label>
                                            </div>
                                        </div>
                                    </div>
                                        <div class="col-md-6 col-lg-6  ">

                                    <div class="form-group" style="width: 100%;margin-bottom: 15px;display: inline-block" id="Autorisation1">
                                    <div class="custom-control custom-checkbox">
                                        <input  type="checkbox" ${societe.st.IT.equals('on')?'checked':''} class="custom-control-input" name="it" id="IT_1">
                                        <label class="custom-control-label" for="IT_1"><spring:message code="label.Installationdetraitementdesdechets"/></label>
                                    </div>
                                        <div class="custom-control custom-checkbox">
                                        <input  type="checkbox" ${societe.st.CT.equals('on')?'checked':''} class="custom-control-input" name="ct" id="CT_1">
                                        <label class="custom-control-label" for="CT_1"><spring:message code="label.Collectetransportdesdechetsdangereux"/></label>
                                        </div>
                                        <div class="custom-control custom-checkbox">
                                        <input  type="checkbox" ${societe.st.XD.equals('on')?'checked':''} class="custom-control-input" name="xd" id="XD_1">
                                        <label class="custom-control-label" for="XD_1"><spring:message code="label.Exportationdesdechetsdangereux"/></label>
                                        </div>
                                        <div class="custom-control custom-checkbox">
                                        <input  type="checkbox" ${societe.st.TR.equals('on')?'checked':''} class="custom-control-input" name="tr" id="TR_1">
                                        <label class="custom-control-label" for="TR_1"><spring:message code="label.Transitdesdechets"/></label>
                                        </div>
                                        <div class="custom-control custom-checkbox">
                                        <input  type="checkbox" ${societe.st.ZF.equals('on')?'checked':''} class="custom-control-input" name="zf" id="ZF_1">
                                        <label class="custom-control-label" for="ZF_1"><spring:message code="label.Importationdechetszonefranche"/></label>
                                        </div>
                                        <div class="custom-control custom-checkbox">
                                        <input  type="checkbox" ${societe.st.ET.equals('on')?'checked':''} class="custom-control-input" name="et" id="ET_1">
                                        <label class="custom-control-label"  for="ET_1"><spring:message code="label.Importationdesdechetsnondangereuxdunpaysetranger"/></label>
                                        </div>
                                    </div>
                                        </div>
                                    </div>
                                    </div>
                                    <hr class="hr-hub" style="width: 100%;margin-top: 8px;margin-bottom: 8px;margin-left: 0% !important;margin-right: 0% !important;">

                                    <br>
                                    <div class="capbox">
                                        <div id="CaptchaDiv"></div>
                                        <div class="capbox-inner" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                           <spring:message code="label.Tapezlenumero"/><br>
                                            <input type="hidden" id="txtCaptcha">
                                            <input type="text" name="captcha" id="Captchay" size="15" ><br>
                                        </div>
                                    </div><br/>
                                    <label id="cap" style=" color: red;"></label>
                                    <br><br>
                                    <!-- END CAPTCHA -->


                                    <div class="row m-0 ml-4 p-0" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                                        <div class="col-md-12 m-0 p-0 ">
                                            <div class="custom-control m-0 p-0 custom-checkbox">
                                                <input dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}" type="checkbox" class="custom-control-input" name="customChec" id="customCheck1">
                                                <label class="custom-control-label" for="customCheck1"><spring:message code="label.Jailuetjaccepte"/> <a href="#" > <spring:message code="label.lesconditionsgeneralesdutilisation"/></a></label>
                                            </div>
                                            <label id="capcustom" style=" color: red;"></label>

                                        </div>
                                    </div>
                                    <div class="form-group text-center ">
                                        <div class="col-xs-12 pb-3 ">
                                            <button class="btn btn-block btn-lg btn-success " id="inscbtn" onclick="add_inscription(this)"><spring:message code="button.SINSCRIRE"/></button>
                                        </div>
                                    </div>

                                </div>
                                </div>
                            </form>
                </div>
        </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="../../includes/footer1.jsp"/>

<script>
    $.fn.serializeObject = function()
    {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
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

    function validateemail($email) {
        var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
        return emailReg.test( $email );
    }

    function validatetel($tel) {
        var filter = /^((\+[1-9]{1,4}[ \-]*)|(\([0-9]{2,3}\)[ \-]*)|([0-9]{2,4})[ \-]*)*?[0-9]{3,4}?[ \-]*[0-9]{3,4}?$/;
        return filter.test( $tel );
    }

    function add_inscription(val){
        event.preventDefault();
    	//$(val).prop("disabled",true);
        if ($('#EIE').is(':checked')) {
            var etat=$("#etat").val("1");
        }
        if ($('#AUT').is(':checked')) {
            var etat=$("#etat").val("2");
        }
        if ($('#EIE').is(':checked') && $('#AUT').is(':checked')) {
            var etat=$("#etat").val("3");
        }
        var se = $("#registration1").serializeObject();
        var id=$("#compteId").val();


        var numRc = $("input[name=numRc]").val();
        var name_fr = $("input[name=name_fr]").val();
        var raison_ar = $("input[name=raison_ar]").val();
        var raison_fr = $("input[name=raison_fr]").val();
        var adresse_ar = $("textarea[name=adresse_ar]").val();
        var adresse_fr = $("textarea[name=adresse_fr]").val();
        var tel = $("input[name=tel]").val();
        var lowerCaseLetters = /[a-z]/g;
        var upperCaseLetters = /[A-Z]/g;
        var numbers = /[0-9]/g;
        var sym = /[!@#$%^&*+=._-]/g;
        var email = $("input[name=email]").val();
        var password = $("input[name=password]").val();
        var myInput = document.getElementById ("psw");
        var password11 = $("input[name=password11]").val();
        if ($.trim(numRc) === "" || numRc == null || $.trim(name_fr) === "" || name_fr == null || $.trim(raison_ar) === "" || raison_ar == null
            || $.trim(raison_fr) === "" || raison_fr == null || $.trim(adresse_ar) === "" || adresse_ar == null || $.trim(adresse_fr) === "" || adresse_fr == null ||
            tel == null || $.trim(tel) === "" || email == null || $.trim(email) === "" || password == null || $.trim(password) === "")  {

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.Tousleschampssontobligatoire"/>",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/>",
                html: false
            });
            return false;
        }

        // if($.trim(password11) ==="" || $.trim(password11) !=$.trim(password))
        // {
        //     swal("Avertissement ! ", 'Vos mots de passe doivent correspondre', 'error');
        //     return false;
        // }

        if(!validationmotpasse()){
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: 'le mot de passe invalide !!!!!',
            });
            return false;
        }

        if (!myInput.value.match(lowerCaseLetters) || !myInput.value.match (upperCaseLetters) || !myInput.value.match (sym) || !myInput.value.match (numbers) || !myInput.value.length >= 8) {

            swal({
                title: "<spring:message code="label.Avertissement"/>",
                text: "<spring:message code="label.lemotdepasseinvalide"/> ",
                type: "error",
                showCancelButton: false,
                confirmButtonColor: "#256144",
                confirmButtonText: "<spring:message code="label.OK"/>  ",
                html: false
            });
            return false;
        }

        if( !validateemail(email)) {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '<spring:message code="label.Emailinvalide"/> !!!!!',
            });
            return false;
        }

        if( !validatetel(tel)) {
            Swal.fire({
                icon: 'error',
                title: 'Oops...',
                text: '<spring:message code="label.telinvalide"/>!!!!!',
            });
            return false;
        }

        if(!ValidCaptcha()){
            $("#cap").text("<spring:message code="label.Silvousplaitmettezunnombrevalide"/>");
            return false;
        }else{
            $("#cap").text("");
        }

        if (($("input[name='customChec']:checked").length)<=0) {
            $("#capcustom").text("<spring:message code="label.Vousdevezcocherlesconditionsgeneralesdutilisation"/>");
            return false;
        }else{
            $("#capcustom").text("");
        }

      if(id==="" || !id){
          id=0;
      }
        $(val).prop("disabled", "true");
        $('#loader_modal').modal('show');
        $.ajax({
            type: "POST",
            url :"/addSociete/"+id,
            contentType : 'application/json; charset=utf-8',
            data : JSON.stringify(se),
            success : function(response) {
                $(val).prop("disabled", "false");
                $('#loader_modal').modal('hide');

                    swal({
                            title: "<spring:message code="label.Message"/>",
                            text: "<spring:message code="label.Votreidentifiantest"/>:"+response,
                            type: "success",
                            showCancelButton: false,
                            confirmButtonColor: "#256144",
                            confirmButtonText: "<spring:message code="label.OK"/> ",
                            html: false
                        },
                    function() {
                    // window.location="/index"
                    var elem="<table><tr><td><spring:message code="label.Identifiant"/> </td><td>: "+response+"</td></tr><tr><td><spring:message code="label.Motdepasse"/></td><td>: "+$("input[name='password']").val()+"</td></tr><tr><td><spring:message code="label.NumeroRC"/> </td><td>: "+$("input[name='NumRc']").val()+"</td></tr><tr><td><spring:message code="label.RaisonSociale"/></td><td>: "+$("input[name='raison_fr']").val()+"</td></tr><tr><td><spring:message code="label.Telephone"/> </td><td>: "+$("input[name='tel']").val()+"</td></tr><tr><td><spring:message code="label.Email"/> </td><td>: "+$("input[name='email']").val()+"</td></tr></table><br>";
                    PrintElem(elem);
                    window.location="/index";
                });

            },
            error : function() {
                $(val).prop("disabled", "false");
                $('#loader_modal').modal('hide');
                swal({
                    title: "Erreur",
                    text: "Erreur ajout non effectue",
                    type: "error"
                }, function() {
                    window.location="/index"
                });
            }
        });


    }
    function PrintElem(elem)
    {
        var mywindow = window.open('', 'PRINT', 'height=400,width=440');

        mywindow.document.write('<html><head><title>' + document.title  + '</title>');
        mywindow.document.write('</head><body > ');
        mywindow.document.write('<img alt="" src="/assets/images/logo.png" style="height: 60px; margin-top: -8px;" id="frlogo">');
        mywindow.document.write("<h1><spring:message code="label.Coordonneesdidentification"/> </h1>");
        mywindow.document.write(elem);
        mywindow.document.write(document.getElementById('EIE_Autorisation1').innerHTML);
        mywindow.document.write('</body></html>');

        mywindow.document.close(); // necessary for IE >= 10
        mywindow.focus(); // necessary for IE >= 10*/

        mywindow.print();
        //mywindow.close();

        return true;
    }

    $(document).on('click', '.toggle-password', function() {

        $(this).toggleClass("fa-eye fa-eye-slash");

        var input = $("#psw");
        input.attr('type') === 'password' ? input.attr('type','text') : input.attr('type','password')
    });
    $(document).on('click', '.toggle-password1', function() {

        $(this).toggleClass("fa-eye fa-eye-slash");

        var input = $("#psw11");
        input.attr('type') === 'password' ? input.attr('type','text') : input.attr('type','password')
    });
</script>
<script>

   function validationmotpasse() {
        var password = $("input[name=password]").val();
        var password11 = $("input[name=password11]").val();
         if($.trim(password11) =="" || $.trim(password11) !=$.trim(password))
         {
             $("#passcom").text("<spring:message code="label.Vosmotsdepassedoiventcorrespondre"/>");
            return false;
         }
         else
         {
             $("#passcom").text("");
             return true;

         }
    }



    function update(){
        var checkbox = $(this);
        var name = checkbox.data('name');
        if( checkbox.is(':checked') ) {
            $( '#' + name ).show();
        } else {
            $( '#' + name ).hide();
        }
    }

    //just setup change and each to use the same function
    $('.custom-control-input').change(update).each(update);

   $(function() {
       $("form[name='registration1']").validate({


           rules: {
               name_fr: {
                   required: true
               },

               email: {
                   required: true,
                   email: true,
                   //accept:"[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}"
               },
               email_c: {
                   required: true,
                   equalTo: '#emaily', // <- any valid jQuery selector
                   email: true,
                   //accept:"[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}"
               },
               password_c: {
                   required: true,
                   minlength: 8,
                   equalTo: '#psw'
               },
               /* captcha : {
                    required: true,
                    number : true,
                    minlength: 5,
                    maxlength: 5,
                    equalTo : '#txtCaptcha'
                },*/
               tel : {
                   required: true,
               },
               fax : {
                   required: true,
                   number : true,
                   minlength:10,
                   maxlength:10
               },

           },
           messages: {
               password_c: {
                   required: "<spring:message code="label.Veuillezfournirunmotdepasse"/>",
                   minlength: "<spring:message code="label.Votremotdepassedoitconteniraumoinscaracteres"/>"
               },
               email: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/>",
               name_fr: "<spring:message code="label.Silvousplaitmettezunusernamevalide"/>",
               email_c: "<spring:message code="label.Silvousplaitmettezuneadresseemailvalide"/>",
               //captcha: "S'il vous plaît, mettez un nombre valide",
               tel: "<spring:message code="label.Silvousplaitmettezuntelephonevalide"/>",
               fax: "<spring:message code="label.Silvousplaitmettezunfaxvalide"/>",

           },
           submitHandler: function(form) {
               form.submit();
           }
       });
   });


</script>

<script>
        var myInput = document.getElementById ("psw");
        var letter = document.getElementById ("letter");
        var capital = document.getElementById ("capital");
        var number = document.getElementById ("number");
        var length = document.getElementById ("length");
        var symbole = document.getElementById ("symbole");

        // When the user starts to type something inside the password field
        myInput.onkeyup = function () {
            // Validate lowercase letters
            var lowerCaseLetters = /[a-z]/g;
            if (myInput.value.match (lowerCaseLetters)) {
                letter.classList.remove ("invalide");
                letter.classList.add ("valide");
            } else {
                letter.classList.remove ("valide");
                letter.classList.add ("invalide");
            }

            // Validate capital letters
            var upperCaseLetters = /[A-Z]/g;
            if (myInput.value.match (upperCaseLetters)) {
                capital.classList.remove ("invalide");
                capital.classList.add ("valide");
            } else {
                capital.classList.remove ("valide");
                capital.classList.add ("invalide");
            }

            // Validate numbers
            var numbers = /[0-9]/g;
            if (myInput.value.match (numbers)) {
                number.classList.remove ("invalide");
                number.classList.add ("valide");
            } else {
                number.classList.remove ("valide");
                number.classList.add ("invalide");
            }

            var sym = /[!@#$%^&*+=._-]/g;
            if (myInput.value.match(sym)) {
                symbole.classList.remove ("invalide");
                symbole.classList.add ("valide");
            } else {
                symbole.classList.remove ("valide");
                symbole.classList.add ("invalide");
            }

            // Validate length
            if (myInput.value.length >= 8) {
                length.classList.remove ("invalide");
                length.classList.add ("valide");
            } else {
                length.classList.remove ("valide");
                length.classList.add ("invalide");
            }

            if(myInput.value.match (lowerCaseLetters) && myInput.value.match (upperCaseLetters) && myInput.value.match (numbers) && myInput.value.match(sym) && myInput.value.length >= 8){
                document.getElementById ("message").style.display = "none";
            }
            else{
                document.getElementById ("message").style.display = "block";
            }
        }
</script>
