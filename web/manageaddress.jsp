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
                            <h1 class="m-1">จัดการข้อมูลสถานที่จัดอบรม</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">หน้าเเรก</a></li>
                                <li class="breadcrumb-item"><a href="#">ข้อมูล</a></li>
                                <li class="breadcrumb-item active">จัดการข้อมูลสถานที่จัดอบรม</li>
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
                    <div class="modal fade" id="modal_addaddress"  aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">เพิ่มข้อมูลสถานที่จัดอบรม</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อสถานที่</label>
                                        <input type="text" class="form-control form-control-sm text-center " style="width: 100%" id="add_addressname">
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">ที่อยู่</label>
                                        <textarea type="text" class="form-control  form-control-sm " id="add_address" rows="4" cols="50" style="width: 100%"> 
                                        
                                        </textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="addaddress()">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="modal_editaddress"  aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">เเก้ไขข้อมูลสถานที่จัดอบรม</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    <div class="mb-3">
                                        <label for="" class="form-label">เลขที่</label>
                                        <input type="text" class="form-control form-control-sm text-center " style="width: 100%" id="edit_addressid" disabled>
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">ชื่อสถานที่</label>
                                        <input type="text" class="form-control form-control-sm text-center " style="width: 100%" id="edit_addressname">
                                    </div>
                                    <div class="mb-3">
                                        <label for="" class="form-label">ที่อยู่</label>
                                        <textarea type="text" class="form-control  form-control-sm " id="edit_address" rows="4" cols="50" style="width: 100%"> 
                                        
                                        </textarea>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="updateaddress()">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card card-success card-outline shadow-sm">
                        <div class="card-header ">
                            จัดการข้อมูลหลักสูตร
                        </div>
                        <div class="card-body">
                            <div class="text-right mb-3">
                                <div class="btn-success btn btn-sm" id="adddata">เพิ่มข้อมูล</div>
                            </div>
                            <div class="" id="mytable">
                                <table class="table text-nowrap text-center table-bordered table-sm w-100" id="table_address" >
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
                        
                        function addaddress(){
                            var add_addressname = $("#add_addressname").val();
                            var add_address = $("#add_address").val();
                            
                            $.ajax({
                                type:"post",
                                url:"Address",
                                data:{
                                    type:"addaddress",
                                    address_name:add_addressname,
                                    address_address:add_address
                                },
                                success:function(msg){
                                    if(msg == "true"){
                                        Swal.fire({
                                            title:"บันทึก",
                                            icon:"success",
                                            text:"บันทึกสำเร็จ"
                                        })
                                    }else if(msg == "false"){
                                        Swal.fire({
                                            title:"บันทึก",
                                            icon:"error",
                                            text:"บันทึกไม่สำเร็จ"
                                        })
                                    }
                                    $("#modal_addaddress").modal('hide');
                                    gettableaddress()
                                }
                            })
                            
                        }
                        
                        function updateaddress(){
                            let id = $("#edit_addressid").val();
                            let name = $("#edit_addressname").val();
                            let address = $("#edit_address").val();
                            
                            $.ajax({
                                type:"post",
                                url:"Address",
                                data:{
                                    type:"updateaddressbyid",
                                    address_id:id,
                                    address_name:name,
                                    address_address:address
                                },
                                success:function(msg){
                                    if(msg == "true"){
                                        Swal.fire({
                                            title:"เเก้ไข",
                                            icon:"success",
                                            text:"เเก้ไขสำเร็จ"
                                        })
                                    }else if(msg == "false"){
                                        Swal.fire({
                                            title:"เเก้ไข",
                                            icon:"error",
                                            text:"เเก้ไขไม่สำเร็จ"
                                        })
                                    }
                                    $("#modal_editaddress").modal("hide")
                                }
                            })
                            
                        }
                        
                        function edit_address(id){
                        
                            $("#modal_editaddress").modal('show');
                        
                            $.ajax({
                                type:"post",
                                url:"Address",
                                data:{
                                    type:"getaddressbyid",
                                    address_id:id
                                },
                                success:function(msg){
                                    let js = JSON.parse(msg);
                                    $("#edit_addressid").val(js.address_id)
                                    $("#edit_addressname").val(js.address_name)
                                    $("#edit_address").val(js.address_address)
                                   
                                }
                            })
                            
                        }

                        function del_address(id){
                           
                            $.ajax({
                                type:"post",
                                url:"Address",
                                data:{
                                    type:"deladdress",
                                    address_id:id
                                },
                                success:function(msg){
                                    if(msg == "true"){
                                        Swal.fire({
                                            title:"ลบ",
                                            icon:"success",
                                            text:"ลบสำเร็จ"
                                        })
                                    }else if(msg == "false"){
                                        Swal.fire({
                                            title:"ลบ",
                                            icon:"error",
                                            text:"ลบไม่สำเร็จ"
                                        })
                                    }
                                    
                                    gettableaddress()
                                }
                            })
                            
                        }

                        function gettableaddress(){
                        
                            var table = $("#table_address").DataTable({
                                serverSide: true,
                                ajax: {
                                    type:"post",
                                    url:"Address",
                                    data:{
                                        type:"gettableaddress" 
                                    },
                                    dataSrc:function(json){
                                        var data = JSON.parse(json.data)
                                        var arr = []
                                        
                                        $.each(data,function(k,v){
                                            var result = {
                                                address_id  : v.address_id,
                                                address_name :  v.address_name,
                                                address_address :  v.address_address,
                                                btn_edit : '<button class="btn btn-warning btn-sm" type="button" onclick="edit_address('+v.address_id+')" id="bt_edit">เเก้ไข</button>',
                                                btn_del : '<button class="btn btn-danger btn-sm" type="button" onclick="del_address('+v.address_id+')" id="bt_del">ลบ</button>'
                                            }
                                            arr.push(result);
                             
                                        })
                                        return arr
                                    }
                                },
                                columns: [
                                    { 
                                        title: 'เลขที่',
                                        data: "address_id"
                                    },
                                    { 
                                        title: 'ชื่อสถานที่จัดอบรม',
                                        data: "address_name"
                                    },
                                    { 
                                        title: 'ที่อยู่', 
                                        data: "address_address"
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
                                $("#modal_addaddress").modal('show')
                                $("#add_addressname").val("");
                                $("#add_address").val("");
                            })
                            gettableaddress()
                            $("#listdata").addClass("menu-is-opening menu-open");
                            $("#pagedata").addClass("active");
                            $("#dataaddress").addClass("active");
                            
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



