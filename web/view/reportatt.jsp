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
            background-color: aliceblue;
        }

        .container {
            padding-left: 32px;
            padding-top: 32px;
            
        }

        table, tr, th, td {
            border: 1px solid black;
            border-collapse: collapse;
            height: 64px;
            min-width: 116px;
            align-items: center;
            text-align: center;
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
                Subject: ${requestScope.group.subject.name} <br/>
                Room: <c:forEach items="${requestScope.sess}" begin="0" end="0" var="s">
                    ${s.room.name}
                </c:forEach> <br/>
                Lecturer: ${requestScope.group.lecturer.name} <br/> <br/>

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
                            <c:forEach items="${requestScope.group.sessions}" var="grs">
                                <c:forEach items="${ grs.attandances}" var="x">
                                    <c:if test="${s.id eq x.student.id}">
                                        <c:if test="${x.present}">
                                            <th style="color: blue">P</th>
                                            </c:if>
                                            <c:if test="${!x.present}">
                                            <th style="color: red">A</th>
                                            </c:if>
                                        </c:if>
                                    </c:forEach>
                                </c:forEach>
                                <c:forEach var="s" begin="${requestScope.size + 1}" end="30" >
                                <td></td>
                            </c:forEach>

                        </tr>
                    </c:forEach>
                    </tr>

                </table>

            </form>
        </div>
    </body>
</html>
