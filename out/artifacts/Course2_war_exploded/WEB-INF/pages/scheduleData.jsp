<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Schedule" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 28-Nov-19
  Time: 11:39 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(function () {
        $('#scheduleDataId').dataTable();
    });
</script>
<table id="scheduleDataId" class="display" style="width:100%">
    <thead>
    <tr>
        <th>No</th>
        <th>Student</th>
        <th>Lesson</th>
        <th>Teacher</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${scheduleList}" var="sl">
        <tr style="text-align: center">
            <td>${sl.id}</td>
            <td>${sl.student.name} ${sl.student.surname}</td>
            <td>${sl.lesson.lessonName}</td>
            <td>${sl.teacher.name} ${sl.teacher.surname} </td>
        </tr>
    </c:forEach>
    </tbody>
</table>