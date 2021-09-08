<%-- 
    Document   : admin
    Created on : Jun 1, 2021, 1:34:27 PM
    Author     : Dell
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.List"%>
<%@page import="sample.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Festive&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/adminStyle.css">

        <title>Admin Page</title>
    </head> 
    <body style="background-color: #00C9E3;margin: 0;padding: 0">

        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}"/>
        <c:set var="search" value="${param.search}"/>

        <c:if test="${loginUser == null or loginUser.roleID != 'AD'}">
            <c:redirect url="login.html"/>
        </c:if>

        <c:if test="${loginUser.roleID == 'US'}">
            <c:url var="store" value="store.jsp"/>
        </c:if>

        <form action="MainController" class="form_logout">
            <button name="action" value="Log out">Log out</button>
        </form>

        <h1 class="welcome">Hello Admin: ${loginUser.fullName}</h1>

        <form action="MainController" class="form_search">
            <div>
                <input type="text" placeholder="Input here" name="search" value="${param.search}"  class="input_search"/>
                <button type="submit" name="action" value="Search" class="btn_search">Search</button>
            </div>
            <div>
                <button type="submit" name="action" value="Show All Users" class="btn_search">Show all</button>
            </div>
        </form>

        <c:set var="message" value="${requestScope.MESSAGE}"/>
        <c:if test="${not empty message}">
            <h1 class="message">${message}</h1>
        </c:if>


        <c:set var="list" value="${sessionScope.LIST_USER}"/>
        <c:if test="${list != null and not empty list}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>User ID</th>
                        <th>Password</th>
                        <th>Full Name</th>
                        <th>Gender</th>
                        <th>Role ID</th>
                        <th>Email</th>                    
                        <th>Phone</th>
                        <th>Bank</th>
                        <th>Address</th>
                        <th>Delete</th>                    
                        <th>Update</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" varStatus="counter" items="${list}">
                    <form action="MainController">
                        <tr style="background-color: #D9FFD8">
                            <td style="text-align: center"> ${counter.count}</td>
                            <td> ${user.userID.toUpperCase()}</td>
                            <td>******</td>
                            <td> ${user.fullName}</td>
                            <td style="text-align: center"> ${user.gender}</td>
                            <td style="text-align: center"> ${user.roleID}</td>
                            <td style="text-align: right"> ${user.email}</td>
                            <td style="text-align: right"> ${user.phoneNumber}</td>
                            <td style="text-align: right"> ${user.bank}</td>
                            <td style="text-align: right"> ${user.address}</td>

                            <td>
                                <button type="submit" name="action" value="Delete" class="delete">Delete</button>
                                <input type="hidden" name="userID" value="${user.userID}"/>
                                <input type="hidden" name="roleID" value="${user.roleID}"/>
                                <input type="hidden" name="search" value="${param.search}"/>
                            </td>
                            <td>
                                <button type="submit" name="action" value="Update" class="update">Update</button>
                                <input type="hidden" name="userID" value="${user.userID}" readonly=""/>
                                <input type="hidden" name="fullName" value="${user.fullName}" required=""/>
                                <input type="hidden" name="roleID" value="${user.roleID}" required=""/>
                                <input type="hidden" name="email" value="${user.email}" required=""/>
                                <input type="hidden" name="phoneNumber" value="${user.phoneNumber}" required=""/>
                                <input type="hidden" name="bank" value="${user.bank}" required=""/>
                                <input type="hidden" name="address" value="${user.address}" required=""/>
                                <input type="hidden" name="gender" value="${user.gender}" required=""/>                        
                                <input type="hidden" name="search" value="${param.search}"/>
                            </td>
                        </tr>
                    </form>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</body>
</html>
