<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Student" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 16-Nov-19
  Time: 1:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script type="text/javascript">
    $(function () {
        $('#studentDataId').dataTable();
    });
</script>


<table id="studentDataId" class="display" style="width:100%">
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Address</th>
        <th>Dob</th>
        <th>Phone</th>
        <th>Email</th>
        <c:if test="${login.role.roleName eq 'ROLE_ADMIN'}">
            <th>Edit</th>
            <th>Delete</th>
        </c:if>

    </tr>
    </thead>
    <tbody>
    <c:forEach items="${studentList}" var="st">
        <tr style="text-align: center">
            <td>${st.id}</td>
            <td>${st.name}</td>
            <td>${st.surname}</td>
            <td>${st.address}</td>
            <td>${st.dob}</td>
            <td>${st.phone}</td>
            <td>${st.email}</td>
            <c:if test="${login.role.roleName eq 'ROLE_ADMIN'}">
            <td><a href="javascript: editStudent('${st.id}'); ">Edit </a></td>
            <td><a href="javascript: deleteStudent('${st.id}');">Delete </a></td>
            </c:if>
        </tr>
    </c:forEach>
    </tbody>
</table>
