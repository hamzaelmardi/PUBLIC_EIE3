<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>





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
                <%--<td>${f.nom}</td>--%>
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
</script>


