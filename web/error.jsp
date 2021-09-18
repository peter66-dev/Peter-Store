<%-- Document : error.jsp Created on : Jun 19, 2021, 5:49:22 PM Author : Dell --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <link rel="preconnect" href="https://fonts.googleapis.com">
            <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
            <link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&display=swap" rel="stylesheet">
            <link rel="stylesheet" href="css/errorStyle.css" />
            <title>Error Page</title>
        </head>

        <body>
            <div class="container">
                <h1 class="text-center">
                    <p class="text-danger">Error</p>
                    ${sessionScope.ERROR_MESSAGE}
                </h1>
                <div class="myClass row mt-2">
                    <a class=" col-12 col-xs-4 col-sm-3 col-md-2 col-lg-2 btn btn-outline-info" href="login.html">Login
                        Page</a>
                    <a class=" col-12 col-xs-4 col-sm-3 col-md-2 col-lg-2 btn btn-outline-primary" href="store.jsp">Store
                        Page</a>
                </div>
            </div>

        </body>


        </html>