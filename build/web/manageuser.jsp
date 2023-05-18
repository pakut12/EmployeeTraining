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
                            <h1 class="m-1">จัดการข้อมูลผู้ใช้</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">หน้าเเรก</a></li>
                                <li class="breadcrumb-item"><a href="#">ข้อมูล</a></li>
                                <li class="breadcrumb-item active">จัดการข้อมูลผู้ใช้</li>
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
                    
                    <div class="modal fade" id="modal_adduser" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">เพิ่มข้อมูลผู้ใช้</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อผู้ใช้</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="add_user">
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">รหัสผ่าน</label>
                                        <input type="password" class="form-control form-control-sm text-center" id="add_pass">
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อ</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="add_name">
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">สถานะ</label>
                                        
                                        <select class="form-control form-control-sm text-center" id="add_status">
                                            <option value="admin">Admin</option>
                                            <option value="user">User</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="adduser()">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="modal_edituser" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">เเก้ไขข้อมูลหมวดหลัก</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    <input type="hidden" class="form-control form-control-sm text-center" id="edit_id">
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อผู้ใช้</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="edit_user">
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">รหัสผ่าน</label>
                                        <input type="password" class="form-control form-control-sm text-center" id="edit_pass">
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อ</label>
                                        <input type="text" class="form-control form-control-sm text-center" id="edit_name">
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">สถานะ</label>
                                        
                                        <select class="form-control form-control-sm text-center" id="edit_status">
                                            
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="updateuser()">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card card-success card-outline shadow-sm">
                        <div class="card-header">
                            จัดการข้อมูลผู้ใช้
                        </div>
                        <div class="card-body">
                            <div class="text-right mb-3">
                                <div class="btn-success btn btn-sm" id="adddata">เพิ่มข้อมูล</div>
                            </div>
                            
                            <div class="" id="mytable">
                                <table class="table text-nowrap text-center table-bordered table-sm w-100" id="table_user" >
                                    <thead>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                        <th></th>
                                    </thead>
                                </table>
                            </div>
                            
                        </div>
                    </div>
                    
                    
                    
                    <script>
            
                        function del_user(id){
                            $.ajax({
                                type:"post",
                                url:"User",
                                data:{
                                    type:"deluser",
                                    user_id:id
                                },
                                success:function(msg){
                                    if(msg == 'true'){
                                        Swal.fire({
                                            title:"บันทึก",
                                            icon:"success",
                                            text:"ลบสำเร็จ"
                                        })
                                    }else if(msg == 'false'){
                                        Swal.fire({
                                            title:"บันทึก",
                                            icon:"error",
                                            text:"ลบไม่สำเร็จ"
                                        })
                                    }
                                    gettableuser()
                                }
                            })
                        }
    

                        function updateuser(){
                            $.ajax({
                                type:"post",
                                url:"User",
                                data:{
                                    type:"updateuser",
                                    user_id:$("#edit_id").val(),
                                    user_name:$("#edit_name").val(),
                                    user_user:$("#edit_user").val(),
                                    user_pass:$("#edit_pass").val(),
                                    user_status:$("#edit_status").val()
                                },
                                success:function(msg){
                                    if(msg == 'true'){
                                        Swal.fire({
                                            title:"เเก้ไข",
                                            icon:"success",
                                            text:"เเก้ไขสำเร็จ"
                                        })
                                    }else if(msg == 'false'){
                                        Swal.fire({
                                            title:"เเก้ไข",
                                            icon:"error",
                                            text:"เเก้ไขไม่สำเร็จ"
                                        })
                                    }
                                    $("#modal_edituser").modal("hide")
                                    gettableuser()
                                }
                            })
                        }

                        function edit_user(id){
                            $("#modal_edituser").modal('show')
                            
                            $.ajax({
                                type:"post",
                                url:"User",
                                data:{
                                    type:"getlistuserbyid",
                                    user_id:id
                                },
                                success:function(msg){
                                    let js = JSON.parse(msg);
                                    
                                    $("#edit_id").val(js.user_id)
                                    $("#edit_user").val(js.user_user)
                                    $("#edit_pass").val(js.user_pass)
                                    $("#edit_name").val(js.user_name)
                                    
                                    $("#edit_status").empty();
                                    $("#edit_status").html(js.user_status);
                                    $("#modal_edituser").modal('hide')
                                }
                            })
                        }
    
                        function adduser(){
                            $.ajax({
                                type:"post",
                                url:"User",
                                data:{
                                    type:"adduser",
                                    user_user:$("#add_user").val(),
                                    user_pass:$("#add_pass").val(),
                                    user_name:$("#add_name").val(),
                                    user_status:$("#add_status").val()
                                },
                                success:function(msg){
                                    if(msg == 'true'){
                                        Swal.fire({
                                            title:"บันทึก",
                                            icon:"success",
                                            text:"บันทึกสำเร็จ"
                                        })
                                    }else if(msg == 'false'){
                                        Swal.fire({
                                            title:"บันทึก",
                                            icon:"error",
                                            text:"บันทึกไม่สำเร็จ"
                                        })
                                    }
                                    $("#modal_adduser").modal('hide')
                                    gettableuser()
                                }
                            })
                        }
                        
                        function gettableuser(){
                        
                            var table = $("#table_user").DataTable({
                                serverSide: true,
                                ajax: {
                                    type:"post",
                                    url:"User",
                                    data:{
                                        type:"getlistuser" 
                                    },
                                    dataSrc:function(json){
                                        var data = JSON.parse(json.data)
                                        console.log(data)
                                        var arr = []
                                        
                                        $.each(data,function(k,v){
                                          
                                            let status = "";
                                            if(v.user_status == "ADMIN"){
                                                status = '<span class="badge badge-pill badge-success ">'+v.user_status+'</span>'
                                            }else if(v.user_status == "USER"){
                                                status = '<span class="badge badge-pill badge-primary ">'+v.user_status+'</span>'
                                            }
                                            
                                                var result = {
                                                    user_id  :   v.user_id,
                                                    user_user :  v.user_user,
                                                    user_pass :  v.user_pass,
                                                    user_name :  v.user_name,
                                                    user_status :  status,
                                                    btn_edit : '<button class="btn btn-warning btn-sm" type="button" onclick="edit_user('+v.user_id+')" id="bt_edit">เเก้ไข</button>',
                                                    btn_del : '<button class="btn btn-danger btn-sm" type="button" onclick="del_user('+v.user_id+')" id="bt_del">ลบ</button>'
                                                }
                                                arr.push(result);
                             
                                            })
                                            return arr
                                        }
                                    },
                                    columns: [
                                        { 
                                            title: 'เลขที่',
                                            data: "user_id"
                                        },
                                        { 
                                            title: 'ชื่อผู้ใช้',
                                            data: "user_user"
                                        },
                                        { 
                                            title: 'ตำเเหน่ง',
                                            data: "user_status"
                                        },
                                        { 
                                            title: 'เเก้ไข', 
                                            data: "btn_edit"
                                        },
                                        { 
                                            title: 'ลบ', 
                                            data: "btn_del"
                                        }
                                    
                                    ],
                                    scrollCollapse: true,
                                    scrollX:true, 
                                    bDestroy: true
                                  
                                })

                            }


                            $(document).ready(function(){
                                $("#adddata").click(function (){
                                    $("#add_user").val("")
                                    $("#add_pass").val("")
                                    $("#add_name").val("")
                                    $("#modal_adduser").modal('show')
                                })
                                gettableuser()
                                $("#listuser").addClass("menu-is-opening menu-open");
                                $("#pageuser").addClass("active");
                                $("#datauser").addClass("active");
                            
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

