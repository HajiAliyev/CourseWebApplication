<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 23-Nov-19
  Time: 5:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(function () {
        $('#dobIdU').datepicker({
            changeMonth: true,
            changeYear: true
        });
    })
</script>
<div class="lbldesign1"><label for="nameIdU">Name:</label>          <input type="text" id="nameIdU" value="${student.name}"/></div>
<div class="lbldesign1"><label for="surnameIdU">Surname:</label>    <input type="text" id="surnameIdU" value="${student.surname}"/></div>
<div class="lbldesign1"><label for="dobIdU">Date of birth:</label>  <input type="text" id="dobIdU"   value="${student.dob}"/></div>
<div class="lbldesign1"><label for="addressIdU">Address:</label>    <input type="text" id="addressIdU" value="${student.address}"/></div>
<div class="lbldesign1"><label for="phoneIdU">Phone:</label>        <input type="text" id="phoneIdU"  value="${student.phone}"/></div>
<div class="lbldesign1"><label for="emailIdU">Email:</label>        <input type="text" id="emailIdU" value="${student.email}" /></div>