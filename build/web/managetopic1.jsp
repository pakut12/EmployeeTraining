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
                            <h1 class="m-1">จัดการข้อมูลหมวดหลัก</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">หน้าเเรก</a></li>
                                <li class="breadcrumb-item"><a href="#">ข้อมูล</a></li>
                                <li class="breadcrumb-item active">จัดการข้อมูลหมวดหลัก</li>
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
                    
                    <div class="modal fade" id="modal_addtopicmain" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">เพิ่มข้อมูลหมวดหลัก</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    <form id="formadd">
                                        <div class="mb-3">
                                            <label for="" class="form-label">ชื่อหมวดหลัก</label>
                                            <input type="text" class="form-control form-control-sm text-center" id="add_name" required>
                                        </div>
                                    </form>
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
                                    <h5 class="modal-title" id="exampleModalLabel">เเก้ไขข้อมูลหมวดหลัก</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    <form id="formedit">
                                        <div class="mb-3">
                                            <label for="" class="form-label">เลขที่</label>
                                            <input type="text" class="form-control form-control-sm text-center" id="edit_id" disabled> 
                                        </div>
                                        <div class="mb-3">
                                            <label for="" class="form-label">ชื่อหมวดหลัก</label>
                                            <input type="text" class="form-control form-control-sm text-center" id="edit_name">
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="updatetopicmain()">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card card-success card-outline shadow-sm">
                        <div class="card-header">
                            จัดการข้อมูลหมวดหลัก
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
            
                        function deltopicmain(id){
                            $.ajax({
                                type:"post",
                                url:"Topicminor",
                                data:{
                                    type:"deltopicminor"
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
                                    gettopicmain();
                                }
                            })
                        }
            
                        function gettopicmain(){
                            $.ajax({
                                type:"post",
                                url:"Topicmain",
                                data:{
                                    type:"gettopicmain"
                                },
                                success:function(msg){
                       
                                    $("#mytable").html(msg)
                                    $("#table_topicmain").DataTable({
                                       
                                    });
                                }
                            })
                        }
            
    
                        function addtopicmain(){
                            $("#formadd").addClass("was-validated")
         
                            empty = $('form#formadd').find("input").filter(function() {
                                return this.value === "";
                            });
                            
                            if(!empty.length) {
                                $.ajax({
                                    type:"post",
                                    url:"Topicmain",
                                    data:{
                                        type:"addtopicmain",
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
                                        $("#modal_addtopicmain").modal('hide');
                                        gettopicmain();
                                    }
                                })
                            }else{
                                Swal.fire({
                                    icon:"error",
                                    title:"บันทึก",
                                    text:"กรุณากรอกข้อมูลให้ครบ"
                                })
                            }
                        }
            
                        function edittopicmain(id){
                            $("#modal_edittopicmain").modal('show')
                            $.ajax({
                                type:"post",
                                url:"Topicmain",
                                data:{
                                    type:"gettopicmainbyid",
                                    id:id
                                },
                                success:function(msg){
                                    var js = JSON.parse(msg);
                                    $("#edit_name").val(js.name);
                                    $("#edit_id").val(js.id);
                       
                                }
                            })
        
                        }
            
                        function updatetopicmain(){
                            $("#formedit").addClass("was-validated")
         
                            empty = $('form#formedit').find("input").filter(function() {
                                return this.value === "";
                            });
                            
                            if(!empty.length) {      
                                $.ajax({
                                    type:"post",
                                    url:"Topicmain",
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
                       
                                        $("#modal_edittopicmain").modal('hide');
                                        gettopicmain();
                                    }
                                })
                            }else{
                                Swal.fire({
                                    icon:"error",
                                    title:"บันทึก",
                                    text:"กรุณากรอกข้อมูลให้ครบ"
                                })

                            }
                        }
                        function deltopicmain(id){
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
                                        url:"Topicmain",
                                        data:{
                                            type:"deltopicmain",
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
                                            gettopicmain()
                                        }
                                    })
                                }
                            })
        
               
                        }
            
            
                        $(document).ready(function(){
                            $("#adddata").click(function (){
                                $("#formadd").removeClass("was-validated")
                                $("#add_name").val("")
                                $("#modal_addtopicmain").modal('show')
                            })
                            
                            $("#listdata").addClass("menu-is-opening menu-open");
                            $("#pagedata").addClass("active");
                            $("#datatopic1").addClass("active");
                            gettopicmain();
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

