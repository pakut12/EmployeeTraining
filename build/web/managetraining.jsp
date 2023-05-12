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
                    <div class="modal fade" id="modal_addtraining"  aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">เพิ่มข้อมูลฝึกอบรม</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    <form id="myformadd" > 
                                        <div class="row">
                                            <div class="col-4">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ชื่อหมวดหลัก</label>
                                                    <select class="form-control form-control-sm text-center " style="width: 100%" id="add_topicmain_id" name="add_topicmain_id" required>
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ชื่อหมวดย่อย</label>
                                                    <select class="form-control form-control-sm text-center" id="add_topicminor_id" name="add_topicminor_id" style="width: 100%" required>
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ชื่อหลักสูตร</label>
                                                    <select class="form-control form-control-sm text-center" id="add_course_id" name="add_course_id" style="width: 100%" required>
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div class="row">
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">บริษัท</label>
                                                    <input class="form-control form-control-sm text-center" type="text" id="add_company" name="add_company" required> 
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ค่าใช้จ่าย</label>
                                                    <input class="form-control form-control-sm text-center" type="text" id="add_expenses" name="add_expenses" required> 
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">วันที่อบรม</label>
                                                    <input class="form-control form-control-sm text-center" type="date" id="add_date" name="add_date" required> 
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ปี</label>
                                                    <input class="form-control form-control-sm text-center" type="text" id="add_year" name="add_year" required> 
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">สถานที่จัดอบรม</label>
                                                    <select class="form-control form-control-sm text-center" id="add_address" name="add_address" style="width: 100%" required>
                                                        
                                                    </select>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ชั่วโมง</label>
                                                    <input class="form-control form-control-sm text-center" type="text" id="add_hour" name="add_hour" required> 
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </form>
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="text-right col-form-label ">รายชื่อพนักงาน</div>
                                        </div>
                                        <div class="col-4">
                                            <div class="text-center">
                                                <input class="form-control form-control-sm text-center" type="text" id="employee_id_add"> 
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="text-left">
                                                <button class="btn btn-success btn-sm" type="button" onclick="addemployeebyid()" >Add</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        
                                        <div class="col-12">
                                            <table class="table text-nowrap text-center table-bordered table-sm w-100" id="table_employee_add" >
                                                
                                            </table>
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="addTraining()">Save</button>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="modal fade" id="modal_edittraining"  aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">เเก้ไขข้อมูลฝึกอบรม</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    <form id="myformedit" > 
                                        <input class="" type="hidden" id="edit_training_id" name="edit_training_id" > 
                                        <div class="row">
                                            <div class="col-4">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ชื่อหมวดหลัก</label>
                                                    <select class="form-control form-control-sm text-center " style="width: 100%" id="edit_topicmain_id" name="edit_topicmain_id" required>
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ชื่อหมวดย่อย</label>
                                                    <select class="form-control form-control-sm text-center" id="edit_topicminor_id" name="edit_topicminor_id" style="width: 100%" required>
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ชื่อหลักสูตร</label>
                                                    <select class="form-control form-control-sm text-center" id="edit_course_id" name="edit_course_id" style="width: 100%" required>
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            
                                        </div>
                                        <div class="row">
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">บริษัท</label>
                                                    <input class="form-control form-control-sm text-center" type="text" id="edit_company" name="edit_company" required> 
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ค่าใช้จ่าย</label>
                                                    <input class="form-control form-control-sm text-center" type="text" id="edit_expenses" name="edit_expenses" required> 
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">วันที่อบรม</label>
                                                    <input class="form-control form-control-sm text-center" type="date" id="edit_date" name="edit_date" required> 
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ปี</label>
                                                    <input class="form-control form-control-sm text-center" type="text" id="edit_year" name="edit_year" required> 
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">สถานที่จัดอบรม</label>
                                                    <select class="form-control form-control-sm text-center" id="edit_address" name="edit_address" style="width: 100%" required>
                                                        
                                                    </select>
                                                    
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ชั่วโมง</label>
                                                    <input class="form-control form-control-sm text-center" type="text" id="edit_hour" name="edit_hour" required> 
                                                </div>
                                            </div>
                                        </div>
                                        
                                    </form>
                                    <div class="row">
                                        <div class="col-4">
                                            <div class="text-right col-form-label ">รายชื่อพนักงาน</div>
                                        </div>
                                        <div class="col-4">
                                            <div class="text-center">
                                                <input class="form-control form-control-sm text-center" type="text" id="employee_id_edit"> 
                                            </div>
                                        </div>
                                        <div class="col-4">
                                            <div class="text-left">
                                                <button class="btn btn-success btn-sm" type="button" onclick="add_employee_edit()" >Add</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        
                                        <div class="col-12">
                                            <table class="table text-nowrap text-center table-bordered table-sm w-100" id="table_employee_edit" >
                                                
                                            </table>
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="updatetraining()">Save</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card">
                        <div class="card-header ">
                            ค้นหา
                        </div>
                        <div class="card-body">
                            <form id="myformsearch">
                                <div class="row">
                                    <div class="col-3">
                                        <label>หมวดหลัก</label>
                                        <select class="form-control form-control-sm text-center " style="width: 100%" id="search_topicmain_id" name="search_topicmain_id" required>
                                        </select>
                                    </div>
                                    <div class="col-3">
                                        <label>หมวดย่อย</label>
                                        <select class="form-control form-control-sm text-center " style="width: 100%" id="search_topicminor_id" name="search_topicminor_id" required>
                                        </select>
                                    </div>
                                    <div class="col-3">
                                        <label>หลักสูตร</label>
                                        <select class="form-control form-control-sm text-center " style="width: 100%" id="search_course_id" name="search_course_id" required>
                                        </select>
                                    </div>
                                    <div class="col-3">
                                        <label>วันที่อบรม</label>
                                        <input class="form-control form-control-sm" type="date" id="search_date" name="search_date"></input> 
                                    </div>
                                </div>
                            </form>
                            <div class="row mt-3">
                                <div class="col-12">
                                    <button class="btn btn-primary btm-sm w-100" onclick="gettabletraining()"> ค้นหา</button>
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
                                <table class="table text-nowrap text-center table-bordered table-sm w-100" id="table_training" >
                                    <thead>
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
                                        <th></th>
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    
                    <script>
                        
                        const employeelist = [];
                    
                       
                        function ClearInput(){
                            employeelist.length = [];
                            $("#myformadd input").val("");
                            $("#employee_id_add").val("");
                            gettopicmain()
                            $("#myformadd select").empty();
                            $("#table_employee_add").empty();
                        }
    
                        function getcourse(num){
                            if(num == 1){
                                var topicmain_id = $("#search_topicmain_id").val(); 
                                var topicminor_id = $("#search_topicminor_id").val(); 
                     
                                $.ajax({
                                    type:"post",
                                    url:"Training",
                                    data:{
                                        type:"getcoursebytopicminor_id",
                                        topicmain_id:topicmain_id,
                                        topicminor_id:topicminor_id
                                    },
                                    success:function(msg){
                                  
                                        $("#search_course_id").empty();
                                        $("#search_course_id").append(msg);
                                        $("#search_course_id").select2();
                                    }
                                })
                            }else if(num == 2){
                                var topicmain_id = $("#add_topicmain_id").val(); 
                                var topicminor_id = $("#add_topicminor_id").val(); 
                     
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
                        }
                        
                        function gettopicmain(num){
                            if(num == 1){
                                $.ajax({
                                    type:"post",
                                    url:"Group",
                                    data:{
                                        type:"gettopicmain"
                                    },
                                    success:function(msg){
                                        $("#search_topicmain_id").empty();
                                        $("#search_topicmain_id").append(msg);
                                        $("#search_topicmain_id").select2();
                                    }
                                })
                            }else if(num == 2){
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
                                            
                            
                
                        }	
                        
                        function gettopicminor(num){
                            if(num == 1){
                                var topicmain_id = $("#search_topicmain_id").val();               
        
                                $.ajax({
                                    type:"post",
                                    url:"Training",
                                    data:{
                                        type:"gettopicminorbytopicmain_id",
                                        topicmain_id:topicmain_id
                                    },
                                    success:function(msg){
                                    
                                        $("#search_topicminor_id").empty();
                                        $("#search_topicminor_id").append(msg);
                                        $("#search_topicminor_id").select2();
                                        getcourse(1)
                                    }
                                })
                            
                            }else if(num == 2){
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
                                        getcourse(2)
                                    }
                                })
                            }
                            
                        }	
                        
                        function getaddress(){
                                         
                            $.ajax({
                                type:"post",
                                url:"Address",
                                data:{
                                    type:"getaddress"
                                },
                                success:function(msg){
                                    
                                    $("#add_address").empty();
                                    $("#add_address").append(msg);
                                    $("#add_address").select2();
                                   
                                }
                            })
                        }                        

                        function getemployeebyid(){
                            var table = $("#table_employee_add").DataTable({
                                data:employeelist,
                                columns: [
                                    { 
                                        title: 'รหัส',
                                        data: "employee_id"
                                    },
                                    { 
                                        title: 'การจ้าง',
                                        data: "employee_employment"
                                    },
                                    { 
                                        title: 'เลขบัตรประชาชน',
                                        data: "employee_idcard"
                                    },
                                    { 
                                        title: 'คำหน้า', 
                                        data: "employee_prefixdesc"
                                    },
                                    { 
                                        title: 'ชื่อ', 
                                        data: "employee_fname"
                                    },
                                    { 
                                        title: 'สกุล', 
                                        data: "employee_lname" },
                                    { 
                                        title: 'ตำเเหน่ง',
                                        data: "employee_posiddesc"
                                    },
                                    
                                    { 
                                        title: 'หน่วยงาน', 
                                        data: "employee_deptdesc"
                                    },
                                    { 
                                        title: 'CT',
                                        data: "employee_ct" 
                                    },
                                    {
                                        title: 'วัน/เดือน/ปี เกิด',
                                        data: "employee_birthday" 
                                    },
                                    { 
                                        title: 'วันเริ่มงาน',
                                        data: "employee_startdate"
                                    },
                                    { 
                                        title: 'อายุงาน',
                                        data: "employee_age"
                                    },
                                    { 
                                        title: 'ลบ',
                                        data: "employee_btdel"
                                    },
                                ],
                                scrollX:true,
                                scrollY:'200px',
                                bDestroy: true,
                                fixedColumns:   {
                                    right: 1
                                }
                            });
                        }

                       
                        function delemployeebyid(id){
                            employeelist.splice(id,1)
                            getemployeebyid()
                        }
                       
    
                        function addemployeebyid(){
                            var id = $("#employee_id_add").val();
                            
                            $.ajax({
                                type:"post",
                                url:"Employee",
                                data:{
                                    type:"getemployeebyid",
                                    employee_id:id
                                },
                                success:function(msg){
                                    
                                    var js = JSON.parse(msg)
                                    //console.log(js)
                                    var employee = {
                                        employee_id:js.employee_id,
                                        employee_idcard:js.employee_idcard,
                                        employee_prefixdesc:js.employee_prefixdesc,
                                        employee_fname:js.employee_fname,
                                        employee_lname:js.employee_lname,
                                        employee_deptdesc:js.employee_deptdesc,
                                        employee_ct:js.employee_ct,
                                        employee_startdate:js.employee_startdate,
                                        employee_posiddesc:js.employee_posiddesc,
                                        employee_ct:js.employee_ct,
                                        employee_birthday:js.employee_birthday,   
                                        employee_employment:js.employee_employment,
                                        employee_age:js.employee_age,
                                        employee_btdel:"<button type='button' class='btn btn-danger btn-sm' onclick='delemployeebyid("+(employeelist.length-1)+")'>ลบ</button>"
                                      
                                    }
                                    
                                    const result = employeelist.find((em) => {
                                        let chk = null;  
                                        if(id == em.employee_id){
                                            chk = true;
                                        }else{
                                            chk = false;
                                        }
            
                                        return chk
                                    });
                                    
                                    if(!result){
                                        employeelist.push(employee);
                                    }else{
                                        Swal.fire({
                                            title:"บันทึก",
                                            icon:"error",
                                            text:"บันทึกไม่สำเร็จ : มีรายชื่ออยู่เเล้ว"
                                        })
                                    }
                                    
                                    /*
                                    if(result){
                                        employeelist.push(employee);
                                    }
                                     */
                                    
                                    getemployeebyid()
                                    $("#employee_id_add").val("");
                                }
                            })
                        }
                        
                        function add_employee_edit(){
                            var t_id = $("#edit_training_id").val();
                            var e_id = $("#employee_id_edit").val();
                            
                            $.ajax({
                                type:"post",
                                url:"Employee",
                                data:{
                                    type:"addemployeebyid",
                                    training_id:t_id,
                                    employee_id:e_id
                                },
                                success:function(msg){
                                    if(msg == "false1"){
                                        Swal.fire({
                                            title:"บันทึก",
                                            text:"บันทึกไม่สำเร็จ : มีรายชื่ออยู่เเล้ว",
                                            icon:"error"
                                        }) 
                                    }else if(msg == "false2"){
                                        Swal.fire({
                                            title:"บันทึก",
                                            text:"บันทึกไม่สำเร็จ",
                                            icon:"error"
                                        }) 
                                    }
                                    
        
                                    $("#employee_id_edit").val("");
                                    $.ajax({
                                        type:"post",
                                        url:"Training",
                                        data:{
                                            type:"getdatatrainingbyid",
                                            training_id:t_id
                                        },
                                        success:function(msg){
                                            var js =  JSON.parse(msg);
                                            console.log(js)
                                            
        
                                            $("#table_employee_edit").DataTable({
                                                data:js.listem,
                                                columns: [
                                                    { 
                                                        title: 'รหัส',
                                                        data: "employee_id"
                                                    },
                                                    { 
                                                        title: 'การจ้าง',
                                                        data: "employee_employment"
                                                    },
                                                    { 
                                                        title: 'เลขบัตรประชาชน',
                                                        data: "employee_idcard"
                                                    },
                                                    { 
                                                        title: 'คำหน้า', 
                                                        data: "employee_prefixdesc"
                                                    },
                                                    { 
                                                        title: 'ชื่อ', 
                                                        data: "employee_fname"
                                                    },
                                                    { 
                                                        title: 'สกุล', 
                                                        data: "employee_lname" },
                                                    { 
                                                        title: 'ตำเเหน่ง',
                                                        data: "employee_posiddesc"
                                                    },
                                                    { 
                                                        title: 'หน่วยงาน', 
                                                        data: "employee_deptdesc"
                                                    },
                                                    { 
                                                        title: 'CT',
                                                        data: "employee_ct" 
                                                    },
                                                    {
                                                        title: 'วัน/เดือน/ปี เกิด',
                                                        data: "employee_birthday" 
                                                    },
                                                    { 
                                                        title: 'วันเริ่มงาน',
                                                        data: "employee_startdate"
                                                    },
                                                    { 
                                                        title: 'อายุงาน',
                                                        data: "employee_age"
                                                    },
                                                    { 
                                                        title: 'ลบ',
                                                        data: "btn_del"
                                                    },
                                          
                                                ],
                                                scrollCollapse: true,
                                                scrollX:true,  
                                                bDestroy: true,
                                                fixedColumns:   {
                                                    right: 1
                                                }
                                            })
                                           
                                        }
                                    })
                                   
                                }
                            })
                            

                        }


                        function del_employee_edit(training_id,employee_id){
                        
                            $.ajax({
                                type:"post",
                                url:"Employee",
                                data:{
                                    type:"delemployeebyid",
                                    training_id:training_id,
                                    employee_id:employee_id
                                },
                                success:function(msg){
                                    
                                    $.ajax({
                                        type:"post",
                                        url:"Training",
                                        data:{
                                            type:"getdatatrainingbyid",
                                            training_id:training_id
                                        },
                                        success:function(msg){
                                            var js =  JSON.parse(msg);
                                            
                                            $("#table_employee_edit").DataTable({
                                                data:js.listem,
                                                columns: [
                                                    { 
                                                        title: 'รหัส',
                                                        data: "employee_id"
                                                    },
                                                    { 
                                                        title: 'การจ้าง',
                                                        data: "employee_employment"
                                                    },
                                                    { 
                                                        title: 'เลขบัตรประชาชน',
                                                        data: "employee_idcard"
                                                    },
                                                    { 
                                                        title: 'คำหน้า', 
                                                        data: "employee_prefixdesc"
                                                    },
                                                    { 
                                                        title: 'ชื่อ', 
                                                        data: "employee_fname"
                                                    },
                                                    { 
                                                        title: 'สกุล', 
                                                        data: "employee_lname" },
                                                    { 
                                                        title: 'ตำเเหน่ง',
                                                        data: "employee_posiddesc"
                                                    },
                                                    { 
                                                        title: 'หน่วยงาน', 
                                                        data: "employee_deptdesc"
                                                    },
                                                    { 
                                                        title: 'CT',
                                                        data: "employee_ct" 
                                                    },
                                                    {
                                                        title: 'วัน/เดือน/ปี เกิด',
                                                        data: "employee_birthday" 
                                                    },
                                                    { 
                                                        title: 'วันเริ่มงาน',
                                                        data: "employee_startdate"
                                                    },
                                                    { 
                                                        title: 'อายุงาน',
                                                        data: "employee_age"
                                                    },
                                                    { 
                                                        title: 'ลบ',
                                                        data: "btn_del"
                                                    },
                                          
                                                ],
                                     
                                                scrollCollapse: true,
                                                scrollX:true, 
                                                bDestroy: true,
                                                fixedColumns:   {
                                                    right: 1
                                                }
                                            })
                                        }
                                    })
                                   
                                }
                            })
                            
                        }
                        
                        function edit_getcourse(course_name){
                            var edit_topicmain_id = $("#edit_topicmain_id").val(); 
                            var edit_topicminor_id = $("#edit_topicminor_id").val(); 
                            
                            $.ajax({
                                type:"post",
                                url:"Training",
                                data:{
                                    type:"getcoursebytopicminor_id",
                                    topicmain_id:edit_topicmain_id,
                                    topicminor_id:edit_topicminor_id
                                },
                                success:function(msg){
                                    let html = msg.replace("<option value='"+course_name+"'>"+course_name+"</option>", "");
                                    $("#edit_course_id").empty();
                                    if(course_name){
                                        $("#edit_course_id").append('<option value="'+course_name+'">'+course_name+'</option>');
                                    }
                                    $("#edit_course_id").append(html);
                                    $("#edit_course_id").select2();
                                    
                                }
                            })
                        }
                        
                        function edit_gettopicminor(minor_id,minor_name,course_name){
                            var edit_topicmain_id = $("#edit_topicmain_id").val();               
                           
                            $.ajax({
                                type:"post",
                                url:"Training",
                                data:{
                                    type:"gettopicminorbytopicmain_id",
                                    topicmain_id:edit_topicmain_id
                                },
                                success:function(msg){
                                    let html = msg.replace("<option value='"+minor_id+"'>"+minor_name+"</option>", "");
                                    $("#edit_topicminor_id").empty();
                                    if(minor_id && minor_name && course_name){
                                        $("#edit_topicminor_id").append('<option value="'+minor_id+'">'+minor_name+'</option>');
                                        edit_getcourse(course_name)
                                        console.log('Y')
                                    }else{
                                        console.log('N')
                                        edit_getcourse()
                                        
                                    }
                                    $("#edit_topicminor_id").append(html);
                                    $("#edit_topicminor_id").select2();
                                    
                                }
                            })
                        }	
                        
                        function edit_gettopicmain(main_id,main_name,minor_id,minor_name,course_name){
                            $.ajax({
                                type:"post",
                                url:"Group",
                                data:{
                                    type:"gettopicmain"
                                },
                                success:function(msg){
                                    let html = msg.replace("<option value='"+main_id+"'>"+main_name+"</option>", "");
                                    $("#edit_topicmain_id").empty();
                                    $("#edit_topicmain_id").append('<option value="'+main_id+'"  >'+main_name+'</option>');
                                    $("#edit_topicmain_id").append(html);
                                    $("#edit_topicmain_id").select2();
                                    edit_gettopicminor(minor_id,minor_name,course_name)
                                }
                            })
                
                        }

                        function updatetraining(){
                            var form = $("#myformedit").serialize()
                            form += "&type=updatetraining"
                         
                            $.ajax({
                                type:"post",
                                url:"Training",
                                data:form,
                                success:function(msg){
                                    if(msg == "true"){
                                        Swal.fire({
                                            title:"เเก้ไข",
                                            text:"เเก้ไขสำเร็จ",
                                            icon:"success"
                                        })
                                    }else if(msg == "false2"){
                                        Swal.fire({
                                            title:"เเก้ไข",
                                            text:"เเก้ไขไม่สำเร็จ",
                                            icon:"error"
                                        })
                                       
                                    }else if(msg == "false1"){
                                        Swal.fire({
                                            title:"เเก้ไข",
                                            text:"เเก้ไขไม่สำเร็จ : มีข้อมูลอยู่เเล้ว",
                                            icon:"error"
                                        })
                                       
                                    }
                                    $("#modal_edittraining").modal('hide')
                                    gettabletraining()
                                        
                                }
                            })
                   
                        }


                        function edit_getaddress(id,name){
                            $.ajax({
                                type:"post",
                                url:"Address",
                                data:{
                                    type:"getaddress"
                                },
                                success:function(msg){
                                    let html = msg.replace("<option value='"+id+"'>"+name+"</option>", "");
                                    $("#edit_address").empty();
                                    $("#edit_address").append('<option value="'+id+'">'+name+'</option>');
                                    $("#edit_address").append(html);
                                    $("#edit_address").select2();
                                   
                                }
                            })
                
                        }
                        
                        function edit_training(id){
                            $("#modal_edittraining").modal('show')
                        
                            $.ajax({
                                type:"post",
                                url:"Training",
                                data:{
                                    type:"getdatatrainingbyid",
                                    training_id:id
                                },
                                success:function(msg){
                                    var js =  JSON.parse(msg);
                                    
                                    
                                    edit_getaddress(js.training_address_id,js.training_address)
                                    edit_gettopicmain(js.training_topicmain_id,js.training_topicmain_name,js.training_topicminor_id,js.training_topicminor_name,js.training_course)
        
                                    $("#edit_training_id").val(js.training_id);
                                    $("#edit_company").val(js.training_company);
                                    $("#edit_expenses").val(js.training_expenses);
                                    $("#edit_date").val(js.training_datetraining);
                                    $("#edit_year").val(js.training_year);
                                    $("#edit_address").val(js.training_address);
                                    $("#edit_hour").val(js.training_hour);
                                    
                                    $("#table_employee_edit").DataTable({
                                        data:js.listem,
                                        columns: [
                                            { 
                                                title: 'รหัส',
                                                data: "employee_id"
                                            },
                                            { 
                                                title: 'การจ้าง',
                                                data: "employee_employment"
                                            },
                                            { 
                                                title: 'เลขบัตรประชาชน',
                                                data: "employee_idcard"
                                            },
                                            { 
                                                title: 'คำหน้า', 
                                                data: "employee_prefixdesc"
                                            },
                                            { 
                                                title: 'ชื่อ', 
                                                data: "employee_fname"
                                            },
                                            { 
                                                title: 'สกุล', 
                                                data: "employee_lname" },
                                            { 
                                                title: 'ตำเเหน่ง',
                                                data: "employee_posiddesc"
                                            },
                                            { 
                                                title: 'หน่วยงาน', 
                                                data: "employee_deptdesc"
                                            },
                                            { 
                                                title: 'CT',
                                                data: "employee_ct" 
                                            },
                                            {
                                                title: 'วัน/เดือน/ปี เกิด',
                                                data: "employee_birthday" 
                                            },
                                            { 
                                                title: 'วันเริ่มงาน',
                                                data: "employee_startdate"
                                            },
                                            { 
                                                title: 'อายุงาน',
                                                data: "employee_age"
                                            },
                                            { 
                                                title: 'ลบ',
                                                data: "btn_del"
                                            },
                                          
                                        ],
                                        scrollCollapse: true,
                                        scrollX:true, 
                                        bDestroy: true,
                                        fixedColumns:{
                                            right: 1
                                        }
                                        
                                    })
                                }
                            })
        
                        }

                        function del_training(id){
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
                                        url:"Training",
                                        data:{
                                            type:"deltraining",
                                            training_id:id
                                        },
                                        success:function(msg){
                                            if(msg == 'true'){
                                                Swal.fire({
                                                    icon:"success",
                                                    text:"ลบสำเร็จ",
                                                    title:"ลบ"
                                                })
            
                                            }else if(msg == 'false'){
                                                Swal.fire({
                                                    icon:"error",
                                                    text:"ลบไม่สำเร็จ",
                                                    title:"ลบ"
                                                })
                                            }
                                            gettabletraining()
        
                                        }
                                    })
                                }
                            })
        
                        }



                        function gettabletraining(num){
                            let search_topicmain_id = $("#search_topicmain_id").val()
                            let search_topicminor_id = $("#search_topicminor_id").val()
                            let search_course_id = $("#search_course_id").val()
                            let search_date = $("#search_date").val()
        
                            if(num == 1){
                                search_topicmain_id = null
                                search_topicminor_id = null
                                search_course_id = null
                            }
                            console.log(search_topicmain_id)
                            console.log(search_topicminor_id)
                            console.log(search_course_id)
                            
        
                            var table = $("#table_training").DataTable({
                                serverSide: true,
                                ajax: {
                                    type:"post",
                                    url:"Training",
                                    data:{
                                        type:"getdatatraining",
                                        search_topicmain_id:search_topicmain_id,
                                        search_topicminor_id:search_topicminor_id,
                                        search_course_id:search_course_id,
                                        search_date:search_date
                                    },
                                    dataSrc:function(json){
                                        var data = JSON.parse(json.data)
                                        var arr = []
                                        
                                        $.each(data,function(k,v){
                                            var result = {
                                                training_address : v.training_address,
                                                training_company :  v.training_company,
                                                training_datetraining :  v.training_datetraining,
                                                training_expenses :  v.training_expenses,
                                                training_hour :  v.training_hour,
                                                training_id :  v.training_id,
                                                training_topicmain :  v.training_topicmain,
                                                training_topminor :  v.training_topminor,
                                                training_year :  v.training_year,
                                                training_course:v.training_course,
                                                btn_edit : '<button class="btn btn-warning btn-sm" type="button" onclick="edit_training('+v.training_id+')" id="bt_edit">เเก้ไข</button>',
                                                btn_del : '<button class="btn btn-danger btn-sm" type="button" onclick="del_training('+v.training_id+')" id="bt_del">ลบ</button>'
                                            }
                                            arr.push(result);
                             
                                        })
                                        return arr
                                    }
                                },
                                columns: [
                                    { 
                                        title: 'รหัส',
                                        data: "training_id"
                                    },
                                    { 
                                        title: 'บริษัท',
                                        data: "training_company"
                                    },
                                    { 
                                        title: 'ปี', 
                                        data: "training_year"
                                    },
                                    { 
                                        title: 'ชั้วโมง', 
                                        data: "training_hour"
                                    },
                                    { 
                                        title: 'วันที่อบรม', 
                                        data: "training_datetraining" },
                                    { 
                                        title: 'ค่าใช้จ่าย',
                                        data: "training_expenses" },
                                    { 
                                        title: 'สถานที่จัดอบรม', 
                                        data:"training_address"
                                                 
                                    },
                                    { 
                                        title: 'หมวดหลัก', 
                                        data: "training_topicmain"
                                    },
                                    { 
                                        title: 'หมวดย่อย',
                                        data: "training_topminor" 
                                    },
                                    {
                                        title: 'หลักสูตร',
                                        data: "training_course" 
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


                        function addTraining(){
                            var form = $("#myformadd").serialize()
                            var numlist = employeelist.length-1
                            var listemployeeid = []
                            for(var n = 0;n<=numlist;n++){
                                listemployeeid.push(employeelist[n].employee_id)
                            }
                            form += "&listemployeeid=" + listemployeeid
                            form += "&type=addtraining"
                            
                            $.ajax({
                                type:"post",
                                url:"Training",
                                data:form,
                                success:function(msg){
                                    if(msg == "true"){
                                        Swal.fire({
                                            icon:"success",
                                            title:"บันทึก",
                                            text:"บันทึกสำเร็จ"
                                        })
                                    }else if(msg == "false1"){
                                        Swal.fire({
                                            icon:"error",
                                            title:"บันทึก",
                                            text:"บันทึกไม่สำเร็จ : มีข้อมูลเเล้ว "
                                        })
                                    }else if(msg == "false2"){
                                        Swal.fire({
                                            icon:"error",
                                            title:"บันทึก",
                                            text:"บันทึกไม่สำเร็จ : เพิ่มข้อมูลฝึกอบรมไม่สำเร็จ"
                                        })
                                    }else if(msg == "false3"){
                                        Swal.fire({
                                            icon:"error",
                                            title:"บันทึก",
                                            text:"บันทึกไม่สำเร็จ : เพิ่มข้อมูลรายชื่อพนักงานไม่สำเร็จ"
                                        })
                                    }
                                    gettabletraining()
                                    ClearInput()
                                    $("#modal_addtraining").modal('hide')
                                }
                            })
        
                          
                        }

   
                        $(document).ready(function(){
                        
                            gettabletraining(1)
                            gettopicmain(1)
                            
                            $("#adddata").click(function (){
                                gettopicmain(2)
                                ClearInput()
                                $("#modal_addtraining").modal('show')
                                getaddress()
                            })
                            
                            $("#listtraining").addClass("menu-is-opening menu-open");
                            $("#pagetraining").addClass("active");
                            $("#datatraining").addClass("active");
                            
                            
                            $("#search_topicmain_id").on('input', function() {
                                gettopicminor(1)
                                 
                            });
                            
                            $("#search_topicminor_id").on('input', function() {
                                getcourse(1)
                            });
                            
    
                            $("#add_topicmain_id").on('input', function() {
                                gettopicminor(2)
                            });
                            
                            $("#add_topicminor_id").on('input', function() {
                                getcourse(2)
                            });
                            
    
    
                            $("#edit_topicmain_id").on('input', function() {
                                edit_gettopicminor()
                                
                            });
                            
                            $("#edit_topicminor_id").on('input', function() {
                                edit_getcourse()
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



