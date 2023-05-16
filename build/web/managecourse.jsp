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
                    <div class="modal fade" id="modal_addgroup"  aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                                        <label for="" class="form-label">ชื่อหมวดหลัก</label>
                                        <select class="form-control form-control-sm text-center " style="width: 100%" id="add_topicmain_id">
                                            
                                        </select>
                                        
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อหมวดย่อย</label>
                                        <select class="form-control form-control-sm text-center" id="add_topicminor_id" style="width: 100%">
                                            
                                        </select>
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อหลักสูตร</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="add_course_name" style="width: 100%">
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
                                    <h5 class="modal-title" id="exampleModalLabel">เเก้ไขข้อมูลหลักสูตร</h5>
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
                                        <input type="text" class="form-control form-control-sm text-center" id="edit_course_name" style="width: 100%">
                                        
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="updategroup()">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card card-success card-outline shadow-sm">
                        <div class="card-header">
                            จัดการข้อมูลหลักสูตร
                        </div>
                        <div class="card-body">
                            <div class="text-right mb-3">
                                <div class="btn-success btn btn-sm" id="adddata">เพิ่มข้อมูล</div>
                            </div>
                            <div class="" id="mytable">
                                
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <script>
                        
                        function editgroup(id){
                            $("#modal_editgroup").modal('show')
                            $.ajax({
                                type:"post",
                                url:"Group",
                                data:{
                                    type:"getgroupbyid",
                                    main_id:id
                                },
                                success:function(msg){
                                    var js = JSON.parse(msg)
                                  
                                    console.log(js)
                                    $("#edit_main_id").val(id);
                                    $("#edit_course_name").val(js.course_name)
                                   
                                    $.ajax({
                                        type:"post",
                                        url:"Group",
                                        data:{
                                            type:"gettopicmain"
                                        },
                                        success:function(msg){
                                            var s = "<option value='"+js.topicmain_id+"'>"+js.topicmain_name+"</option>";
                                            var text = msg.replace(s, "");
                                             
                                            $("#edit_topicmain_id").empty();
                                            $("#edit_topicmain_id").append("<option value='"+js.topicmain_id+"'>"+js.topicmain_name+"</option>");
                                            $("#edit_topicmain_id").append(text);
                                            $("#edit_topicmain_id").select2();
                                        }
                                    })
                                    $.ajax({
                                        type:"post",
                                        url:"Group",
                                        data:{
                                            type:"gettopicminor"
                                        },
                                        success:function(msg){
                                            var s = "<option value='"+js.topicminor_id+"'>"+js.topicminor_name+"</option>";
                                            var text = msg.replace(s, "");
                                           
                                            $("#edit_topicminor_id").empty();
                                            $("#edit_topicminor_id").append("<option value='"+js.topicminor_id+"'>"+js.topicminor_name+"</option>");
                                            $("#edit_topicminor_id").append(text);
                                            $("#edit_topicminor_id").select2();
                                        }
                                    })
                                    
                                }
                                
                            })
                        }
    
                        function updategroup(){
                            var main_id = $("#edit_main_id").val()
                            var topicmain_id = $("#edit_topicmain_id").val()
                            var topicminor_id = $("#edit_topicminor_id").val()
                            var course_name = $("#edit_course_name").val()

                            
                            $.ajax({
                                type:"post",
                                url:"Group",
                                data:{
                                    type:"updategroup",
                                    main_id:main_id,
                                    topicmain_id:topicmain_id,
                                    topicminor_id:topicminor_id,
                                    course_name:course_name
                                },
                                success:function(msg){
                                    if(msg == 'true'){
                                        Swal.fire({
                                            title:"เเก้ไข",
                                            icon:"success",
                                            text:"เเก้ไขสำเร็จ"
                                        })
                                    }else{
                                        Swal.fire({
                                            title:"เเก้ไข",
                                            icon:"error",
                                            text:"เเก้ไขไม่สำเร็จ"
                                        })
                                    }
                                    gettablegroup()
                                   
                                }
                            })
                             
                        }

                        function delgroup(id){
                        
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
                                        url:"Group",
                                        data:{
                                            type:"delgroup",
                                            main_id:id
                                        },
                                        success:function(msg){
                                    
                                            if(msg == 'true'){
                                                Swal.fire({
                                                    title:"ลบ",
                                                    icon:"success",
                                                    text:"ลบสำเร็จ"
                                                })
                                            }else{
                                                Swal.fire({
                                                    title:"ลบ",
                                                    icon:"error",
                                                    text:"ลบไม่สำเร็จ"
                                                })
                                            }
                                            gettablegroup()
                                   
                                        }
                                    })
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
                            $.ajax({
                                type:"post",
                                url:"Group",
                                data:{
                                    type:"gettopicminor"
                                },
                                success:function(msg){
                                    $("#add_topicminor_id").empty();
                               
                                    $("#add_topicminor_id").append(msg);
                                    $("#add_topicminor_id").select2();
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
                                    course_name:$("#add_course_name").val()
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
                                gettopicmain()
                                gettopicminor()
                                $("#add_course_name").val("");
                                $("#modal_addgroup").modal('show')
                            })
                            
                            $("#listdata").addClass("menu-is-opening menu-open");
                            $("#pagedata").addClass("active");
                            $("#datacourse").addClass("active");
                            
                        
                            gettablegroup()
                            
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



