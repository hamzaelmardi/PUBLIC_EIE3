<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<style>.card-body{
${pageContext.response.locale!='ar'?'border-left: 8px solid #5d6974;':'border-right: 8px solid #5d6974;'}
}</style>

<table class="table my_table table-bordered table-striped table-hover">
    <thead>
    <tr>
        <th><spring:message code="label.payedetransit"/> </th>
        <th><spring:message code="label.Port"/> </th>
        <th><spring:message code="label.Action"/> </th>
    </tr>
    </thead>
    <tbody id="tbody_it">
    <c:forEach items="${notification.ports}" var="p" varStatus="loopp" >
        <tr style="background-color:${bg};color: #808080 !important;font-weight:bold" >
            <td class="col-4">${pageContext.response.locale=='ar'?p.pays.nom_ar:p.pays.nom_fr}</td>
            <td class="col-6">${p.nom_fr}</td>
            <td class="col-2 text-center">
                <button class="btn btn-success rounded-circle"
                        onclick="delete_port('${p.id_port}','id_notification')">
                    <span class="fa fa-times"></span></button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="card">
    <div class="card-body">
<div class="row m-0 p-0">
    <div class="col-sm-12 col-md-6 nopadding">
        <div class="form-group">

            <select type="text" class="form-control" name="pays_select" id="pays">
                <option value="0"><spring:message code="label.choisirunpays"/> </option>
                <c:forEach items="${pays1}" var="t">
                    <option
                            value="${t[0]}">${pageContext.response.locale!='ar'?t[1]:t[2]}</option>
                </c:forEach>
            </select>
        </div>
    </div>
                <div class="col-sm-12 col-md-6 nopadding">
                    <div class="form-group">
                        <div class="input-group">
                            <input type="text" class="form-control" name="nom_fr" id="nom_fr"
                                   placeholder="<spring:message code="label.EntrezUnPort"/> ">
                        </div>
                    </div>
            </div>
</div>

        <div class="row mt-3 justify-content-center p-0">
            <div class="clear"></div>
            <div class="col-sm-12 col-md-3">
                <input type="hidden" value="0" id="id_port">
                <button class="btn btn-success btn-block"
                        onclick="ajouterPort('id_notification',this)"><spring:message code="button.Enregistrer"/>
                    <spring:message code="label.Port"/>
                </button>
            </div>
        </div>

    </div>
</div>


