                        <%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%><%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
                        
                        
                        
                        
                            <div id="stp2" style="display: none">
                                <form id="formEntreprise" name="formEntreprise">

                                    <div class="row m-0 p-0 mt-5">
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label > <spring:message code="label.nom"/> : </label>
                                                <input type="text" value="" name="nom"  id="nom" class="form-control">
                                                 <input type="hidden" value="" name="id_notification"  id="id_notification" class="form-control">
                                             </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label > <spring:message code="label.Adresse"/> : </label>
                                                <input value="" type="text" name="adresse" id="adresse" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row m-0 p-0">
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label > <spring:message code="label.Telephone"/> : </label>
                                                <input value="" type="text" name="telephone" id="telephone" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label > <spring:message code="label.personneacontacter"/>   : </label>
                                                <input  value=""  type="text" name="personneContacter" id="personneContacter" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row m-0 p-0">
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label > <spring:message code="label.Fax"/> :   </label>
                                                <input value="" type="text" name="fax" id="fax" class="form-control">
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div class="form-group">
                                                <label > <spring:message code="label.Email"/> : </label>
                                                <input  value=""  type="text" name="email" id="email" class="form-control">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="d-flex justify-content-center mb-4">
                                        <button class="btn btn-primary"  id="sventrprs" onclick="add_entreprise()" type="button"><spring:message code="button.Suivant"/></button>
                                    </div>
                                </form>
                            </div>
