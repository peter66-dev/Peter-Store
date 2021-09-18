<%-- Document : admin Created on : Jun 1, 2021, 1:34:27 PM Author : Dell --%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page import="java.util.List" %>
            <%@page import="sample.user.UserDTO" %>
                <%@page contentType="text/html" pageEncoding="UTF-8" %>
                    <!DOCTYPE html>
                    <html>

                    <head>

                        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

                        <link rel="preconnect" href="https://fonts.googleapis.com">
                        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                        <link href="https://fonts.googleapis.com/css2?family=Festive&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">
                        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
                        <link rel="stylesheet" href="css/adminStyle.css">

                        <title>Admin Page</title>
                    </head>

                    <body>

                        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}" />
                        <c:set var="search" value="${param.search}" />

                        <c:if test="${loginUser == null or loginUser.roleID != 'AD'}">
                            <c:redirect url="login.html" />
                        </c:if>

                        <c:if test="${loginUser.roleID == 'US'}">
                            <c:url var="store" value="store.jsp" />
                        </c:if>
                        <div class="container-fluid">
                            <form action="MainController">
                                <button class="btn btn-primary" name="action" value="Log out">Log out</button>
                            </form>

                            <h1 class="welcome">Hello Admin: ${loginUser.fullName}</h1>

                            <form action="MainController">
                                <div class="myForm mb-3">
                                    <input style="width: 20%;" class="form-control" type="text" placeholder="Input here ..." name="search" value="${param.search}" />
                                    <button class="col-xs-4 btn btn-outline-info" type="submit" name="action" value="Search">Search</button>
                                    <button class="col-xs-4 btn btn-outline-info" type="submit" name="action" value="Show All Users">Show all</button>
                                </div>
                            </form>
                        </div>

                        <c:set var="message" value="${requestScope.MESSAGE}" />
                        <c:set var="error_message_admin" value="${requestScope.ERROR_MESSAGE_ADMIN}" />
                        <c:set var="success_message_admin" value="${requestScope.SUCCESS_MESSAGE_ADMIN}" />

                        <c:if test="${message != null}">
                            <h1 class="message">${message}</h1>
                        </c:if>
                        <c:if test="${error_message_admin != null}">
                            <h1 id="error_message_admin" class="d-none">${error_message_admin}</h1>
                        </c:if>
                        <c:if test="${success_message_admin != null}">
                            <h1 id="success_message_admin" class="d-none">${success_message_admin}</h1>
                        </c:if>


                        <c:set var="list" value="${sessionScope.LIST_USER}" />
                        <c:if test="${list != null and not empty list}">
                            <div class="table-responsive">
                                <table border="1" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <th>No</th>
                                            <th style="width: 5rem;">User ID</th>
                                            <th>Password</th>
                                            <th class="text-center">Full Name</th>
                                            <th class="text-center">Gender</th>
                                            <th class="text-center" style="width: 5rem;">Role ID</th>
                                            <th class="text-center">Email</th>
                                            <th class="text-center">Phone</th>
                                            <th class="text-center">Bank</th>
                                            <th class="text-center">Address</th>
                                            <th class="text-center">Update</th>
                                            <th class="text-center">Delete</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="user" varStatus="counter" items="${list}">
                                            <form action="MainController">
                                                <tr style="background-color: #d5df7b59">
                                                    <td class="text-center"> ${counter.count}</td>
                                                    <td> ${user.userID.toUpperCase()}</td>
                                                    <td>******</td>
                                                    <td> ${user.fullName}</td>
                                                    <td class="text-center"> ${user.gender}</td>
                                                    <td class="text-center"> ${user.roleID}</td>
                                                    <td class="textRight"> ${user.email}</td>
                                                    <td class="textRight"> ${user.phoneNumber}</td>
                                                    <td class="text-center"> ${user.bank}</td>
                                                    <td class="textRight"> ${user.address}</td>
                                                    <td>
                                                        <button class="btn btn-info m-1" type="submit" name="action" value="Update">Update</button>
                                                        <input type="hidden" name="userID" value="${user.userID}" readonly="" />
                                                        <input type="hidden" name="fullName" value="${user.fullName}" required="" />
                                                        <input type="hidden" name="roleID" value="${user.roleID}" required="" />
                                                        <input type="hidden" name="email" value="${user.email}" required="" />
                                                        <input type="hidden" name="phoneNumber" value="${user.phoneNumber}" required="" />
                                                        <input type="hidden" name="bank" value="${user.bank}" required="" />
                                                        <input type="hidden" name="address" value="${user.address}" required="" />
                                                        <input type="hidden" name="gender" value="${user.gender}" required="" />
                                                        <input type="hidden" name="search" value="${param.search}" />
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-danger m-1" type="submit" name="action" value="Delete">Delete</button>
                                                        <input type="hidden" name="userID" value="${user.userID}" />
                                                        <input type="hidden" name="roleID" value="${user.roleID}" />
                                                        <input type="hidden" name="search" value="${param.search}" />
                                                    </td>

                                                </tr>
                                            </form>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:if>
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script src="./Javascript/admin.js"></script>
                    </body>

                    </html>