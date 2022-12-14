<%-- 
    Document   : takeattandance
    Created on : Nov 2, 2022, 12:52:52 PM
    Author     : bacht
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="helper" class="util.DateTimeHelper"/>
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
            background-color: aliceblue;
        }

        .container {
            width: 95%;
            padding-left: 5%;
            padding-top: 32px;
            
        }

        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }

        table {
            margin-top: 32px;
        }

        .container tr {
            height: 80px;
        }

        .container tr td {
            width: 240px;
            text-align: center;
        }
    </style>

    <body>
        <div class="container" method="POST">
            <form action="takeattandance">
                Class: ${requestScope.ses.group.name} 
                <c:if test="${requestScope.ses.group.id == 1}">
                    <select name="id">
                        <option value="${requestScope.sesid}" >Session ${requestScope.ses.index}</option>
                        <c:forEach var="i" begin="1" end="5" >
                            <option value="${i}">Session ${i} </option>
                        </c:forEach>
                    </select>
                </c:if>
                <c:if test="${requestScope.ses.group.id == 2}">
                    <select name="id">
                        <option value="${requestScope.sesid}" >Session ${requestScope.ses.index}</option>
                        <c:forEach var="i" begin="1" end="5" >
                            <option value="${i+5}">Session ${i} </option>
                        </c:forEach>
                    </select>
                </c:if>
                <input type="submit" name="view" value="View">
                <br/>
                Subject: ${requestScope.ses.group.subject.name} <br/>
                Lecturer: ${requestScope.ses.lecturer.name} <br/>
                Room: ${requestScope.ses.room.name} <br/>
                Time: ${requestScope.ses.date} ${requestScope.ses.timeslot.description}
                <br/>
                Attended: ${requestScope.ses.attanded?"Yes":"No"}
            </form>
            <form action="takeattandance" method="POST">
                <input type="hidden" name="sesid" value="${param.id}"/>
                <table border="1px">
                    <tr>
                        <td>Student Id</td>
                        <td>Student Name</td>
                        <td>Present</td>
                        <td>Absent</td>
                        <td>Description</td>
                    </tr>
                    <c:forEach items="${requestScope.atts}" var="a">
                        <tr>
                            <td>${a.student.id}
                                <input type="hidden" value="${a.student.id}" name="stdid"/>
                            </td>
                            <td>${a.student.name}</td>
                            <td><input type="radio" 
                                       <c:if test="${a.present}">
                                           checked="checked" 
                                       </c:if>
                                       name="present${a.student.id}" value="present" /></td>
                            <td><input type="radio"
                                       <c:if test="${!a.present}">
                                           checked="checked" 
                                       </c:if>
                                       name="present${a.student.id}" value="absent" /></td>
                            <td><input type="" value="${a.description}" name="description${a.student.id}"></td>
                        </tr>  
                    </c:forEach>
                </table>
                <input type="submit" value="Save"/>
            </form>
        </div>
    </body>
</html>
