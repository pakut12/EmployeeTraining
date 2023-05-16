<%-- 
    Document   : index
    Created on : 20 เม.ย. 2566, 8:27:08
    Author     : pakutsing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <%@ include file="share/header.jsp" %>
        
    </head>
    
    <body class="hold-transition login-page animate__animated animate__bounce">
        <div class="login-box">
            
            <div class="card card-outline card-success">
                <div class="card-header text-center">
                    <div class="h3 text-uppercase text-success">Employee &nbsp;Training</div>
                </div>
                <div class="card-body">
                    <p class="login-box-msg"><i class='fas fa-user-tie' style='font-size:80px'></i></p>
                    <form action="Chkauthen" method="post">
                        <input type="hidden" id="type" name="type" value="login">
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1">   <span class="fas fa-user"></span></span>
                            </div>
                            <input type="text" class="form-control text-center" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" id="username" name="username">
                        </div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="basic-addon1">   <span class="fas fa-lock"></span></span>
                            </div>
                            <input type="password" class="form-control text-center" placeholder="Password" aria-label="Password" aria-describedby="basic-addon1" id="password" name="password">
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <button type="submit" class="btn btn-success btn-block">Login</button>
                            </div>
                            
                        </div>
                    </form>
                    
                    
                    
                </div>
                
            </div>
            
        </div>
        <script>
            $(document).ready(function(){
                $("#pagehome").addClass("active");
                $("#pagedata").addClass("active");
                $("#listdata").addClass("menu-is-opening menu-open");
                
            })
        </script>
        
        
    </body>
    
    
    </body>
</html>
