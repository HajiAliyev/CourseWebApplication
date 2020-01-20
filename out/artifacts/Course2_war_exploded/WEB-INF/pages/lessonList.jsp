<%@ page import="model.Lesson" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 18-Nov-19
  Time: 1:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Lesson> lessonList = (List<Lesson>) request.getAttribute("lessonList");%>
<script type="text/javascript">
    $(function () {
        $('#lessonDataId').dataTable();
    });
</script>
<table id="lessonDataId" width="100%" class="display">
    <thead>
    <tr>
        <th>Id</th>
        <th>Lesson Name</th>
        <th>Lesson Price</th>
        <th>Lesson Time</th>
    </tr>
    </thead>
    <tbody>
    <% for(Lesson lesson : lessonList){%>
    <tr style="text-align: center">
        <td><%=lesson.getId()%></td>
        <td><%=lesson.getLessonName()%></td>
        <td><%=lesson.getLessonPrice()%></td>
        <td><%=lesson.getLessonTime()%></td>
    </tr>
    <%}%>
    </tbody>
</table>