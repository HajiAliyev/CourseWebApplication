<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 19-Nov-19
  Time: 5:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(function () {
        $('#dobId').datepicker({
            changeMonth: true,
            changeYear: true
        });
    })
</script>
<div class="lbldesign1"><label for="nameId">Name:</label>         <input type="text" id="nameId" /></div>
<div class="lbldesign1"><label for="surnameId">Surname:</label>    <input type="text" id="surnameId" /></div>
<div class="lbldesign1"><label for="dobId">Date of birth:</label>  <input type="text" id="dobId"   /></div>
<div class="lbldesign1"><label for="addressId">Address:</label>    <input type="text" id="addressId" /></div>
<div class="lbldesign1"><label for="phoneId">Phone:</label>        <input type="text" id="phoneId"  /></div>
<div class="lbldesign1"><label for="emailId">Email:</label>        <input type="text" id="emailId"   /></div>