<%-- 
    Document   : viewCart
    Created on : Jul 4, 2021, 10:22:11 AM
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
        <link rel="stylesheet" href="css/viewCartStyle.css"/>
        <title>View Cart Page</title>
    </head>
    <body style="background-color: #C7F3F8;margin: 0;padding: 0">
        <c:set var="viewcart_message" value="${requestScope.VIEWCART_MESSAGE}"/>
        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}"/>
        <c:set var="cart" value="${sessionScope.CART}"/>
        <c:set var="total" value="0"/>

        <c:if test="${loginUser.roleID != 'US'}">
            <c:redirect url="error.jsp">
                <c:set var="ERROR_MESSAGE" value="Sorry, only users can buy here!</br>Please, login or register new account!" scope="session"/>
            </c:redirect>
        </c:if>

        <h1 style="text-align: center;color: red">
            ${loginUser.fullName}'s CART
        </h1>

        <c:if test="${cart == null}">
            <h1 style="text-align: center;color: red">You did not buy anything here!</h1>
        </c:if>

        <c:if test="${viewcart_message != null}">
            <h1 class="message"><i>${viewcart_message}</i></h1>
        </c:if>

        <c:if test="${cart != null}">
            <c:if test="${sessionScope.CART.getCart().size() == 0}">
                <h1 style="text-align: center;color: red">You have not bought anything yet !</h1>
            </c:if>

            <c:if test="${sessionScope.CART.getCart().size() > 0}">
                <table border="1" style="border-collapse: collapse; border: 1px solid black; background-color: white;width: 100%;font-size: 1.4rem">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>Book ID</th>
                            <th>Book Name</th>
                            <th>Quantity</th>
                            <th>Price</th>
                            <th>Total</th>
                            <th>Update</th>
                            <th>Remove</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="pro" varStatus="counter" items="${sessionScope.CART.getCart()}">
                            <c:set var="total" value="${total + pro.value.quantityInStock * pro.value.price}"/>
                        <form action="MainController"/>
                            <tr>
                                <td style="text-align: center">${counter.count}</td>
                                <td style="text-align: center;width: 6rem">
                                    <input type="text" name="productID" value="${pro.value.productID}" readonly="" class="productID"/>
                                </td>
                                <td>${pro.value.productName}</td>
                                <td style="text-align: center;width: 6rem">
                                    <input type="number" name="quantityBuy" value="${pro.value.quantityInStock}" class="quantity"/>
                                </td>
                                <td style="text-align: center;width: 7rem">
                                    <input type="number" name="price" value="${pro.value.price}" readonly="" class="price"/>
                                </td>
                                <td style="text-align: center">
                                    ${pro.value.quantityInStock*pro.value.price}
                                </td>
                                <td style="text-align: center">
                                    <input type="submit" name="action" value="Modify" class="modify"/>
                                </td>
                                <td style="text-align: center">
                                    <input type="submit" name="action"  value="Remove" class="remove"/>
                                </td>
                            </tr>
                        </form>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>    
        </c:if>         
<script>
    function payMoney() {
        alert("Your bill is: ${total} VND");
        alert("Please wait a second for checking quantity in stock\n\
        Loading...");
        <c:url var="payMoney" value="MainController">
            <c:param name="action" value="Pay Money"/>
        </c:url>
    }
</script>
<h1  style="text-align: center;color: #4313E6">Total : ${total} VND</h1> 

<div class="add">
    <a href="store.jsp" class="addMore">Add more</a>
</div>

<c:if test="${cart != null && not empty cart.getCart()}">
    <div style="text-align: center;margin-top: 1rem">
        <a href="${payMoney}" onclick="payMoney()" class="bill">Pay Bill</a>
    </div>
</c:if>
    </body>
</html>
