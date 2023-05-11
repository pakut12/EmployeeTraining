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
                            <h1 class="m-1">จัดการข้อมูลหมวดย่อย</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">หน้าเเรก</a></li>
                                <li class="breadcrumb-item"><a href="#">ข้อมูล</a></li>
                                <li class="breadcrumb-item active">จัดการข้อมูลหมวดย่อย</li>
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
                    <div class="modal fade" id="modal_addtopicminor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">เพิ่มข้อมูลหมวดย่อย</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อหมวดย่อย</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="add_name">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="addtopicminor()">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="modal_edittopicminor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">เเก้ไขข้อมูลหมวดย่อย</h5>
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
                                        <label for="" class="form-label">ชื่อหมวดย่อย</label>
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
                            จัดการข้อมูลหมวดย่อย
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
            
                        function gettopicminor(){
                            $.ajax({
                                type:"post",
                                url:"Topicminor",
                                data:{
                                    type:"gettopicminor"
                                },
                                success:function(msg){
                                    console.log(msg)
                                    $("#mytable").html(msg)
                      
                                    var table = $('#table_topicminor').DataTable({
                           
                                    });
 
                                    // Order by the grouping
                       
                                }
                            })
                        }
            
                        function updatetopicmain(){
                            $.ajax({
                                type:"post",
                                url:"Topicminor",
                                data:{
                                    type:"updatetopicmainbyid",
                                    id:$("#edit_id").val(),
                                    name:$("#edit_name").val()
                     
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
                       
                                    $("#modal_edittopicminor").modal('hide');
                                    gettopicminor()
                                }
                            })
                        }
          
            
                        function gettopicmain(){
                            $.ajax({
                                type:"post",
                                url:"Topicmain",
                                data:{
                                    type:"getlisttopicmain"
                                },
                                success:function(msg){
                                    $("#add_topicmain").empty();
                                    $("#add_topicmain").html(msg);
                        
                                }
                            })
                        }
            

                        function deltopicminor(id){
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
                                        url:"Topicminor",
                                        data:{
                                            type:"deltopicminor",
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
                                            gettopicminor()
                                        }
                                    })
                                }
                            })
        
               
                        }

                        function addtopicminor(){
                            $.ajax({
                                type:"post",
                                url:"Topicminor",
                                data:{
                                    type:"addtopicminor",
                                    name:$("#add_name").val()
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
                                    $("#add_name").val("");
                                    $("#modal_addtopicminor").modal('hide');
                                    gettopicminor()
                                }
                            })
                        }
            
                        function edittopicminor(id){
                            $("#modal_edittopicminor").modal('show')
                
                            $.ajax({
                                type:"post",
                                url:"Topicminor",
                                data:{
                                    type:"gettopicmainbyid",
                                    id:id
                                },
                                success:function(msg){
                                    var js = JSON.parse(msg);
                                    console.log(msg);
                                    $("#edit_id").val(js.id);
                        
                                    $("#edit_name").val(js.name);
                       
                                }
                            })
                 
                        }
            
                        $(document).ready(function(){
                            $("#adddata").click(function (){
                                $("#add_name").val("")
                                $("#modal_addtopicminor").modal('show')
                                gettopicmain()
                            })
                            $("#listdata").addClass("menu-is-opening menu-open");
                            $("#pagedata").addClass("active");
                            $("#datatopic2").addClass("active");
                            gettopicminor()
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

