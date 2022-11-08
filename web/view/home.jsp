<%-- 
    Document   : home
    Created on : Nov 2, 2022, 1:25:40 PM
    Author     : bacht
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap');

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        html,
        body {
            height: 100%;
            width: 100%;
        }

        .container {
            width: 84%;
            padding-left: 5%;
            padding-top: 2rem;
        }

        .container .box_container {
            margin-top: 2rem;
            display: flex;
            justify-content: space-between;
        }

        .container .box {
            height: 216px;
            width: 384px;
            background-color: cyan;
            border-radius: 24px;
        }
        
        .container .login_box {
            height: 216px;
            width: 64%;
            background-color: cyan;
            border-radius: 24px;
            text-align: center;
        }



    </style>

    <body>
        <div class="container">
            <div class="login_box">
                <c:if test="${sessionScope.account ne null}">
                    Hello ${sessionScope.account.displayname}, click
                    <a href="logout">here</a> to logout.
                </c:if>
                <c:if test="${sessionScope.account eq null}">
                    click
                    <a href="login">here</a> to login.
                </c:if>
            </div>
            <div class="box_container">
                <a href="<c:if test="${sessionScope.account.username eq 'sonnt'}">timetable?lid=1</c:if>
                   <c:if test="${sessionScope.account.username eq 'mra'}">timetable?lid=2</c:if>
                   <c:if test="${sessionScope.account.username eq 'mrb'}">timetable?lid=3</c:if>"> <div class="box">Timetable</div> </a> <br/>
                <a href="<c:if test="${sessionScope.account.username eq 'sonnt'}">takeattandance?id=1</c:if>
                   <c:if test="${sessionScope.account.username eq 'mra'}">takeattandance?id=6</c:if>"> <div class="box">Take attandance</div> </a><br/>
                <a href="reportatt?gid=1"> <div class="box">Report attandance</div></a>
            </div>     
        </div>
    </body>
</html>
