<%-- Document : viewCart Created on : Jul 4, 2021, 10:22:11 AM Author : Dell --%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <title>View Cart Page</title>
    </head>

    <body style="background-color: #C7F3F8;margin: 0;padding: 0">
        <c:set var="viewcart_message" value="${requestScope.VIEWCART_MESSAGE}" />        
        <c:set var="error_viewcart_message" value="${requestScope.ERROR_VIEWCART_MESSAGE}" />
        <c:url var="payMoney" value="MainController">
            <c:param name="action" value="Pay Money"/>
        </c:url>
        <c:set var="loginUser" value="${sessionScope.LOGIN_USER}" />
        <c:set var="cart" value="${sessionScope.CART}" />
        <c:set var="total" value="0" />

        <c:if test="${loginUser.roleID != 'US'}">
            <c:redirect url="error.jsp">
                <c:set var="ERROR_MESSAGE" value="Sorry, only users can buy here!</br>Please, login or register new account!" scope="session" />
            </c:redirect>
        </c:if>

        <div class="container-fluid">
            <h1 class="text-center text-primary">${loginUser.fullName}'s CART</h1>

            <c:if test="${cart == null}">
                <h1 class="text-center text-dark">You did not buy anything here!</h1>
            </c:if>

            <h1 id="viewcart_message" class="d-none">${viewcart_message}</h1>
            <h1 id="error_viewcart_message" class="d-none">${error_viewcart_message}</h1>

            <c:if test="${cart != null}">
                <c:if test="${sessionScope.CART.getCart().size() == 0}">
                    <h1 class="text-center  text-danger">You have not bought anything yet !</h1>
                </c:if>

                <c:if test="${sessionScope.CART.getCart().size() > 0}">
                    <table border="1" class="table table-bordered table-active table-striped">
                        <thead>
                            <tr class="text-center">
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
                                <c:set var="total" value="${total + pro.value.quantityInStock * pro.value.price}" />
                            <form action="MainController">
                                <tr>
                                    <td style="text-align: center">${counter.count}</td>
                                    <td style="text-align: center;width: 6rem">
                                        ${pro.value.productID}
                                        <input type="hidden" name="productID" value="${pro.value.productID}" readonly="" />
                                    </td>
                                    <td style="text-align: left; width: 35%;">${pro.value.productName}</td>
                                    <td class="text-center" style="width: 10%;">
                                        <input class="form-control text-center" type="number" name="quantityBuy" value="${pro.value.quantityInStock}" />
                                    </td>
                                    <td style="text-align: center;width: 7rem">
                                        ${pro.value.price}
                                    </td>
                                    <td style="text-align: center">
                                        ${pro.value.quantityInStock*pro.value.price}
                                    </td>
                                    <td style="text-align: center">
                                        <input id="modify" class="btn btn-info" type="submit" name="action" value="Modify" />
                                    </td>
                                    <td style="text-align: center">
                                        <input id="remove" class="btn btn-danger" type="submit" name="action" value="Remove" />
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:if>

            <h1 class="text-center text-danger mt-2">Total : ${total} VND</h1>

            <div class="d-flex justify-content-center">
                <a class="btn btn-outline-primary" href="store.jsp">Add more</a>
            </div>

            <c:if test="${cart != null && not empty cart.getCart()}">
                <div style="text-align: center;margin-top: 0.4rem;">
                    <button id="btnPay" onclick="myFunction()" class="btn btn-outline-danger">Pay Bill</button>
                </div>
            </c:if>
        </div>



        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
                        function myFunction() {
                            swal({
                                title: "Checking quantity in stock ...",
                                text: "Your bill is ${total} VND!",
                                icon: "info",
                                showCancelButton: true,
                                confirmButtonText: "Pay bill!"
                            }).then((result) => {
                                window.location.href = "${payMoney}";
                            });
                        }
        </script>
        <script src="./Javascript/viewCart.js"></script>

    </body>

</html>