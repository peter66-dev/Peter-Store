<%-- 
    Document   : user
    Created on : Jun 19, 2021, 8:30:57 PM
    Author     : Dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Festive&family=Mountains+of+Christmas:wght@400;700&family=Princess+Sofia&family=Zen+Tokyo+Zoo&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/storeStyle.css"/>

        <title>Peter's Store</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.LOGIN_USER}"/>
        <c:set var="list" value="${sessionScope.LIST_BOOK}"/>
        <c:set var="search" value="${requestScope.search}"/>
        <c:set var="shopping_message" value="${requestScope.SHOPPING_MESSAGE}"/>
        <c:set var="shopping" value="${sessionScope.SHOPPING}"/>
        <c:url var="loginLink" value="MainController">
            <c:param name="action" value="Log in"></c:param>
        </c:url>
        <c:url var="logoutLink" value="MainController">
            <c:param name="action" value="Log out"></c:param>
        </c:url>
        <c:url var="viewCart" value="MainController">
            <c:param name="action" value="View Cart"></c:param>
        </c:url>

        <div class="menu">
            <div>
                <a class="loginBtn" href="${loginLink}">Log in</a>
                <a class="logoutBtn" href="${logoutLink}">Log out</a> 
            </div>
            <div>
                <a class="viewCart" href="${viewCart}">View my cart</a>
            </div>
        </div>

        <h1 style="text-align: center;color: #FF826E;
            font-family: 'Festive', cursive;font-size: 3rem">
            Welcome ${user.fullName} to Peter's Store!</h1>


        <form action="MainController" class="form_search">
            <div>
                <select name="userChoice">
                    <option value="Product Name">Product Name</option>
                    <option value="Category ID">Category ID</option>
                    <option value="Writer">Writer</option>
                </select>
                <input type="text" placeholder="Input here" name="search" value="${param.search}"/>
                <button type="submit" name="action" value="Search Items" class="btn_search">Search</button>
            </div>
            <div> 
                <button type="submit" name="action" value="Show All Products" class="btn_search">Show all</button>
            </div>
        </form>
                
        <c:if test="${shopping != null}">
            <h1 class="shopping"><i>${shopping}</i></h1>
        </c:if></br>
        <c:if test="${shopping_message != null}">
            <h1 class="shopping_message"><i>${shopping_message}</i></h1>
        </c:if></br>

        <c:if test="${ not empty list }">
            <table border="1">
                <thead>
                    <tr  style="background-color: #FFC480">
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
                <tbody>
                    <c:forEach var="pro" varStatus="counter" items="${list}">
                    <form action="MainController">
                        <tr style="background-color: #D9FFD8">

                            <td style="text-align: center"> ${counter.count}</td>
                            <td style="text-align: center"> ${pro.productID}</td>
                            <td>${pro.productName}</td>
                            <td style="text-align: center">${pro.categoryID}</td>
                            <td style="text-align: left">${pro.writer}</td>
                            <td style="text-align: center">${pro.quantityInStock}</td>
                            <td style="text-align: right">${pro.price}</td>
                            <td style="text-align: right">${pro.publicationDate}</td>

                            <td style="text-align: right">
                                <div class="add">
                                    <input class="addValue" type="number" name="quantityBuy" value="0"/>
                                    <button class="btn_add" type="submit" value="Add To Cart" name="action">
                                        Add
                                    </button>
                                    <input type="hidden" name="userID" value="${user.userID}"/>
                                    <input type="hidden" name="productID" value="${pro.productID}"/>
                                    <input type="hidden" name="categoryID" value="${pro.categoryID}"/>
                                    <input type="hidden" name="productName" value="${pro.productName}"/>
                                    <input type="hidden" name="writer" value="${pro.writer}"/>
                                    <input type="hidden" name="quantityInStock" value="${pro.quantityInStock}"/>
                                    <input type="hidden" name="price" value="${pro.price}"/>
                                    <input type="hidden" name="search" value="${param.search}"/>
                                </div>
                            </td>
                        </tr>
                    </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </body>
</html>
