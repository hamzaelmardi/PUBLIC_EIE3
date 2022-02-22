<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .container{
        margin: auto;
        text-align: center;
    }
    .label-danger {
        color: #FC6180; }
</style>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6 mt-5 col-sm-12 justify-content-center" style="margin-top:10rem">
            <h1 class="text-center  label label-danger">en attente de signer le document</h1>
        </div>
    </div>
    <div class="row justify-content-center">
        <div class="col-md-6  col-sm-12 justify-content-center" style="margin-top:1rem">
            <img src="/assets/images/signe.png" alt="en attente de signer le document"/>
        </div>
    </div>
</div>



