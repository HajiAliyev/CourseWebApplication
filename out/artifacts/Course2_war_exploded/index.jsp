<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Course</title>
    <script type="text/javascript" src="js/layout/jquery-latest.js"></script>
    <script type="text/javascript" src="js/layout/jquery.layout-latest.js"></script>
    <script type="text/javascript" src="js/layout/jquery-ui.js"></script>
    <script type="text/javascript" src="js/layout/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="js/combo.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <link rel="stylesheet" type="text/css" href="css/main.css ">
    <link rel="stylesheet" type="text/css" href="css/jquery-ui.css ">
    <link rel="stylesheet" type="text/css" href="css/jquery.dataTables.min.css">

    <script type="text/javascript">
        history.pushState(null,null,'index.jsp');
        window.addEventListener('popstate',function (event) {
            history.pushState(null,null,'index.jsp');
        });
    </script>
</head>
<div class="ui-layout-north">
    <h1>Project name</h1>
    <div style="float: right">Welcome: ${login.name} ${login.surname}</div>
    <a href="logout.jsp"><img height="40px" width="40px" src="images/logout.jpg" style="float: right "></a>
</div>
<body>
<div class="ui-layout-center">
    <h1>Center</h1>
</div>

<div class="ui-layout-east">
    <c:if test="${login.role.roleName eq 'ROLE_ADMIN'}">
        <input type="button" class="newBtnDesign" id="newBtnId" value="New"/>
    </c:if>

    <input type="text" placeholder="Search" id="keywordId" style="width: 58%"/> &nbsp;
    <input type="button" value="Search" id="searchBtnId"/>
</div>
<div class="ui-layout-west">
    <c:choose>
        <c:when test="${login.role.roleName eq 'ROLE_STUDENT'}">
            <input type="button" id="scheduleDataBtnId" value="Schedule " class="btndesign"> <br>
            <input type="button" id="lessonDataBtnId" value="Lesson " class="btndesign"> <br>
        </c:when>
        <c:when test="${login.role.roleName eq 'ROLE_TEACHER'}">
            <input type="button" id="studentDataBtnId" value="Student " class="btndesign"> <br>
            <input type="button" id="lessonDataBtnId" value="Lesson " class="btndesign"> <br>
            <input type="button" id="scheduleDataBtnId" value="Schedule " class="btndesign"> <br>
        </c:when>
        <c:otherwise>
            <input type="button" id="studentDataBtnId" value="Student " class="btndesign"> <br>
            <input type="button" id="teacherDataBtnId" value="Teacher " class="btndesign"> <br>
            <input type="button" id="lessonDataBtnId" value="Lesson " class="btndesign"> <br>
            <input type="button" id="scheduleDataBtnId" value="Schedule " class="btndesign"> <br>
        </c:otherwise>

    </c:choose>

</div>
<div id="newStudentDialogId"></div>
<div id="newTeacherDialogId"></div>
<div id="newScheduleDialogId"></div>
<div id="newLessonDialogId"></div>
<div id="editStudentDialogId"></div>
<div class="ui-layout-south">
    <h1>Footer</h1>
</div>
</body>
</html>

