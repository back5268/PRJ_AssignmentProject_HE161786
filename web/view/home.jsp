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
    <body>
        <c:if test="${sessionScope.account ne null}">
            Hello ${sessionScope.account.displayname}, click
            <a href="Logout">here</a> to logout.
        </c:if>
            <c:if test="${sessionScope.account eq null}">
            click
            <a href="login">here</a> to login.
        </c:if>
            <br/>
            cccccccccc
            <c:forEach items="${requestScope.account}" var="a">
                dsa
            </c:forEach>
            <a href=" <c:if test="${requestScope.account.roles} == 2">timetable?lid=1</c:if> ">Timetable</a> <br/>
            <a href="takeattandance?id=1">Take attandance</a>
    </body>
</html>
