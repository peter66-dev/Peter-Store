<%-- 
    Document   : error.jsp
    Created on : Jun 19, 2021, 5:49:22 PM
    Author     : Dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/errorStyle.css"/>
        <title>Error Page</title>
    </head>
    <body>
        <h1>
            Error
            <br/>
            ${sessionScope.ERROR_MESSAGE}
        </h1>
        <div class="message">
            <a href="login.html" class="loginBtn">Back to Login Page</a><br/>
            <a href="store.jsp" class="storeBtn">Back to Store</a>
        </div>

    </body>
</html>
