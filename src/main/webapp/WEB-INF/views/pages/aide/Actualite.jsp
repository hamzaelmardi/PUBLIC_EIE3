<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>

<jsp:include page="../../includes/head.jsp"/>

<style>
 body{
    background: linear-gradient(128deg,white 50%, #03b6d6 50%); height: 70vh; font-family: Poppins;
}

    .img-text{
        width: 300px;
    display: block;
    text-align: center;
    padding: 40% 5%;
    background: white;
    color: BLACK;
    border-radius: 15px;
    border: 1px solid #336c4e;
    }
    .img-text h2 {
        font-size: 25px;
        text-transform: uppercase;
        letter-spacing: 2px;
        margin-top: 30px;
    }

    .img-text p {
        font-size: 14px;
    }
    .single-box{
        position: relative;
        margin-bottom: 30px;
    }
    .img-area {
        position: absolute;
        width: 100px;
        border: 5px solid #fff;
        overflow: hidden;
        top: 15px;
        left: 93px;
        border-radius: 50%;
    }
    .img-area img{
        width: 100%;
    }
    .carousel-indicators
    {
        left: 0;
        top: auto;
        bottom: -10%;
    }
    .carousel-indicators li
    {
        background: #000;
        border-radius: 50%;
        width: 36px;
        height: 15px;
    }
    .carousel-indicators .active
    {
        background: #03b6d6;;

    }

</style>
<body>
<div class="container" style="margin-top:13rem;margin-bottom:6rem">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class=" carousel-indicators" >
                    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active" ></li>
                    <li data-target="#carouselExampleIndicators" data-slide-to="1"  ></li>
                </ol>
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="single-box">
                                    <div class="img-area">  <img src="/assets/images/Arb1.png" alt=""></div>
                                    <div class="img-text">
                                        <h2>les dernières informations</h2>
                                        <p>On sait que l'atmosphère de la Terre laisse passer la lumière du soleil qui réchauffe la surface du globe. La chaleur qui s'élève de la surface est en partie absorbée par les gaz et la vapeur d'eau présents dans l'atmosphère – on appelle ce processus naturel</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="single-box">
                                    <div class="img-area">  <img src="/assets/images/arbre2.png" alt=""></div>
                                    <div class="img-text">
                                        <h2>les dernières informations</h2>
                                        <p>On sait que l'atmosphère de la Terre laisse passer la lumière du soleil qui réchauffe la surface du globe. La chaleur qui s'élève de la surface est en partie absorbée par les gaz et la vapeur d'eau présents dans l'atmosphère – on appelle ce processus naturel</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="single-box">
                                    <div class="img-area">  <img src="/assets/images/environnement.jpg" alt=""></div>
                                    <div class="img-text">
                                        <h2>les dernières informations</h2>
                                        <p>On sait que l'atmosphère de la Terre laisse passer la lumière du soleil qui réchauffe la surface du globe. La chaleur qui s'élève de la surface est en partie absorbée par les gaz et la vapeur d'eau présents dans l'atmosphère – on appelle ce processus naturel</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <div class="row">
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="single-box">
                                    <div class="img-area">  <img src="/assets/images/audit.jpg" alt=""></div>
                                    <div class="img-text">
                                        <h2>les dernières informations</h2>
                                        <p>On sait que l'atmosphère de la Terre laisse passer la lumière du soleil qui réchauffe la surface du globe. La chaleur qui s'élève de la surface est en partie absorbée par les gaz et la vapeur d'eau présents dans l'atmosphère – on appelle ce processus naturel</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="single-box">
                                    <div class="img-area">  <img src="/assets/images/envol.png" alt=""></div>
                                    <div class="img-text">
                                        <h2>les dernières informations</h2>
                                        <p>On sait que l'atmosphère de la Terre laisse passer la lumière du soleil qui réchauffe la surface du globe. La chaleur qui s'élève de la surface est en partie absorbée par les gaz et la vapeur d'eau présents dans l'atmosphère – on appelle ce processus naturel</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="single-box">
                                    <div class="img-area">  <img src="/assets/images/RES.png" alt=""></div>
                                    <div class="img-text">
                                        <h2>les dernières informations</h2>
                                        <p>On sait que l'atmosphère de la Terre laisse passer la lumière du soleil qui réchauffe la surface du globe. La chaleur qui s'élève de la surface est en partie absorbée par les gaz et la vapeur d'eau présents dans l'atmosphère – on appelle ce processus naturel</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>
</body>

<script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
<jsp:include page="../../includes/footer1.jsp"/>
<script>
    /*  $(document).ready(function() {
          $('.table').DataTable().destroy();
      });*/
    $(document).ready(function (){
        $('[type=search]').css({
            'height': '34px',
            'border-radius': '20px',
            'padding-left': '15px',
            'border-color': '#ddd',
            'box-shadow': 'none'
        });
    });
</script>
