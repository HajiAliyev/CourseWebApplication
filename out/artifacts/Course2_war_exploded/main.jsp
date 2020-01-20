<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 13-Nov-19
  Time: 9:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Course</title>
    <script type="text/javascript" src="js/jquery/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="js/main.js"></script>
    <link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
<div id="container">
    <div id="header">
        <h1>Project name</h1>

    </div>
    <div id="menu">
        <input type="button" id="studentDataBtnId" value="Student " class="btndesign"> <br>
        <input type="button" id="teacherDataBtnId" value="Teacher " class="btndesign"> <br>
        <input type="button" id="lessonDataBtnId" value="Lesson " class="btndesign"> <br>
        <input type="button" id="scheduleDataBtnId" value="Schedule " class="btndesign"> <br>
    </div>
   <div id="content">
       <div style="display: none ">
           <form action="cs?action=register" method="post"  class="color">
               <div class="lbldesign"><label for="nameId">Name:</label> </div> <input type="text" name="name" id="nameId"/> <br>
               <div class="lbldesign"><label for="surnameId">Surname:</label> </div> <input type="text" name="surname" id="surnameId"/> <br>
               <div class="lbldesign"><label for="dobId">Date of birth:</label> </div> <input type="text" name="dob" id="dobId"/> <br>
               <div class="lbldesign"><label for="passwordId">Password:</label> </div> <input type="password" name="password" id="passwordId"/> <br>
               <div class="lbldesign">Gender</div>
               <input type="radio" name="gender" value="male"/> Male &nbsp;
               <input type="radio" name="gender" value="female"/> Female <br>
               <div class="lbldesign">Foreign languages:</div> <br>
               <div class="lbldesign"><input type="checkbox" name="foreignLanguage" value="az"/>Azerbaijan </div> <br>
               <div class="lbldesign"><input type="checkbox" name="foreignLanguage" value="rus"/>Russian </div> <br>
               <div class="lbldesign"><input type="checkbox" name="foreignLanguage" value="en"/>English </div><br>
               <div class="lbldesign"><input type="checkbox" name="foreignLanguage" value="fr"/>French </div><br>
               <div class="lbldesign"><input type="checkbox" name="foreignLanguage" value="tr"/>Turkish </div><br>
               <div class="lbldesign">Doguldugu olke:</div>
               <select name="country">
                   <option value="az">Azerbaijan</option>
                   <option value="en">England</option>
                   <option value="tr">Turkey</option>
               </select> <br>
               <div class="lbldesign">City:</div>
               <select multiple name="city">
                   <option value="baku">Baku</option>
                   <option value="istanbul">Istanbul</option>
                   <option value="london">London</option>
                   <option value="moscov">Moscov</option>
               </select>    <br>
               <div class="lbldesign">Note</div>
               <textarea cols="20" rows="3" name="textarea" >

        </textarea> <br>
               <input type="submit" value="Gonder"/> &nbsp;
               <input type="reset" value="Temizle"/>
           </form>
       </div>
<%--        <table id="studentDataId" border="2px" width="100%" style="display: none">--%>
<%--            <caption>Student data</caption>--%>
<%--            <thead>--%>
<%--            <tr>--%>
<%--                <th>Id</th>--%>
<%--                <th>Name</th>--%>
<%--                <th>Surname</th>--%>
<%--                <th>Address</th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--        </table>--%>
<%--        <table id="teacherDataId" border="2px" width="100%" style="display: none">--%>
<%--            <caption>Teacher data</caption>--%>
<%--            <thead>--%>
<%--            <tr>--%>
<%--                <th>Id</th>--%>
<%--                <th>Name</th>--%>
<%--                <th>Surname</th>--%>
<%--                <th>Address</th>--%>
<%--            </tr>--%>
<%--            </thead>--%>
<%--        </table>--%>

    </div>
    <div id="footer">
        <a href="cs?action=getStudentList">Link</a>

    </div>

</div>
</body>
</html>
