<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false"%>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<div class="row">
  <div class="col-12 form-group">
    <label ><spring:message code="label.Enquetepublique"/>  </label>
    <input  onchange="addDoc(${id},'3','doc3')"   accept=".pdf"  type="file"  id="doc3" class="form-control" >
  </div>

  <div class="col-12 form-group">
    <label ><spring:message code="label.Etudedimpact"/>  </label>
    <input multiple onchange="addDoc(${id},'1','doc1')"  accept=".pdf"  type="file"  id="doc1" class="form-control" >

  </div>

</div>
<div class="row">
  <div class="col-lg-12 col-sm-12 form-group">
    <label ><spring:message code="label.Cahierdecharge"/>  </label>
    <input  onchange="addDoc(${id},'2','doc2')"  accept=".pdf"  type="file"  id="doc2" class="form-control" >
  </div>
</div>

<div class="row justify-content-center">
  <div class="col-3">
    <button onclick="fun_save_alert()" class="btn btn-success btn-block"><spring:message code="button.Enregistrer"/></button>
  </div>
</div>

<script>
  function fun_save_alert(){
    event.preventDefault();
    Swal.fire({
      title: "<strong><spring:message code="label.Votredemandeestdposeetencoursdetraitement"/> </strong>",
      icon: 'success',
      html: '<a href="/api/checkEIESelect" class="btn btn-success mt-2 ">Retour</a>',
      showCloseButton: false,
      showCancelButton: false,
      showConfirmButton: false,
      focusConfirm: false,
    })
  }
</script>

