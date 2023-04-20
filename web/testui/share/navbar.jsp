<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="wrapper">

<!-- Preloader -->
<div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
</div>

<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="index3.html" class="nav-link">Home</a>
        </li>
        
    </ul>
    
    
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar elevation-4 sidebar-light-olive">
    <!-- Brand Logo -->
    <a href="index3.html" class="brand-link text-md">
        <img src="dist/img/AdminLTELogo.png" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text p-1 fw-bold text-success">EmployeeTraining</span>
    </a>
    
    <!-- Sidebar -->
    <div class="sidebar">
        
        <!-- Sidebar Menu -->
        <nav class="mt-3">
            <ul class="nav nav-pills nav-sidebar flex-column nav-child-indent nav-legacy" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                <li class="nav-item">
                    <a href="index.jsp" class="nav-link active">
                        <i class="nav-icon fas fa-home"></i>
                        <p>
                            หน้าเเรก
                        </p>
                    </a>
                </li>
                <li class="nav-item ">
                    <a href="#" class="nav-link ">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>
                            ข้อมูล
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="managetopic1.jsp" class="nav-link active">
                                <i class="far fa-circle nav-icon"></i>
                                <p>ข้อมูลหมวดหลัก</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="managetopic1.jsp" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>ข้อมูลหมวดย่อย</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="managetopic1.jsp" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>ข้อมูลหลักสูตร</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="./index3.html" class="nav-link">
                                <i class="far fa-circle nav-icon"></i>
                                <p>ข้อมูลกลุ่ม</p>
                            </a>
                        </li>
                    </ul>
                </li>
                
            </ul>
            
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>

