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
                            <h1 class="m-1">จัดการข้อมูลฝึกอบรม</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">หน้าเเรก</a></li>
                                <li class="breadcrumb-item"><a href="#">ฝึกอบรม</a></li>
                                <li class="breadcrumb-item active">จัดการข้อมูลฝึกอบรม</li>
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
                    <div class="modal fade" id="modal_addgroup"  aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">เพิ่มข้อมูลกลุ่ม</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="mb-3">
                                                <label for="" class="form-label">ชื่อหมวดหลัก</label>
                                                <select class="form-control form-control-sm text-center " style="width: 100%" id="add_topicmain_id">
                                                    
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="mb-3">
                                                <label for="" class="form-label">ชื่อหมวดย่อย</label>
                                                <select class="form-control form-control-sm text-center" id="add_topicminor_id" style="width: 100%">
                                                    
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="mb-3">
                                                <label for="" class="form-label">ชื่อหลักสูตร</label>
                                                <select class="form-control form-control-sm text-center" id="add_course_id" style="width: 100%">
                                                    
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="mb-3">
                                                <label for="" class="form-label">บริษัท</label>
                                                <input class="form-control form-control-sm text-center" type="text"> 
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="mb-3">
                                                <label for="" class="form-label">ปี</label>
                                                <input class="form-control form-control-sm text-center" type="text"> 
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="mb-3">
                                                <label for="" class="form-label">สถาบันที่จัดอบรม</label>
                                                <input class="form-control form-control-sm text-center" type="text"> 
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="text-right col-form-label ">รายชื่อพนักงาน</div>
                                        </div>
                                        <div class="col-4">
                                            <div class="text-center">
                                                <input class="form-control form-control-sm text-center" type="text"> 
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="text-left">
                                                <button class="btn btn-success btn-sm" type="button">Add</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-12">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                        <th></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="addgroup()">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="modal_editgroup"  aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                        <input class="form-control form-control-sm text-center" id="edit_main_id" disabled>
                                        
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อหมวดหลัก</label>
                                        <select class="form-control form-control-sm text-center " style="width: 100%" id="edit_topicmain_id">
                                            
                                        </select>
                                        
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อหมวดย่อย</label>
                                        <select class="form-control form-control-sm text-center" id="edit_topicminor_id" style="width: 100%">
                                            
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อหลักสูตร</label>
                                        <select class="form-control form-control-sm text-center" id="edit_course_id" style="width: 100%">
                                            
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="updategroup()">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card">
                        <div class="card-header">
                            จัดการข้อมูลฝึกอบรม
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
                            var topicmain_id = $("#add_topicmain_id").val(); 
                            var topicminor_id = $("#add_topicminor_id").val(); 
                        
                            console.log(topicmain_id)
                            console.log(topicminor_id)
        
                            $.ajax({
                                type:"post",
                                url:"Training",
                                data:{
                                    type:"getcoursebytopicminor_id",
                                    topicmain_id:topicmain_id,
                                    topicminor_id:topicminor_id
                                },
                                success:function(msg){
                                  
                                    $("#add_course_id").empty();
                                    $("#add_course_id").append(msg);
                                    $("#add_course_id").select2();
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
                                    $("#add_topicmain_id").empty();
                                  
                                    $("#add_topicmain_id").append(msg);
                                    $("#add_topicmain_id").select2();
                                }
                            })
                
                        }	
                        
                        function gettopicminor(){
                            var topicmain_id = $("#add_topicmain_id").val();               
        
                            $.ajax({
                                type:"post",
                                url:"Training",
                                data:{
                                    type:"gettopicminorbytopicmain_id",
                                    topicmain_id:topicmain_id
                                },
                                success:function(msg){
                                    
                                    $("#add_topicminor_id").empty();
                                    $("#add_topicminor_id").append(msg);
                                    $("#add_topicminor_id").select2();
                                    getcourse()
                                }
                            })
                        }	
                        
                        function gettablegroup(){
                            $.ajax({
                                type:"post",
                                url:"Group",
                                data:{
                                    type:"gettablegroup"
                                },
                                success:function(msg){
                                    $("#mytable").empty();
                                    $("#mytable").html(msg);
                                    $("#table_group").DataTable();
                                }
                            })
                        }

                        function addgroup(){
                            $.ajax({
                                type:"post",
                                url:"Group",
                                data:{
                                    type:"addgroup",
                                    topicmain_id :$("#add_topicmain_id").val(),
                                    topicminor_id :$("#add_topicminor_id").val(),
                                    course_id:$("#add_course_id").val()
                                },
                                success:function(msg){
                                    if(msg == 'true'){
                                        Swal.fire({
                                            title:"บันทึก",
                                            icon:"success",
                                            text:"บันทึกสำเร็จ"
                                        })
                                    }else{
                                        Swal.fire({
                                            title:"บันทึก",
                                            icon:"error",
                                            text:"บันทึกไม่สำเร็จ"
                                        })
                                    }
                                    
                                    $("#modal_addgroup").modal("hide");
                                    gettablegroup()
                                }
                            })
                        }

                        $(document).ready(function(){
                            $("#adddata").click(function (){
                                $("#modal_addgroup").modal('show')
                            })
                            
                            $("#listdata").addClass("menu-is-opening menu-open");
                            $("#pagedata").addClass("active");
                            $("#datamain").addClass("active");
                            
                            gettopicmain()
                            
                            
                            gettablegroup()
                            
                            $("#add_topicmain_id").on('input', function() {
                                gettopicminor()
                            });
                            
    
                            $("#add_topicminor_id").on('input', function() {
                           
                                getcourse()
                            });
    
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



