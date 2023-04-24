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
    
    <body class="sidebar-mini layout-fixed text-sm layout-navbar-fixed accent-olive">
        <%@ include file="share/navbar.jsp" %>
        
        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <div class="container-fluid">
                    <div class="row mb-2">
                        <div class="col-sm-6">
                            <h1 class="m-1">จัดการข้อมูลกลุ่ม</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">หน้าเเรก</a></li>
                                <li class="breadcrumb-item"><a href="#">ข้อมูล</a></li>
                                <li class="breadcrumb-item active">จัดการข้อมูลกลุ่ม</li>
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
                  
                    
                    <!-- Modal -->
                    <div class="modal fade" id="modal_addtopicmain"  aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">เพิ่มข้อมูลกลุ่ม</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อหมวดหลัก</label>
                                        <select class="form-control form-control-sm text-center " style="width: 100%" id="topicmain_id">
                                            
                                        </select>
                                        
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อหมวดย่อย</label>
                                        <select class="form-control form-control-sm text-center" id="topicminor_id" style="width: 100%">
                                            
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อหลักสูตร</label>
                                        <select class="form-control form-control-sm text-center" id="course_id" style="width: 100%">
                                            
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="addtopicmain()">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="modal_edittopicmain" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">เเก้ไขข้อมูลจัดกลุ่ม</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    <div class="mb-3">
                                        <label for="" class="form-label">เลขที่</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="edit_id" disabled> 
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อหมวดหลัก</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="edit_name">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="updatetopicmain()">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card">
                        <div class="card-header">
                            จัดการข้อมูลกลุ่ม
                        </div>
                        <div class="card-body">
                            <div class="text-right mb-3">
                                <div class="btn-success btn" id="adddata">เพิ่มข้อมูล</div>
                            </div>
                            <div class="" id="mytable">
                                
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <script>
                        function getcourse(){
                            $.ajax({
                                type:"post",
                                url:"Group",
                                data:{
                                    type:"getcourse"
                                },
                                success:function(msg){
                                    $("#course_id").empty();
                                    $("#course_id").append(msg);
                                    $("#course_id").select2(
                                       
                                );
                                }
                            })
                        }
                        function gettopicmain(){
                            $.ajax({
                                type:"post",
                                url:"Group",
                                data:{
                                    type:"gettopicmain"
                                },
                                success:function(msg){
                                    $("#topicmain_id").empty();
                                    $("#topicmain_id").append(msg);
                                    $("#topicmain_id").select2(
                                       
                                );
                                }
                            })
                
                        }	
                        function gettopicminor(){
                            $.ajax({
                                type:"post",
                                url:"Group",
                                data:{
                                    type:"gettopicminor"
                                },
                                success:function(msg){
                                    $("#topicminor_id").empty();
                                    $("#topicminor_id").append(msg);
                                    $("#topicminor_id").select2();
                                }
                            })
                        }	
                        

                        function addgroup (){
                            $.ajax({
                                type:"post",
                                url:"Group",
                                data:{
                                    type:"addgroup"
                                },
                                success:function(msg){
                                    $("#topicminor_id").empty();
                                    $("#topicminor_id").append(msg);
                                    $("#topicminor_id").select2();
                                }
                            })
                        }

                        $(document).ready(function(){
                            $("#adddata").click(function (){
                                $("#modal_addtopicmain").modal('show')
                            })
                            
                            $("#listdata").addClass("menu-is-opening menu-open");
                            $("#pagedata").addClass("active");
                            $("#datamain").addClass("active");
                            
                            gettopicmain()
                            gettopicminor()
                            getcourse()
                            
                        })
                    </script>
                </div><!-- /.container-fluid -->
            </section>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->
       <%@ include file="share/footer.jsp" %>
    </body>
</html>



