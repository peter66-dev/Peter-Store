<%-- Document : user Created on : Jun 19, 2021, 8:30:57 PM Author : Dell --%>

    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
                <link href="https://fonts.googleapis.com/css2?family=Festive&family=Mountains+of+Christmas:wght@400;700&family=Princess+Sofia&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">
                <link rel="stylesheet" href="css/storeStyle.css" />
                <title>Peter's Store</title>
            </head>

            <body>
                <c:set var="user" value="${sessionScope.LOGIN_USER}" />
                <c:set var="list" value="${sessionScope.LIST_BOOK}" />
                <c:set var="search" value="${requestScope.search}" />

                <c:set var="error_shopping_message" value="${requestScope.ERROR_SHOPPING_MESSAGE}" />
                <c:set var="success_shopping_message" value="${requestScope.SUCCESS_SHOPPING_MESSAGE}" />
                <c:set var="shopping" value="${requestScope.SHOPPING}" />

                <c:url var="loginLink" value="MainController">
                    <c:param name="action" value="Log in"></c:param>
                </c:url>
                <c:url var="logoutLink" value="MainController">
                    <c:param name="action" value="Log out"></c:param>
                </c:url>
                <c:url var="viewCart" value="MainController">
                    <c:param name="action" value="View Cart"></c:param>
                </c:url>
                
                    <c:if test="${user.fullName != null}">
                        <div class="two-side-class">
                            <a class="btn btn-primary" href="${logoutLink}">Log out</a>
                            <a class="btn btn-info" href="${viewCart}">My cart</a>
                        </div>
                    </c:if>
                    <c:if test="${user.fullName == null}">
                        <div class="two-side-class">
                            <a class="btn btn-primary" href="${loginLink}">Log in</a>
                            <a class="btn btn-info" href="${viewCart}">My cart</a>
                        </div>
                    </c:if>
                    <div class="container-fluid text-center">
                    <h1 id="welcome" class="text-secondary">Welcome ${user.fullName} to Peter's Store 📚📖!</h1>
                    <form action="MainController">
                        <div class="center-class">
                            <div class="w-auto">
                                <select class="form-select form-select-md" aria-label=".form-select-md example" name="userChoice">
                                    <option value="Product Name">Product Name</option>
                                    <option value="Category ID">Category ID</option>
                                    <option value="Writer">Writer</option>
                                </select>
                            </div>
                            <input class="form-control" style="width: 15%;" type="text" placeholder="Input here" name="search" value="${param.search}" />
                            <button class="btn btn-info" type="submit" name="action" value="Search Items">Search</button>
                            <button class="btn btn-info" type="submit" name="action" value="Show All Products">
                                Show all</button>
                        </div>
                    </form>

                    <c:if test="${shopping != null}">
                        <h1 id="shopping" class="d-none">${shopping}</h1>
                    </c:if>
                    <c:if test="${success_shopping_message != null}">
                        <h1 id="success_shopping_message" class="d-none">${success_shopping_message}</h1>
                    </c:if>
                    <c:if test="${error_shopping_message != null}">
                        <h1 id="error_shopping_message" class="d-none">${error_shopping_message}</h1>
                    </c:if>

                    <c:if test="${ not empty list }">
                        <table border="1" class="table table-bordered table-striped mt-3">
                            <thead>
                                <tr class="bg-info">
                                    <th>No</th>
                                    <th>Book ID</th>
                                    <th>Book Name</th>
                                    <th>Category ID </th>
                                    <th>Writer</th>
                                    <th>Quantity</th>
                                    <th>Price(VND)</th>
                                    <th>Publication Date</th>
                                    <th>Add To Cart</th>
                                </tr>
                            </thead>
                            <tbody class="bg-gradient">
                                <c:forEach var="pro" varStatus="counter" items="${list}">
                                    <form action="MainController">
                                        <tr>
                                            <td style="text-align: center"> ${counter.count}</td>
                                            <td style="text-align: center"> ${pro.productID}</td>
                                            <td style="text-align: left">${pro.productName}</td>
                                            <td style="text-align: center">${pro.categoryID}</td>
                                            <td style="text-align: left">${pro.writer}</td>
                                            <td style="text-align: center">${pro.quantityInStock}</td>
                                            <td style="text-align: right">${pro.price}</td>
                                            <td style="text-align: right">${pro.publicationDate}</td>

                                            <td style="text-align: left">
                                                <div class="center-class">
                                                    <input class="w-60 form-control text-center" type="number" name="quantityBuy" value="0" />
                                                    <button class="m-1 btn btn-sm btn-warning" type="submit" value="Add To Cart" name="action">Add</button>
                                                    <input type="hidden" name="userID" value="${user.userID}" />
                                                    <input type="hidden" name="productID" value="${pro.productID}" />
                                                    <input type="hidden" name="categoryID" value="${pro.categoryID}" />
                                                    <input type="hidden" name="productName" value="${pro.productName}" />
                                                    <input type="hidden" name="writer" value="${pro.writer}" />
                                                    <input type="hidden" name="quantityInStock" value="${pro.quantityInStock}" />
                                                    <input type="hidden" name="price" value="${pro.price}" />
                                                    <input type="hidden" name="search" value="${param.search}" />
                                                </div>
                                            </td>
                                        </tr>
                                    </form>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:if>
                </div>
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script src="./Javascript/store.js"></script>
            </body>

            </html>