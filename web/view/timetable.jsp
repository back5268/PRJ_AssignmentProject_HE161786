<%-- 
    Document   : timetable
    Created on : Oct 17, 2022, 8:42:14 AM
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
        }

        .container {
            height: 50%;
            width: 90%;
        }
    </style>

    <body>
        <div class="container">
            Lecturer: <input type="text" readonly="readonly" value="${requestScope.lecturer.name}"/>
            <table border="1px">
                <tr>
                    <td>
                        <form action="timetable" method="GET">
                            <input type="hidden" name="lid" value="${param.lid}"/>
                            Year: <select name="year">
                             <option value="${requestScope.year}"> <c:out value = "${requestScope.year}"/></option>
                            <c:forEach var="i" begin="${requestScope.year}" end="${requestScope.year + 3}" >
                                <option value="${i-2}"> <c:out value = "${i-2}"/></option>
                            </c:forEach>
                        </select> <br/>
                        Week:<select name="week">
                            <option value=${requestScope.daymonth}>${requestScope.daymonth}</option>
                            <c:forEach items="${requestScope.daymonths}" var="daymonth" >
                                <option value="${daymonth}">${daymonth}</option>
                            </c:forEach>
                        </select> 
                        <input type="submit" value="View"/>
                        </form> 
                    </td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>${d}<br/>${helper.getDayNameofWeek(d)}</td>
                        </c:forEach>
                </tr>
                <c:forEach items="${requestScope.slots}" var="slot">
                    <tr>
                        <td>Slot ${slot.id}: <br/> ${slot.description}</td>
                        <c:forEach items="${requestScope.dates}" var="d">
                            <td>
                                <c:forEach items="${requestScope.sessions}" var="ses">
                                    <c:if test="${helper.compare(ses.date,d) eq 0 and (ses.timeslot.id eq slot.id)}">
                                        <a href="att?id=${ses.id}">${ses.group.name}-${ses.group.subject.name}</a>
                                        <br/>
                                        ${ses.room.name}
                                        <br/> ${slot.description}
                                        <c:if test="${ses.attanded}">
                                            <img src="../img/male-icon.png" alt=""/>
                                        </c:if>
                                        <c:if test="${!ses.attanded}">
                                            <img src="../img/female-icon.png" alt=""/>
                                        </c:if>
                                    </c:if>

                                </c:forEach>
                            </td>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </body>
</html>
