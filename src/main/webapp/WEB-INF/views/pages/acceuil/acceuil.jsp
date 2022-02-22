
<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<spring:url value="/resources/" var="resources" />
<jsp:include page="../../includes/head.jsp" />
<jsp:include page="../../menu/menu.jsp" />
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<jsp:include page="../../includes/tag.jsp" />
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
      <div class="main-panel">
        <div class="content-wrapper">

          <div class="row">
              <div class="col-md-12">
                  <div class="card">
                      <div class="">
                          <div class="row">
                              <div class="col-lg-3 border-right pr-0">
                                  <div class="card-body border-bottom">
                                      <h4 class="card-title mt-2">
                                          Glisser-déposer les évenements
                                      </h4>
                                  </div>
                                  <div class="card-body">
                                      <div class="row">
                                          <div class="col-md-12">
                                              <div id="calendar-events" class="">
                                                  <div class="calendar-events mb-3" data-class="bg-primary_1"><i class="event-1 bg-primary_1"></i>Rapport annuel</div>
                                                  <div class="calendar-events mb-3" data-class="bg-success_1"><i class="event-1 bg-success_1"></i>Reunion de commision</div>
                                                  <div class="calendar-events mb-3" data-class="bg-info"><i class="event-1 bg-info"></i>Visite de site</div>
                                                  <div class="calendar-events mb-3" data-class="bg-warning"><i class="event-1 bg-warning"></i>Autorisation</div>
                                              </div>
                                              <!-- checkbox -->
                                              <div class="custom-control custom-checkbox">
                                                  <input type="checkbox" class="custom-control-input" id="drop-remove">
                                                  <label class="custom-control-label" for="drop-remove">Supprimer après un glisser-déposer</label>
                                              </div>
                                              <a href="javascript:void(0)" data-toggle="modal" data-target="#add-new-event" class="btn mt-3 btn-block waves-effect waves-light btn_add_event" >
                                                      <i class="ti-plus"></i> Ajouter un Evenement
                                                  </a>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                              <div class="col-lg-9">
                                  <div class="card-body b-l calender-sidebar">
                                      <div id="calendar"></div>
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>

     
          
            
                
                <!-- END MODAL -->
        <!-- content-wrapper ends -->
        <!-- partial:partials/_footer.html -->
        
        <!-- partial -->
      </div>
<jsp:include page="../../includes/footer.jsp" />


