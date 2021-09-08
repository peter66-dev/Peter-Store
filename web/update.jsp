<%-- 
    Document   : update
    Created on : Jul 11, 2021, 2:33:22 PM
    Author     : Dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/style.css">
        <title>Update Page</title>
    </head>
    <body>
        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}"/>
        <c:set var="userError" value="${requestScope.USER_ERROR}"/>
        
        <c:if test="${loginUser == null or loginUser.roleID != 'AD'}">
            <c:redirect url="login.html"/>
        </c:if>
        
        <form action="MainController">
            <div class="container">
                <h1>Update Information</h1>
                <p>Change information you want in this form.</p>
                </br>
                <hr>

                <label for="userID"><b>User ID</b></label><span  style="color: red">${userError.userIDError}</span></br>
                <input type="text" placeholder="Enter User ID" name="userID" value="${param.userID}" readonly=""/>

                <label for="fullName"><b>Full name</b></label><span  style="color: red">${userError.fullNameError}</span></br>
                <input type="text" placeholder="Enter your name" name="fullName" value="${param.fullName}" required=""/>

                <label for="roleID"><b>Role ID</b></label>
                <select name="roleID" style="width: 15.5rem;margin-left: 7.4rem">
                    <c:if test="${param.roleID == 'AD'}">
                        <option value="${param.roleID}">Admin</option>
                        <option value="US">User</option>
                    </c:if>
                    <c:if test="${param.roleID == 'US'}">
                        <option value="${param.roleID}">User</option>
                        <option value="AD">Admin</option>
                    </c:if>
                </select></br>

                <label for="gender"><b>Gender</b></label>
                <select name="gender" style="width: 15.5rem;margin-left: 7.4rem">
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                </select></br>

                <label for="email"><b>Email</b></label><span  style="color: red">${userError.emailError}</span></br>
                <input type="text" placeholder="Enter your email" name="email" value="${param.email}" required=""/>

                <label for="phoneNumber"><b>Phone Number</b></label><span style="color: red">${userError.phoneNumberError}</span></br>
                <input type="text" placeholder="Enter your phone number" name="phoneNumber" value="${param.phoneNumber}" required=""/>

                <label for="bank"><b>Bank</b></label>
                <select name="bank" style="width: 15.5rem;margin-left: 8.6rem">
                    <option value="${param.bank}">${param.bank}</option>
                    <option value="SHB">SHB</option>
                    <option value="HDBank">HDBank</option>
                    <option value="Vietcombank">Vietcombank</option>
                    <option value="Sacombank">Sacombank</option>
                    <option value="BAC A Bank">BAC A Bank</option>
                    <option value="VIB">VIB</option>
                    <option value="BIDV">BIDV</option>
                    <option value="ACB">ACB</option>
                    <option value="VietinBank">VietinBank</option>
                    <option value="VPBank">VPBank</option>
                    <option value="TPBank">TPBank</option>
                    <option value="AgriBank">AgriBank</option>
                    <option value="TechcomBank">TechcomBank</option>
                </select></br>

                <label for="address"><b>Address</b></label><span style="color: red">${userError.addressError}</span></br>
                <input type="text" placeholder="Enter your address" name="address" value="${param.address}" required=""/>

                <hr>
            </div>
            <button type="submit" class="registerbtn" name="action" value="Confirm Update">Update</button>
            <div class="container signin">
                <p>Already have an account? <a href="login.html">Sign in</a>.</p>
            </div>
        </form>
    </body>
</html>
