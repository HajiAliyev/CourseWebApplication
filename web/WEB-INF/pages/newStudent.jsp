<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Asus
  Date: 18-Nov-19
  Time: 5:24 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript">
    $(function () {
        $('#tabs').tabs({
            collapsible: true
        });

        $('#dobId').datepicker({
            changeMonth: true,
            changeYear: true
        });
    })
</script>

<div id="tabs">
    <ul>
        <li><a href="#tabs-1">General information</a></li>
        <li><a href="#tabs-2">Personal informatio</a></li>
    </ul>
    <div id="tabs-1">
        <div class="lbldesign1"><label for="nameId">Name:</label> <input type="text" id="nameId"/></div>
        <div class="lbldesign1"><label for="surnameId">Surname:</label> <input type="text" id="surnameId"/></div>
        <div class="lbldesign1"><label for="dobId">Date of birth:</label> <input type="text" id="dobId"/></div>
        <div class="lbldesign1"><label for="addressId">Address:</label> <input type="text" id="addressId"/></div>
        <div class="lbldesign1"><label for="phoneId">Phone:</label> <input type="text" id="phoneId"/></div>
        <div class="lbldesign1"><label for="emailId">Email:</label> <input type="email" id="emailId"/></div>
    </div>
    <div id="tabs-2">
        <div class="lbldesign1"><label for="usernameId">Username:</label> <input type="text" id="usernameId"/></div>
        <div class="lbldesign1">Role:
        <select id="roleNameId" style="width: 199px">
            <option value="0"  selected disabled>Select Role</option>
            <c:forEach items="${roleList}" var="rl">
                <option value="${rl.id}">${rl.roleName}</option>
            </c:forEach>

        </select>
        </div>
    </div>
</div>

