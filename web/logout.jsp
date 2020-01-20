<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 29-Nov-19
  Time: 4:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    session.removeAttribute("login");
    session.invalidate();
    response.sendRedirect("login.jsp");
%>