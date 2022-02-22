<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<div class="modal" id="loader_modal" style="background: transparent !important" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog" role="document" style="width: 200px !important">
        <div class="modal-content" style="background: transparent !important;border: none">
            <div class="modal-body p-0">
                <img src="${pageContext.request.contextPath}/assets/images/Spinner_200.gif" class="w-100 rounded mx-auto d-block" style="background: transparent !important;">
            </div>
        </div>
    </div>
</div>

<%--DataTable%--%>
<script src="${pageContext.request.contextPath}/assets/js/datatable/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatable/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatable/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatable/responsive.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatable/dataTables.fixedColumns.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/toolbar/jquery.toolbar.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/toolbar/custom-toolbar.js"></script>
<%--ddddd--%>

<style>
    h6{
        color:#336c4e;
    }
    .text-white,.mb-1{
    font-size:11px !important;
    }
</style>
<!-- Main Footer -->
<%--<footer class="main-footer">--%>

    <%--<!--End pagewrapper-->--%>
    <%--<!--Scroll to top-->--%>
    <%--<!--<script type="text/javascript">--%>
          <%--function confirmEmail() {--%>
              <%--var email = document.getElementById("email").value--%>
              <%--var confemail = document.getElementById("confemail").value--%>
              <%--var pass = document.getElementById("pass").value--%>
              <%--var confemail2 = document.getElementById("confemail2").value--%>
              <%--if(email != confemail) {--%>
                  <%--document.getElementById("confemail").style.backgroundColor = "#ff6a6a94";--%>
                  <%--document.getElementById("confemail").style.Color = "red";--%>
              <%--}else {document.getElementById("confemail").style.backgroundColor = "rgb(255 255 255)";--%>
                  <%--document.getElementById("confemail").style.color = "#495057";}--%>
              <%--if(pass != confemail2) {--%>
                  <%--document.getElementById("confemail2").style.backgroundColor = "#ff6a6a94";--%>
                  <%--document.getElementById("confemail2").style.color = "red";--%>
              <%--}else {document.getElementById("confemail2").style.backgroundColor = "rgb(255 255 255)";--%>
                  <%--document.getElementById("confemail2").style.color = "#495057";}--%>
          <%--}--%>
      <%--</script>-->--%>


      <%--<!-- Footer Bottom -->--%>
    <%--<div class="footer-bottom">--%>
        <%--<div class="auto-container">--%>
            <%--<div class="inner">--%>
                <%--<div class="copyright">Copyrights <a href="#">&copy; 2020.</a>Tous droits réservés par <a href="https://twinsgroupe.com/">Twins</a></div>--%>
                <%--<ul class="social-links clearfix">--%>
                    <%--<li><a href="#"><span class="fab fa-facebook-f"></span></a></li>--%>
                    <%--<li><a href="#"><span class="fab fa-twitter"></span></a></li>--%>
                    <%--<li><a href="#"><span class="fab fa-linkedin-in"></span></a></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>

<%--</footer>--%>


<!--End pagewrapper-->
<!--Scroll to top-->

<footer dir="auto" class="text-center text-lg-start bg-light text-muted w-100 d-inline-block mt-5" id="footer_footer">

    <!-- Copyright -->
    <div class="text-center p-2" style="background-color: rgba(0, 0, 0, 0.05); font-size: 11px">
       © Copyright 2021 Département de l'environnement | Powerded By Twins
    </div>
    <!-- Copyright -->
</footer>

<!-- Footer -->
<div class="scroll-to-top scroll-to-target" data-target="html"><span class="icon flaticon-up-arrow-angle"></span></div>


<script src="${pageContext.request.contextPath}/assets/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery-ui.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery.fancybox.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/owl.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/scrollbar.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/appear.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/wow.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/custom-script.js"></script>



<!--views-->
<script src="${pageContext.request.contextPath}/assets/jsp/js/demandez_compte.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/stockage.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/menu.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/stockage_affich.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/home_page.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/suivi_demande_page.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/demande.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/notifications.js"></script>
<script src="${pageContext.request.contextPath}/assets/jsp/js/avis_projet_table.js"></script>









<%--sweetAlert--%>
<script src="${pageContext.request.contextPath}/assets/js/sweet-alert.min.js"></script>

<%--VALIDATION FORM--%>
<script src="${pageContext.request.contextPath}/assets/js/jquery.validate.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/custom-script2.js"></script>


<%--DataTable%--%>
<script src="${pageContext.request.contextPath}/assets/js/datatable/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatable/dataTables.bootstrap4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatable/dataTables.responsive.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/datatable/responsive.bootstrap4.min.js"></script>


<%--SELECT2--%>
<script src="${pageContext.request.contextPath}/assets/js/select2.min.js" ></script>


<script src="${pageContext.request.contextPath}/assets/js/jquery.canvasjs.min.js"></script>

<script src="${pageContext.request.contextPath}/assets/js/statistique.js"></script>
<script >

    $(document).ready(function() {

// Gets the video src from the data-src on each button

        var $videoSrc;
        $('.video-btn').click(function() {
            $videoSrc = $(this).data( "src" );
        });
        console.log($videoSrc);

// when the modal is opened autoplay it
        $('#videoModal').on('shown.bs.modal', function (e) {

// set the video src to autoplay and not to show related video. Youtube related video is like a box of chocolates... you never know what you're gonna get
            $("#video").attr('src',$videoSrc );
        })



// stop playing the youtube video when I close the modal
        $('#videoModal').on('hide.bs.modal', function (e) {
            // a poor man's stop video
            $("#video").attr('src',$videoSrc);
        })






// document ready
    });


function onAcceptTerms() {

    if ($('#isTermsAccepted').is(":checked")) {

        window.location.href = "/affichMov";
    } else {
        $('#msgValidationStep3').show();
    }
}

function fin() {


    window.location.href = "/notifi_affich";

}

$(document).ready(function() {
    $('.dropdown-toggle').dropdown();
    $(".select2").select2({
        closeOnSelect: true
    });

    if(location.hash == "#ressources"){

        $([document.documentElement, document.body]).animate({
            scrollTop: $("#ressources").offset().top
        }, 2000);

    }
});

$(document).ready(function() {
    $('table:not(.my_table)').DataTable({
        "searching": false,
        "bLengthChange": false,
        "pageLength":4,
        "responsive":true,
        "ordering": false,
        fixedColumns: {
            rightColumns: 1
        },
        language: {
            "sProcessing":     "Traitement en cours...",
            "sSearch":         "Rechercher&nbsp;:",
            "sLengthMenu":     "Afficher _MENU_ &eacute;l&eacute;ments",
            "sInfo":           "",
            "sInfoEmpty":      "",
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
                    _: "%d lignes sÃ©lÃ©ctionnÃ©es",
                    0: "Aucune ligne sÃ©lÃ©ctionnÃ©e",
                    1: "1 ligne sÃ©lÃ©ctionnÃ©e"
                }
            }
        }
    });
} );

function show_footer_action(val,that){
    if($(val).is(":visible")){
        $(val).hide();
        $(that).find(".fa-caret-down").removeClass("fa-caret-down").addClass("fa-caret-right");

    }else{
        $(val).show();
        $(that).find(".fa-caret-right").removeClass("fa-caret-right").addClass("fa-caret-down");

    }
}
</script>

</div>

</body>
</html>


