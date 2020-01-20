<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 02-Dec-19
  Time: 4:26 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Upload</title>
</head>
<body>
<form action="us" method="post" enctype="multipart/form-data">
   Fayl:  <input type="file" name="fileName" /> <br>
   Ad:    <input type="text" name="studentName"/> <br>
    <input type="submit" value="Gonder"/>
</form>
</body>
</html>
