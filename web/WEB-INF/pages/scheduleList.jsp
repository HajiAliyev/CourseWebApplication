<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="model.Schedule" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 19-Nov-19
  Time: 9:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%List<Schedule> scheduleList = (List<Schedule>) request.getAttribute("scheduleList");%>
<script type="text/javascript">
    $(function () {
        $('#accordion').accordion({
            collapsible: true
        });
        $('.datepicker').datepicker({
            changeMonth: true,
            changeYear: true
        });
        $('#advLessonCombo').change(function () {
            getTeacherComboByLessonId($(this).val());
        });
        $('#searchBtnId').click(function () {
           advancedSearchSchedule();
        });
        $('#scheduleDataId').dataTable();
    });
</script>

<div id="accordion">
    <h3>Advanced Search</h3>
    <div>
        <select id="advLessonCombo">
            <option value="0"  selected disabled >Select Lesson</option>
            <c:forEach items="${lessonList}" var="ll">
                <option value="${ll.id}">${ll.lessonName}</option>
            </c:forEach>
        </select> &nbsp;
        <select id="advTeacherCombo">
            <option value="0"  selected disabled>Select Teacher</option>
            <c:forEach items="${teacherList}" var="tl">
                <option value="${tl.id}">${tl.name}  ${tl.surname}</option>
            </c:forEach>
        </select> <br>
        <input type="text" id="advBeginDateId" class="datepicker"/> &nbsp;
        <input type="text" id="advEndDateId" class="datepicker"/>
        <input type="button" value="Search" id="searchBtnId"/>
    </div>
</div> <br>
<div id="scheduleDivId">
    <table id="scheduleDataId" class="display" style="width:100%" >
        <thead>
        <tr>
            <th>No</th>
            <th>Student </th>
            <th>Lesson</th>
            <th>Teacher </th>

        </tr>

        </thead>
        <tbody>
        <%for(Schedule schedule : scheduleList){%>
        <tr style="text-align: center">
            <td><%=schedule.getId()%></td>
            <td><%=schedule.getStudent().getName()+ " " + schedule.getStudent().getSurname()%></td>
            <td><%=schedule.getLesson().getLessonName()%></td>
            <td><%=schedule.getTeacher().getName() + " " + schedule.getTeacher().getSurname()%> </td>
        </tr>

        <%}%>
        </tbody>
    </table>
</div>

