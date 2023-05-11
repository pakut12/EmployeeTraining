<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="wrapper">

<!-- Preloader -->
<div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="img/logo.png" alt="AdminLTELogo" height="100" width="100">
</div>

<!-- Navbar -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
    <!-- Left navbar links -->
    <ul class="navbar-nav">
        <li class="nav-item">
            <a class="nav-link" data-widget="pushmenu" href="#" role="button"><i class="fas fa-bars"></i></a>
        </li>
        <li class="nav-item d-none d-sm-inline-block">
            <a href="index.jsp" class="nav-link">หน้าเเรก</a>
        </li>
        
    </ul>
    
    
</nav>
<!-- /.navbar -->

<!-- Main Sidebar Container -->
<aside class="main-sidebar elevation-4 sidebar-light-olive">
    <!-- Brand Logo -->
    
    <a href="index.jsp" class="brand-link text-md">
        <img src="img/logo.png" alt="AdminLTE Logo" class="brand-image  img-fluid m-0" >
        <span class="brand-text p-1 fw-bold " style="color:#3d9970" >EmployeeTraining</span>
    </a>
    <!-- Sidebar -->
    <div class="sidebar">
        
        <!-- Sidebar Menu -->
        <nav class="mt-3">
            <ul class="nav nav-pills nav-sidebar flex-column  nav-flat nav-legacy" data-widget="treeview" role="menu" data-accordion="false">
                <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
                <li class="nav-item">
                    <a href="index.jsp" class="nav-link " id="pagehome">
                        <i class="nav-icon fas fa-home"></i>
                        <p>
                            หน้าเเรก
                        </p>
                    </a>
                </li>
                <li class="nav-item " id="listdata">
                    <a href="#" class="nav-link " id="pagedata">
                        <i class="nav-icon fas fa-database"></i>
                        <p>
                            ข้อมูล
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="managetopic1.jsp" class="nav-link " id="datatopic1">
                                <i class="far fa-circle nav-icon"></i>
                                <p>ข้อมูลหมวดหลัก</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="managetopic2.jsp" class="nav-link" id="datatopic2">
                                <i class="far fa-circle nav-icon"></i>
                                <p>ข้อมูลหมวดย่อย</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="managecourse.jsp" class="nav-link"  id="datacourse">
                                <i class="far fa-circle nav-icon"></i>
                                <p>ข้อมูลหลักสูตร</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="manageaddress.jsp" class="nav-link"  id="dataaddress">
                                <i class="far fa-circle nav-icon"></i>
                                <p>ข้อมูลสถานที่จัดอบรม</p>
                            </a>
                        </li>
                        
                    </ul>
                </li>
                <li class="nav-item " id="listtraining">
                    <a href="#" class="nav-link " id="pagetraining">
                        <i class="nav-icon fas fa-running"></i>
                        <p>
                            ฝึกอบรม
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="managetraining.jsp" class="nav-link" id="datatraining">
                                <i class="far fa-circle nav-icon"></i>
                                <p>ข้อมูลฝึกอบรม</p>
                            </a>
                        </li>
                         <li class="nav-item">
                            <a href="managegauge.jsp" class="nav-link" id="datagauge">
                                <i class="far fa-circle nav-icon"></i>
                                <p>ประเมินผลผู้เข้าอบรม</p>
                            </a>
                        </li>
                    </ul>
                </li>
                <li class="nav-item " id="listreport">
                    <a href="#" class="nav-link " id="pagereport">
                        <i class="nav-icon fas fa fa-file"></i>
                        <p>
                            รายงาน
                            <i class="right fas fa-angle-left"></i>
                        </p>
                    </a>
                    <ul class="nav nav-treeview">
                        <li class="nav-item">
                            <a href="managereport.jsp" class="nav-link " id="datareport">
                                <i class="far fa-circle nav-icon"></i>
                                <p class="">แสดงการฝึกอบรมตามหลักสูตร</p>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="managereport.jsp" class="nav-link " id="datareport">
                                <i class="far fa-circle nav-icon"></i>
                                <p class="">แสดงการฝึกอบรมตามรหัสพนักงาน</p>
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

