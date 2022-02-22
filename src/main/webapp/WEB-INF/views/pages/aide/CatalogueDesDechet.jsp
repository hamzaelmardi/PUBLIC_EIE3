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
            padding: 20px;
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
        .container{
            margin-top: 10%;
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
<div class="container">
        <div class="table-wrapper">
            <div class="row">
            <div class="col-md-12 col-sm-12 col-lg-12">
                <div class="" style="height: 50px; display: flex; justify-content: center; background: linear-gradient(to right, #b1eed9, #e3dddd)">
                    <div class="col-md-12 my-3 text-center">
                        <strong class="profil text-white"><spring:message code="label.TransporteurAutorise"/></strong><br>
                    </div>
                </div>
            </div>
            </div>
            <br>
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
                    <thead style="background-color: #17a2b8; color: white ">
                    <tr>
                        <th class="text-center"><spring:message code="label.transporteur"/></th>
                        <th class="text-center pl-0 pr-0" width="750px"><spring:message code="label.Typededechet"/></th>
                        <th class="text-center" width="100px"><spring:message code="label.code"/></th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${listF}" var="f">
                        <tr>
                            <td style="text-transform: uppercase">${f.nom}</td>
                            <td class="p-0" colspan="2">
                                <table class="my_table p-0">
                                    <c:forEach items="${f.code}" var="p">
                                        <tr>
                                            <td width="750px" >
                                                    ${p.nom_ar}
                                            </td>
                                            <td width="100px">
                                                    ${p.nom_fr}
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </td>
                            <td class="d-none w-0">

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
        $.extend(true, $.fn.dataTable.defaults, {
            mark: false
        });
        $("#exemple_table_filter").addClass("d-none");

        $("#txtsearch").on("keyup", function() {
            var value = $(this).val().toLowerCase();
            $("#exemple_table tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
            });
        });
       /* $("#txtsearch").on("input", function (e) {
            e.preventDefault();
            table.search($(this).val()).draw();
        });*/

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



</script>
