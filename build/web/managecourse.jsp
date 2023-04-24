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
                            <h1 class="m-1">จัดการข้อมูลหลักสูตร</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">หน้าเเรก</a></li>
                                <li class="breadcrumb-item"><a href="#">ข้อมูล</a></li>
                                <li class="breadcrumb-item active">จัดการข้อมูลหลักสูตร</li>
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
                    
                    <!-- Modal -->
                    <div class="modal fade" id="modal_addcourse" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">เพิ่มข้อมูลหลักสูตร</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อหลักสูตร</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="add_course">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="addcourse()">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="modal_editcourse" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">เเก้ไขข้อมูลหมวดย่อย</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    <div class="mb-3 ">
                                        <label for="" class="form-label">เลขที่</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="edit_id" disabled> 
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อหลักสูตร</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="edit_course">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="updatecourse()">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card">
                        <div class="card-header">
                            จัดการข้อมูลหลักสูตร
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
                        function updatecourse(){
                            
                            $.ajax({
                                type:"post",
                                url:"Course",
                                data:{
                                    type:"updatecourse",
                                    id:$("#edit_id").val(),
                                    name:$("#edit_course").val()
                                },
                                success:function(msg){
                        
                        
                                    if(msg == "true"){
                                        Swal.fire({
                                            icon:"success",
                                            title:"เเก้ไข",
                                            text:"เเก้ไขสำเร็จ"
                                        })
                                    }else{
                                        Swal.fire({
                                            icon:"error",
                                            title:"เเก้ไข",
                                            text:"เเก้ไขไม่สำเร็จ"
                                        })
                                    }
                                    getcourse()
                        
                                }
                            })
                        }
            
                        function delcourse(id){
                        
                            Swal.fire({
                                title: 'คุณต้องการลบใช่หรือไม่',
                                icon: 'warning',
                                showCancelButton: true,
                                confirmButtonColor: '#3085d6',
                                cancelButtonColor: '#d33',
                                confirmButtonText: 'ใช่',
                                cancelButtonText: 'ไม่ใช่'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    $.ajax({
                                        type:"post",
                                        url:"Course",
                                        data:{
                                            type:"delcourse",
                                            id:id
                                        },
                                        success:function(msg){
                                            if(msg == "true"){
                                                Swal.fire({
                                                    icon:"success",
                                                    title:"ลบ",
                                                    text:"ลบสำเร็จ"
                                                })
                                            }else{
                                                Swal.fire({
                                                    icon:"error",
                                                    title:"ลบ",
                                                    text:"ลบไม่สำเร็จ"
                                                })
                                            }
                                            getcourse()
                                        }
                                    })
                                }
                            })
                           
                        }
            
                        function editcourse(id){
                            $.ajax({
                                type:"post",
                                url:"Course",
                                data:{
                                    type:"getlistcoursebyid",
                                    id:id
                                },
                                success:function(msg){
                                    $("#modal_editcourse").modal('show')
                                    var js = JSON.parse(msg)
                                    $("#edit_id").val(js.id);
                                    $("#edit_course").val(js.name);
                                    console.log(js)
                                }
                            })
                        }
            
                        function getcourse(){
                            $.ajax({
                                type:"post",
                                url:"Course",
                                data:{
                                    type:"getcourse"
                                },
                                success:function(msg){
                       
                                    $("#mytable").html(msg)
                                    $("#table_course").DataTable();
                                }
                            })
                        }
            
                        function addcourse(){
                            $.ajax({
                                type:"post",
                                url:"Course",
                                data:{
                                    type:"addcourse",
                                    name:$("#add_course").val()
                                },
                                success:function(msg){
                                    if(msg == "true"){
                                        Swal.fire({
                                            icon:"success",
                                            title:"บันทึก",
                                            text:"บันทึกสำเร็จ"
                                        })
                                    }else{
                                        Swal.fire({
                                            icon:"error",
                                            title:"บันทึก",
                                            text:"บันทึกไม่สำเร็จ"
                                        })
                                    }
                       
                                    $("#modal_addcourse").modal('hide');
                                    getcourse()
                                }
                            })
                        }
            
        

            
                        $(document).ready(function(){
                            $("#adddata").click(function (){
                                $("#modal_addcourse").modal('show')
                 
                            })
                            $("#listdata").addClass("menu-is-opening menu-open");
                            $("#pagedata").addClass("active");
                            $("#datacourse").addClass("active");
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

