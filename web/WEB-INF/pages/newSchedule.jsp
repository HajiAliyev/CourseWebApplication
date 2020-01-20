<%@ page import="java.util.List" %>
<%@ page import="model.Student" %>
<%@ page import="model.Teacher" %>
<%@ page import="model.Lesson" %><%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 19-Nov-19
  Time: 6:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<Student> studentList = (List<Student>) request.getAttribute("studentList");
    List<Teacher> teacherList = (List<Teacher>) request.getAttribute("teacherList");
    List<Lesson> lessonList = (List<Lesson>) request.getAttribute("lessonList");
%>
<div class="lblDesign"> Student</div>
<select id="studentComboId"class="comboBoxDesign">
    <option value="0" selected disabled>Select Student</option>
    <% for(Student student : studentList){%>
    <option value="<%=student.getId()%>" ><%=student.getName() + " " + student.getSurname()%> </option>
    <%}%>
</select> <br> <br>
<div class="lblDesign"> Teacher</div>
<select id="teacherComboId" class="comboBoxDesign">
    <option value="0" selected disabled>Select Teacher</option>
    <% for(Teacher teacher : teacherList){%>
    <option value="<%=teacher.getId()%>"> <%=teacher.getName() + " " + teacher.getSurname()%> </option>
    <%}%>
</select> <br> <br>
<div class="lblDesign"> Lesson</div>
<select id="lessonComboId" class="comboBoxDesign" >
    <option value="0" selected disabled >Select Lesson</option>
    <% for(Lesson lesson : lessonList){%>
    <option value="<%=lesson.getId()%>"><%=lesson.getLessonName()%> </option>
    <%}%>
</select>