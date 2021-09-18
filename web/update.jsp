<%-- Document : update Created on : Jul 11, 2021, 2:33:22 PM Author : Dell --%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
                <link rel="stylesheet" href="css/style.css">
                <title>Update Page</title>
            </head>

            <body>
                <c:set var="loginUser" value="${sessionScope.LOGIN_USER}" />
                <c:set var="userError" value="${requestScope.USER_ERROR}" />

                <c:if test="${loginUser == null or loginUser.roleID != 'AD'}">
                    <c:redirect url="login.html" />
                </c:if>
                <div class="container-fluid">
                    <form action="MainController">
                        <h1>Update Information</h1>
                        <p>Change information you want in this form.</p>
                        </br>
                        <hr>
                        <div class="mb-3 row">
                            <label class="col-xs-2 col-form-label" for="userID"><b>User ID</b>
                                <span style="color: red"> ${userError.userIDError}</span></label>
                            <div class="col-xs-10">
                                <input class="form-control" type="text" placeholder="Enter User ID" name="userID" value="${param.userID}" required="" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label class="col-xs-2 col-form-label" for="fullName"><b>Full name</b>
                                <span style="color: red">${userError.fullNameError}</span>
                            </label>
                            <div class="col-xs-10">
                                <input class="form-control" type="text" placeholder="Enter your name" name="fullName" value="${param.fullName}" required="" />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-12 col-sm-3 col-form-label" for="roleID"><b>Role ID</b></label>
                            <div class="col-12 col-sm-3 col-lg-3">
                                <select class="col-lg-5 form-select form-select-md mb-3" name="roleID">
                                    <c:if test="${param.roleID == 'AD'}">
                                        <option value="${param.roleID}">Admin</option>
                                        <option value="US">User</option>
                                    </c:if>
                                    <c:if test="${param.roleID == 'US'}">
                                        <option value="${param.roleID}">User</option>
                                        <option value="AD">Admin</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-12 col-sm-3 col-form-label" for="gender"><b>Gender</b></label>
                            <div class="col-12 col-sm-3 col-lg-3">
                                <select class="col-lg-5 form-select form-select-md mb-3" name="gender" aria-label=".form-select-md example">
                                    <c:if test="${param.gender == 'Male'}">
                                        <option value="${param.gender}">Male</option>
                                        <option value="Female">Female</option>
                                    </c:if>
                                    <c:if test="${param.gender == 'Female'}">
                                        <option value="${param.gender}">Female</option>
                                        <option value="Male">Male</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-xs-2 col-form-label" for="email"><b>Email</b>
                                <span style="color: red">${userError.emailError}</span>
                            </label>
                            <div class="col-xs-10">
                                <input class="form-control" type="text" placeholder="Enter your email" name="email" value="${param.email}" required="" />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-xs-2 col-form-label" for="phoneNumber"><b>Phone Number</b>
                                <span style="color: red">${userError.phoneNumberError}</span>
                            </label>
                            <div class="col-xs-10">
                                <input class="form-control" type="text" placeholder="Enter your phone number" name="phoneNumber" value="${param.phoneNumber}" required="" />
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-sm-2 col-form-label" for="bank"><b>Bank</b></label>
                            <div class="col-xs-10">
                                <select class="form-select form-select-md mb-3" aria-label=".form-select-md example" name="bank">
                                    <option value="HDBank">HDBank</option>
                                    <option value="Vietcombank">Vietcombank</option>
                                    <option value="Sacombank">Sacombank</option>
                                    <option value="BAC A Bank">BAC A Bank</option>
                                    <option value="VIB">VIB</option>
                                    <option value="SHB">SHB</option>
                                    <option value="BIDV">BIDV</option>
                                    <option value="ACB">ACB</option>
                                    <option value="VietinBank">VietinBank</option>
                                    <option value="VPBank">VPBank</option>
                                    <option value="TPBank">TPBank</option>
                                    <option value="AgriBank">AgriBank</option>
                                    <option value="TechcomBank">TechcomBank</option>
                                </select>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label class="col-xs-2 col-form-label" for="address"><b>Address</b>
                                <span style="color: red">${userError.addressError}</span>
                            </label>
                            <div class="col-xs-10">
                                <input class="form-control" type="text" placeholder="Enter your address" name="address" value="${param.address}" required="" />
                            </div>
                        </div>
                        <hr>
                        <button type="submit" class="registerbtn" name="action" value="Confirm Update">Update</button>
                        <div class="mt-1">
                            <p>Already have an account? <a href="login.html">Sign in</a>.</p>
                        </div>
                    </form>
                </div>
            </body>

            </html>