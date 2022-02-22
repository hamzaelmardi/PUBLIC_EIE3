<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib
        prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="false" %>


<form id="formTransporteur" name="formTransporteur">
    <div class="row m-0 p-0 mt-5">
        <div class="col-6">
            <div class="form-group">
                <label><spring:message code="label.transporteur"/> </label><input type="hidden" name="id_notification"
                                                     id="id_notification4"
                                                     value="${notification.id_notification}">
                <select name="id_transporteur" id="id_Transporteur"
                        class="form-control select2"
                        data-width="100%">
                    <option value=""><spring:message code="option.Choisir"/></option>
                    <c:forEach items="${Transporteur_liste}" var="t">
                        <option value="${t[0] }">${t[1] }</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="col-6">
            <div class="form-group">
                <button style="margin-top: 10px;margin-bottom: 10px;" type="button"
                        onclick="addObject_TR('formTransporteur','notif_tranport','divTableTranport',this)"
                        class="btn btn-success">
                    <spring:message code="button.ajouter"/>
                </button>
            </div>
        </div>
    </div>
</form>
    <div class="table-responsive">
        <table id="tableProfils"
               class="table table-striped hover compact table-bordered text-md-nowrap">
            <thead class="thead-bleu">
            <tr>
                <th class=""><spring:message code="label.nom"/> </th>


                <th class=""><spring:message code="label.identifiantfiscal"/></th>
                <%--<th class="">Adresse</th>--%>
                <th class=""><spring:message code="label.telephone"/></th>
                <th class=""><spring:message code="label.Fax"/></th>
                <th class=""><spring:message code="label.email"/></th>

                <th class="" style="min-width: 120px"><spring:message code="label.Action"/></th>
            </tr>
            </thead>
            <tbody id="tbodyTransporteur">
            <c:forEach items="${notification.transporteur}" var="Tr_l">

                <tr>
                    <td>${Tr_l.nom} </td>


                    <td>${Tr_l.identifiant} </td>
                        <%--<td>${Tr_l.adresse} </td>--%>
                    <td>${Tr_l.tel} </td>
                    <td>${Tr_l.fax} </td>
                    <td>${Tr_l.adresse} </td>
                    <td class="">
                        <ul class="list-inline m-0">
                            <li class="list-inline-item">
                                <button onclick="delete_tr(this)"
                                        class="btn btn-danger btn-sm rounded-circle tab_trash"
                                        type="button" data-toggle="tooltip" data-placement="top"
                                        title="Supprimer">
                                    <div class="icon_trash_1">
                                        <svg version="1.1" id="Capa_1"
                                             xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                             width="20px" height="20px" viewBox="0 0 489.74 489.74"
                                             style="enable-background:new 0 0 489.74 489.74;"
                                             xml:space="preserve">
                                                                 <g>
                                                                     <g>
                                                                         <path d="M399.179,67.285l-74.794,0.033L324.356,0L166.214,0.066l0.029,67.318l-74.802,0.033l0.025,62.914h307.739L399.179,67.285z
                                                                        M198.28,32.11l94.03-0.041l0.017,35.262l-94.03,0.041L198.28,32.11z"/>
                                                                         <path d="M91.465,490.646h307.739V146.359H91.465V490.646z M317.461,193.372h16.028v250.259h-16.028V193.372L317.461,193.372z
                                                                        M237.321,193.372h16.028v250.259h-16.028V193.372L237.321,193.372z M157.18,193.372h16.028v250.259H157.18V193.372z"/>
                                                                     </g>
                                                                 </g>
                                                               </svg>
                                    </div>
                                    <div class="icon_trash_2 d-none">
                                        <svg version="1.1" id="Capa_1"
                                             xmlns="http://www.w3.org/2000/svg" x="0px" y="0px"
                                             width="20px" height="20px" viewBox="0 0 489.74 489.74"
                                             style="enable-background:new 0 0 489.74 489.74;"
                                             xml:space="preserve">
                                                                 <g>
                                                                     <g>
                                                                         <path d="M361.051,199.929H102.01V489.74h259.041V199.929L361.051,199.929z M170.818,450.163h-13.492V239.505h13.492V450.163z
                                                                        M238.276,450.163h-13.492V239.505h13.492V450.163z M305.734,450.163h-13.492V239.505h13.492V450.163z"/>
                                                                         <path d="M387.73,145.959l-52.74-30.672l28.129-48.365L248.047,0l-28.127,48.362l-56.113-32.634l-26.678,45.875l223.922,130.231
                                                                       L387.73,145.959z M257.808,36.891l68.421,39.792l-14.564,25.038L243.241,61.93L257.808,36.891z"/>
                                                                     </g>
                                                                 </g>
                                                               </svg>
                                    </div>
                                </button>
                            </li>
                        </ul>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

 <div class="col-12" style="text-align: center">
                            <button type="button" style="margin-top: 10px;margin-bottom: 10px;"
                                    onclick="openCity1('Btn3','3')"
                                    class="btn btn-success"><spring:message code="button.Precedent"/>
                            </button>
                            <button style="margin-top: 10px;margin-bottom: 10px;" type="button" id=""
                                    onclick="openCity1('Btn5','5')" class="btn btn-success"><spring:message code="button.Suivant"/>
                            </button>
                        </div>
