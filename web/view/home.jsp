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
            position: relative;
            height: 216px;
            width: 384px;
            background-color: aliceblue;
            border-radius: 8px;
            font-size: 24px;
            font-weight: 600;
            text-align: center;
            display: flex;
            justify-content: center;
            align-items: center;
        }
       
        
        a {
            text-decoration: none;
            font-size: 24px;
        }
        
        .container .login_box {
            height: 216px;
            width: 64%;
            background-color: aliceblue;
            border-radius: 16px;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .login_buttom {
            height: 64px;
            width: 240px;
            background-color: blueviolet;
            border-radius: 8px;
            font-size: 32px;
            font-weight: 600;
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            color: aliceblue;
        }
        
        .logout {
            height: 32px;
            width: 120px;
            margin-left: 16px;
            margin-right: 16px;
            background-color: blueviolet;
            border-radius: 8px; 
            color: aliceblue;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .login_box {
            font-size: 24px;
            font-weight: 600;
            color: #845ec2;
        }



    </style>

    <body>
        <div class="container">
            <div class="login_box">
                <c:if test="${sessionScope.account ne null}">
                    Hello ${sessionScope.account.displayname}, click
                    <a href="logout"> <div class="logout"> here </div> </a> to logout.
                </c:if>
                <c:if test="${sessionScope.account eq null}">
                    <a href="login"><div class="login_buttom">LOGIN</div></a>
                </c:if>
            </div>
            <div class="box_container">
                <a href="timetable?lid=1"> <div class="box"><p>Timetable</p></div> </a> <br/>
                <a href="takeattandance?id=1"> <div class="box"><p>Take attandance</p></div> </a><br/>
                <a href="reportatt?gid=1"> <div class="box"><p>Report attandance</p></div></a>
            </div>     
        </div>
    </body>
</html>
