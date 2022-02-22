<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<spring:url value="/resources/" var="resources"/>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page session="false" %>
<jsp:include page="../../includes/head.jsp"/>
<style>
    mark, .mark{
        padding: 0.2em;
        background-color: #ffdc05 !important;
    }
</style>
<style>
        body {
            color: #566787;
            background: #f5f5f5;
            font-family: 'Roboto', sans-serif;
        }
        .table-responsive {
            margin: 30px 0;
        }
        .table-wrapper {
            //min-width: 1000px;
            background: #fff;
            padding: 40px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
        }

        .table-title {
            padding-bottom: 10px;
            margin: 0 0 10px;
        }
        .table-title h2 {
            margin: 8px 0 0;
            font-size: 22px;
        }
        .search-box {
            position: relative;
            float: right;
        }
        .search-box input {
            height: 34px;
            border-radius: 20px;
            padding-left: 35px;
            border-color: #ddd;
            box-shadow: none;
        }
        #search{
            border-radius: 20px;
            border-color: #ddd;
            box-shadow: none;
            margin-bottom: 15px;
        }
        .search-box input:focus {
            border-color: #3FBAE4;
        }
        .search-box i {
            color: #a0a5b1;
            position: absolute;
            font-size: 19px;
            top: 8px;
            left: 10px;
        }
        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
        }
        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #fcfcfc;
        }
        table.table-striped.table-hover tbody tr:hover {
            background: #f5f5f5;
        }
    </style>
<div class="container" style="margin-top: 13rem;">
        <div class="table-wrapper" dir="${pageContext.response.locale=='ar'?'rtl':'ltr'}">
                <div class="row">
                    <div class="col-md-12 col-sm-12 col-lg-12">
                    <div class="" style="height: 50px; display: flex; justify-content: center; background: linear-gradient(to right, #336c4e, #7be3ad)">
                        <div class="col-md-12 my-3 text-center">
                            <strong class="profil text-white"><spring:message code="label.Cataloguedesdechets"/></strong><br>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-lg-4 mt-2">
                        <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <b><spring:message code="label.Veuillezselectionneruncategorie"/></b>
                            <select id="codeParent" name="classification" class="form-control select-2 bg-light select2" required style="height: 40px;" onchange="getCodeByParent(this.value)">
                                
		                                     <c:forEach items="${listPr}" var="cd">
		                                                       
		                                                       <option ${cd.id_codeparentt ==idParent ? "selected":"" } value="${cd.id_codeparentt}">${cd.numeroCode } - ${cd.nom_fr }</option>
		                                     </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-lg-4 mt-2">
                        <div class="form-group" style="${pageContext.response.locale=='ar'?'text-align:right;':'text-align:left;'}">
                            <b><spring:message code="label.Veuillezselectionneruntype"/></b>
                            <select id="classification" name="classification" class="form-control select-2 bg-light" onchange="getcla(this.value)" required style="height: 40px;">
                                <option value="1"><spring:message code="label.dangereux"/></option>
                                <option value="2"><spring:message code="label.nondangereux"/></option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12 col-lg-12">
                            <div class="search-box">
                                <i class="material-icons">&#xE8B6;</i>
                                <input type="text" class="form-control" id="txtsearch" placeholder="Rechercher&hellip;">
                            </div>

                    </div>
                </div>
                <div id="mydata">
                    <table class="table my_table table-striped table-hover table-bordered" id="exemple_table">
                    <thead class="text-white" style="background-color: #336c4e ">
                    <tr>
<%-- <th class="text-center"><spring:message code="label.transporteur"/></th>--%>
                        <th class="text-center" width="20%"><spring:message code="label.code"/></th>
                        <th class="text-center"><spring:message code="label.typededechet"/></th>


                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listC}" var="p">
                        <tr>
                        <td>
                               ${p.nom_fr}<br>
                        </td>
                        <td >
                             ${p.nom_ar}<br>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
             </div>
        </div>
</div>
<script src="https://cdn.jsdelivr.net/g/mark.js(jquery.mark.min.js),datatables.mark.js"></script>
<script src="https://cdn.jsdelivr.net/g/mark.js(jquery.mark.min.js)"></script>
<script src="https://cdn.datatables.net/plug-ins/1.10.13/features/mark.js/datatables.mark.js"></script>

<jsp:include page="../../includes/footer1.jsp"/>
<script>
$(document).ready(function() {

    var table = $('#exemple_table').DataTable({
        "bPaginate": true,//pagination
        "bLengthChange": false,
        "bFilter": true,//recherche
        "bInfo": false,
        "bAutoWidth": false,
        "mark": false
    });
    /*$.extend(true, $.fn.dataTable.defaults, {
        mark: true
    });*/
    $("#exemple_table_filter").addClass("d-none");

    $("#txtsearch").on("input", function (e) {
        e.preventDefault();
        table.search($(this).val()).draw();
    });

});
$(document).ready(function (){
  $('[type=search]').css({
      'height': '34px',
      'border-radius': '20px',
      'padding-left': '15px',
      'border-color': '#ddd',
      'box-shadow': 'none'
  });
});

function getcla(classification) {

    var id = $("#codeParent").val();

    $
        .ajax({
            type : "GET",
            url : "/codebyParentCategorie/"+id+"/"+classification,
            data :{},
            contentType : false,
            success : function(response) {
                $("#mydata").html(response);
            },
            error : function() {
            }
        });
}
function getCodeByParent(id){

    var classification = $("#classification").val();

    $.ajax({
            type : "GET",
            url : "/codebyParentCategorie/"+id+"/"+classification,
            data :{},
            contentType : false,
            success : function(response) {
                $("#mydata").html(response);
            },
            error : function() {
            }
        });
}
</script>
