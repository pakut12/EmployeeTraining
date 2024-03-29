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
    
    <body class="sidebar-mini layout-fixed text-sm layout-navbar-fixed accent-olive ">
        <%@ include file="share/navbar.jsp" %>
        
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-1">หน้าเเรก</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">หน้าเเรก</a></li>
                                
                            </ol>
                        </div><!-- /.col -->
                    </div><!-- /.row -->
                </div><!-- /.container-fluid -->
            </div>
            <!-- /.content-header -->

    <!-- Main content -->
            <section class="content">
                <div class="container-fluid">
                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                        <div class="col-12">
                            <div class="card card-success card-outline shadow-sm">
                                <div class="card-header">
                                    <h3 class="card-title">คู่มือระบบฝึกอบรมพนักงาน</h3>
                                </div>
                                <div class="card-body">
                                    <div class="overflow-hidden" style="height:70vh">
                                        <iframe src="manual.pdf" style="width:100%; height:100%;" frameborder="1"></iframe>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div><!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
        <script>
            $(document).ready(function(){
                $("#pagehome").addClass("active");
                $("#pagedata").addClass("active");
                $("#listdata").addClass("menu-is-opening menu-open");
                
            })
        </script>
        <!-- /.content-wrapper -->
       <%@ include file="share/footer.jsp" %>
    </body>
</html>
