<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 02-Dec-19
  Time: 9:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

${message} <br>
<form action="ds" method="post">
    <input type="hidden" name="fileName" value="${imagePath}" style="width: 100%"/>
    <input type="submit" value="Download">
</form>

<br>
<img src="${imagePath2}" height="400" width="400" />