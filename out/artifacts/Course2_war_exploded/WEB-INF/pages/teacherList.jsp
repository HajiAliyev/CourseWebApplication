<%@ page import="model.Teacher" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 18-Nov-19
  Time: 1:05 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Teacher> teacherList = (List<Teacher>) request.getAttribute("teacherList");%>
<script type="text/javascript">
    $(function () {
        $('#teacherDataId').dataTable();
    });

</script>
<table id="teacherDataId" class="display" style="width:100%" >
    <thead>
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Surname</th>
        <th>Address</th>
        <th>Dob</th>
        <th>Phone</th>
        <th>Email</th>
    </tr>
    </thead>
    <tbody>
    <% for(Teacher t : teacherList){%>
    <tr style="text-align: center">
        <td><%=t.getId()%></td>
        <td><%=t.getName()%></td>
        <td><%=t.getSurname()%></td>
        <td><%=t.getAddress()%></td>
        <td><%=t.getDob()%></td>
        <td><%=t.getPhone()%></td>
        <td><%=t.getEmail()%></td>
    </tr>
    <%}%>
    </tbody>
</table>