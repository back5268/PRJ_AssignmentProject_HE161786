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
            width: 100%;
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

    </style>
    <body>
        <form action="reportatt" method="POST">
            <input type="hidden" name="gid" value="${param.gid}"/>
            <table border="1px">
                <tr>
                    <td>Roll Number</td>
                    <td>Full Name</td>
                    <td>Absent(%)</td>
                    <c:forEach items="${requestScope.atts}" var="i" >
                        <td> Slot </td>
                    </c:forEach>
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
    </body>
</html>
