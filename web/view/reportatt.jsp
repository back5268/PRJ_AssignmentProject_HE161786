<%-- 
    Document   : reportatt
    Created on : Nov 6, 2022, 5:09:28 PM
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
            width: max-content;
        }

        .container {
            width: 95%;
            padding-left: 32px;
            padding-top: 32px;
        }

        table, tr, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            height: 64px;
            min-width: 64px;
        }

    </style>
    <body>
        <div class="container">
            <form action="reportatt" method="GET">
                Group: 
                <select name="gid">
                    <option value="${requestScope.gid}">${requestScope.mess}</option>
                    <option value="1">PRJ301-01</option>
                    <option value="2">PRJ301-02</option>
                    <option value="3">PRJ301-03</option>
                    <option value="4">PRO192-01</option>
                </select> <input type="submit" value="View"/> <br/> <br/>

                <input type="hidden" name="sesid" value="${param.id}"/>
                <table border="1px">
                    <tr>
                        <th>Student Id</th>
                        <th>Full Name</th>
                        <th>Absent (%)</th>
                            <c:forEach items="${requestScope.sess}" var="sess">
                            <th>Session ${sess.index}</th>
                            </c:forEach>
                            <c:forEach var="s" begin="${requestScope.size + 1}" end="30" >
                            <th>Session ${s} </th>
                            </c:forEach>
                            <c:forEach items="${requestScope.group.students}" var="s">
                        <tr>
                            <td>${s.id}</td>
                            <td>${s.name}</td>
                            <td></td>
                            <c:forEach items="${requestScope.group.sessions}" var="s">
                                <td><c:forEach items="${s.attandances}" var="a">
                                    <c:if test="${a.student.id eq s.id}">
                                        <c:if test="${a.present}">
                                            <h3>P</h3>
                                        </c:if>
                                        <c:if test="${!a.present}">
                                            <h3>A</h3>
                                        </c:if>    
                                    </c:if>
                                </c:forEach>
                                </td>
                            </c:forEach>
                            <c:forEach var="s" begin="${requestScope.size + 1}" end="30" >
                                <th></th>
                            </c:forEach>
                        </tr>
                    </c:forEach>
                    </tr>

                </table>

            </form>
        </div>
    </body>
</html>
