<%-- 
    Document   : test.jsp
    Created on : 10 พ.ค. 2566, 15:21:38
    Author     : pakutsing
--%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Calendar cal1 = Calendar.getInstance();
            Calendar cal2 = Calendar.getInstance();

            cal1.set(1991, 4, 18); // August 1st, 2000

            cal2.set(2023, 5, 10); // May 10th, 2023

            Date date1 = cal1.getTime();
            Date date2 = cal2.getTime();

            int years = cal2.get(Calendar.YEAR) - cal1.get(Calendar.YEAR);
            int months = cal2.get(Calendar.MONTH) - cal1.get(Calendar.MONTH);

            if (months < 0) {
                years--;
                months += 12;
            }

            out.print(years + " years " + (months-1) + " months");



        %>
    </body>
</html>
