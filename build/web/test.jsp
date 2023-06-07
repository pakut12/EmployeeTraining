<%-- 
    Document   : test
    Created on : 25 พ.ค. 2566, 9:55:57
    Author     : pakutsing
--%>
<%@page import="java.util.*" %>
<%@page import="com.pg.lib.model.*" %>
<%@page import="com.pg.lib.service.GroupService" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@ include file="share/header.jsp" %>
    </head>
    <body>
        <form id="myform" > 
            <div class="row">
                <div class="col-6">
                    <label>User</label>
                    <input class="form-control form-control" type="text" id="username" name="username">
                </div>
                <div class="col-6">
                    <label>Pass</label>
                    <input class="form-control form-control" type="text" id="password" name=" ">
                </div>
            </div>
            
            <button id="submit" type="submit">OK</button>
        </form>
        
        <script>
            
            $('#myform').validate();
            
            /*
            $('#myform').submit(function (e) {
                console.log($('#form').serialize())
                
              
                
               
            });
            */
        </script>
    </body>
</html>
