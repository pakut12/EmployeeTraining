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
                                <div class="modal-body">
                                    
                                    <div class="text-center">
                                        <form id="myformadd" > 
                                            <div class="row">
                                                <div class="col-3">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">ชื่อหมวดหลัก</label>
                                                        <select class="form-control form-control-sm text-center " style="width: 100%" id="add_topicmain_id" name="add_topicmain_id" required>
                                                            
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-3">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">ชื่อหมวดย่อย</label>
                                                        <select class="form-control form-control-sm text-center" id="add_topicminor_id" name="add_topicminor_id" style="width: 100%" required>
                                                            
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-3">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">ชื่อหลักสูตร</label>
                                                        <select class="form-control form-control-sm text-center" id="add_course_id" name="add_course_id" style="width: 100%" required>
                                                            
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-3">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">บริษัท</label>
                                                        <input class="form-control form-control-sm text-center" type="text" id="add_company" name="add_company" required> 
                                                    </div>
                                                </div>
                                                
                                            </div>
                                            <div class="row">
                                                <div class="col-2">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">ประเภท</label>
                                                        <select class="form-control form-control-sm text-center" id="adds_type" name="add_type" style="width: 100%" required>
                                                            <option value='0'>-</option>
                                                            <option value='1'>ภายใน</option>
                                                            <option value='2'>ภายนอก</option>
                                                        </select>
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
                                                        <label for="" class="form-label">สาขา</label>
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
                                    </div>
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
                                    <button type="button" class="btn btn-primary" onclick="addTraining()" type="submit">Save</button>
                                    
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
                                <div class="modal-body ">
                                    <div class="text-center">
                                        <form id="myformedit" > 
                                            <input class="" type="hidden" id="edit_training_id" name="edit_training_id" > 
                                            <div class="row">
                                                <div class="col-3">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">ชื่อหมวดหลัก</label>
                                                        <select class="form-control form-control-sm text-center " style="width: 100%" id="edit_topicmain_id" name="edit_topicmain_id" required>
                                                            
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-3">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">ชื่อหมวดย่อย</label>
                                                        <select class="form-control form-control-sm text-center" id="edit_topicminor_id" name="edit_topicminor_id" style="width: 100%" required>
                                                            
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-3">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">ชื่อหลักสูตร</label>
                                                        <select class="form-control form-control-sm text-center" id="edit_course_id" name="edit_course_id" style="width: 100%" required>
                                                            
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-3">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">บริษัท</label>
                                                        <input class="form-control form-control-sm text-center" type="text" id="edit_company" name="edit_company" required> 
                                                    </div>
                                                </div>
                                                
                                            </div>
                                            <div class="row">
                                                <div class="col-2">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">ประเภท</label>
                                                        <select class="form-control form-control-sm text-center" id="edit_type" name="edit_type" style="width: 100%" required>
                                                            
                                                        </select>
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
                                                        <label for="" class="form-label">สาขา</label>
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
                                    </div>
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
                                                    <th></th>
                                                    <th></th>
                                                </thead>
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
                    
                    <div class="card card-success card-outline shadow-sm">
                        <div class="card-header ">
                            ค้นหา
                        </div>
                        <div class="card-body text-center">
                            <form id="myformsearch">
                                <div class="row">
                                    <div class="col-4">
                                        <label>หมวดหลัก</label>
                                        <select class="form-control form-control-sm text-center " style="width: 100%" id="search_topicmain_id" name="search_topicmain_id" required>
                                        </select>
                                    </div>
                                    <div class="col-4">
                                        <label>หมวดย่อย</label>
                                        <select class="form-control form-control-sm text-center " style="width: 100%" id="search_topicminor_id" name="search_topicminor_id" required>
                                        </select>
                                    </div>
                                    <div class="col-4">
                                        <label>หลักสูตร</label>
                                        <select class="form-control form-control-sm text-center " style="width: 100%" id="search_course_id" name="search_course_id" required>
                                        </select>
                                    </div>
                                    
                                    
                                </div>
                                <div class="row mt-2">
                                    <div class="col-3">
                                        <label>สาขา</label>
                                        <select class="form-control form-control-sm text-center " style="width: 100%" id="search_address" name="search_address" required>
                                        </select>
                                    </div>
                                    <div class="col-3">
                                        <label>ปี</label>
                                        <input class="form-control form-control-sm text-center" id="search_year" name="search_year">
                                    </div>
                                    <div class="col-3">
                                        <label>วันที่เริ่ม</label>
                                        <input class="form-control form-control-sm text-center" type="date" id="search_date_start" name="search_date_start"></input> 
                                    </div>
                                    <div class="col-3">
                                        <label>ถึงวันที่</label>
                                        <input class="form-control form-control-sm text-center" type="date" id="search_date_end" name="search_date_end"></input> 
                                    </div>
                                </div>
                            </form>
                            <div class="row mt-3">
                                <div class="col-12">
                                    <button class="btn btn-primary btn-sm w-100" onclick="gettabletraining()" > ค้นหา</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card card-success card-outline shadow-sm">
                        <div class="card-header">
                            จัดการข้อมูลฝึกอบรม
                        </div>
                        <div class="card-body">
                            <div class="text-right mb-3" >
                                <div class="btn-success btn btn-sm" id="adddata">เพิ่มข้อมูล</div>
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
                            $('#myformadd')[0].reset();
                            $("#add_topicmain_id").empty();
                            $("#add_topicminor_id").empty(); 
                            $("#add_course_id").empty();
                             
                            getdropdown(2)
                            $("#table_employee_add").empty();
                            $("#add_type").empty();
                            $("#add_type").html("<option value='0'>-</option><option value='1'>ภายใน</option><option value='2'>ภายนอก</option>")
                            $("#myformadd").removeClass("was-validated")
                        }
    
    
                        function getdropdown(num){
                            if(num == 1){
                                $.ajax({
                                    type:"post",
                                    url:"Group",
                                    data:{
                                        type:"test12"
                                    },
                                    success:function(msg){
                                        let arr = JSON.parse(msg); 
                                        $("#search_topicmain_id").html("<option id='' value=''>โปรดเลือก</option>")
                                        $("#search_topicminor_id").html("<option id='' value=''>โปรดเลือก</option>")
                                        $("#search_course_id").html("<option id='' value=''>โปรดเลือก</option>")
                                   
                                        $(arr).each(function(index,value){
                                            if($("#search_topicmain_id").find('option[id="'+ value.topicmain_id +'"]').length == 0){
                                                $("#search_topicmain_id").append('<option id="'+ value.topicmain_id +'" value='+value.topicmain_id+'>'+value.topicmain_name+'</option>')
                                            }
                                        })
                         
                                        $("#search_topicmain_id").change(function(){
                                            var companyId = $(this).val()
                                            $("#search_topicminor_id").html("<option id='' value=''>โปรดเลือก</option>")
                            
                                            if(companyId != ''){
                                                $(arr).each(function(index,value){
                                                    if(value.topicmain_id == companyId){
                                                        if($("#search_topicminor_id").find('option[id="'+ value.topicminor_id +'"]').length == 0){
                                                            $("#search_topicminor_id").append('<option id="'+value.topicminor_id+'" value='+value.topicminor_id+'>'+ value.topicminor_name+'</option>')
                                                        }
                                                    }
                                                })
                                  
                                            }
                            
                                        })
                                    
                                        $("#search_topicminor_id").change(function(){
                                    
                                            var courseId = $(this).val()
                                            $("#search_course_id").html("<option id='' value=''>โปรดเลือก</option>")
                            
                                            if(courseId != ''){
                                                $(arr).each(function(index,value){
                                                    
                                                    if(value.topicminor_id == courseId && value.topicmain_id == $("#search_topicmain_id").val()){
                                                    
                                                        if($("#search_course_id").find('option[id="'+ value.topicminor_id +'"]').length == 0){
                                                            $("#search_course_id").append('<option id="'+value.course_name+' value='+value.course_name+'">'+ value.course_name+'</option>')
                                                        }
                                                    }
                                                })
                                 
                                            }
                            
                                        })
                     
                        
                                    }
                                })
                            }else if(num == 2){
                                $.ajax({
                                    type:"post",
                                    url:"Group",
                                    data:{
                                        type:"test12"
                                    },
                                    success:function(msg){
                                        let arr = JSON.parse(msg); 
                                        $("#add_topicmain_id").html("<option id='' value=''>โปรดเลือก</option>")
                                        $("#add_topicminor_id").html("<option id='' value=''>โปรดเลือก</option>")
                                        $("#add_course_id").html("<option id='' value=''>โปรดเลือก</option>")
                                   
                                   
                      
                                        $(arr).each(function(index,value){
                                            if($("#add_topicmain_id").find('option[id="'+ value.topicmain_id +'"]').length == 0){
                                                $("#add_topicmain_id").append('<option id="'+ value.topicmain_id +'" value='+value.topicmain_id+'>'+value.topicmain_name+'</option>')
                                            }
                                        })
                         
                                        $("#add_topicmain_id").change(function(){
                                            var companyId = $(this).val()
                                            $("#add_topicminor_id").html("<option id='' value=''>โปรดเลือก</option>")
                            
                                            if(companyId != ''){
                                                $(arr).each(function(index,value){
                                                    if(value.topicmain_id == companyId){
                                                        if($("#add_topicminor_id").find('option[id="'+ value.topicminor_id +'"]').length == 0){
                                                            $("#add_topicminor_id").append('<option id="'+value.topicminor_id+'" value='+value.topicminor_id+'>'+ value.topicminor_name+'</option>')
                                                        }
                                                    }
                                                })
                                  
                                            }
                            
                                        })
                                    
                                        $("#add_topicminor_id").change(function(){
                                    
                                            var courseId = $(this).val()
                                            $("#add_course_id").html("<option id='' value=''>โปรดเลือก</option>")
                            
                                            if(courseId != ''){
                                                $(arr).each(function(index,value){
                                                    
                                                    if(value.topicminor_id == courseId && value.topicmain_id == $("#add_topicmain_id").val()){
                                                    
                                                        if($("#add_course_id").find('option[id="'+ value.topicminor_id +'"]').length == 0){
                                                            $("#add_course_id").append('<option id="'+value.course_name+' value='+value.course_name+'">'+ value.course_name+'</option>')
                                                        }
                                                    }
                                                })
                                 
                                            }
                            
                                        })
                     
                        
                                    }
                                })
                            }else if(num == 3){
                                $.ajax({
                                    type:"post",
                                    url:"Group",
                                    data:{
                                        type:"test12"
                                    },
                                    success:function(msg){
                                        let arr = JSON.parse(msg); 
                                        $("#add_topicmain_id").html("<option id='' value=''>โปรดเลือก</option>")
                                        $("#add_topicminor_id").html("<option id='' value=''>โปรดเลือก</option>")
                                        $("#add_course_id").html("<option id='' value=''>โปรดเลือก</option>")
                                   
                                        $(arr).each(function(index,value){
                                            if($("#add_topicmain_id").find('option[id="'+ value.topicmain_id +'"]').length == 0){
                                                $("#add_topicmain_id").append('<option id="'+ value.topicmain_id +'" value='+value.topicmain_id+'>'+value.topicmain_name+'</option>')
                                            }
                                        })
                         
                                        $("#add_topicmain_id").change(function(){
                                            var companyId = $(this).val()
                                            $("#add_topicminor_id").html("<option id='' value=''>โปรดเลือก</option>")
                            
                                            if(companyId != ''){
                                                $(arr).each(function(index,value){
                                                    if(value.topicmain_id == companyId){
                                                        if($("#add_topicminor_id").find('option[id="'+ value.topicminor_id +'"]').length == 0){
                                                            $("#add_topicminor_id").append('<option id="'+value.topicminor_id+'" value='+value.topicminor_id+'>'+ value.topicminor_name+'</option>')
                                                        }
                                                    }
                                                })
                                  
                                            }
                            
                                        })
                                    
                                        $("#add_topicminor_id").change(function(){
                                    
                                            var courseId = $(this).val()
                                            $("#add_course_id").html("<option id='' value=''>โปรดเลือก</option>")
                            
                                            if(courseId != ''){
                                                $(arr).each(function(index,value){
                                                    console.log(courseId+"&"+value.topicmain_id)
                                                    if(value.topicminor_id == courseId && value.topicmain_id == $("#add_topicmain_id").val()){
                                                    
                                                        if($("#add_course_id").find('option[id="'+ value.topicminor_id +'"]').length == 0){
                                                            $("#add_course_id").append('<option id="'+value.course_name+' value='+value.course_name+'">'+ value.course_name+'</option>')
                                                        }
                                                    }
                                                })
                                 
                                            }
                            
                                        })
                     
                        
                                    }
                                })
                            }
                            
            
                        }
    
                        /*
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
                         */
                         

                        function getaddresssearch(){
                            $.ajax({
                                type:"post",
                                url:"Address",
                                data:{
                                    type:"getaddress"
                                },
                                success:function(msg){
                                    $("#search_address").html(msg);   
        
                                }
                            })
        
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
                                        title: 'สาขา',
                                        data: "employee_company"
                                    },
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
                            //employeelist.splice(id,1)
                            for (var i = 0; i < employeelist.length; i++) {
                                console.log(employeelist[i].employee_id)
                                if (employeelist[i].employee_id == id) {
                                    employeelist.splice(i, 1);
                                    console.log(employeelist)
                                    getemployeebyid()
                                    
                break;
                                    //i--; // Decrement i to recheck the current index after the splice
                                }
                            }
                            
        
                       
                            
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
                                    
                                    let js = JSON.parse(msg)
                                    //console.log(js)
                                    var employee = {
                                        employee_company:js.employee_company,
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
                                        employee_btdel:"<button type='button' class='btn btn-danger btn-sm' onclick='delemployeebyid("+(js.employee_id)+")'>ลบ</button>"
                                      
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
                        
                        function get_employee_edit(t_id){
                            $("#employee_id_edit").val("");
                            $.ajax({
                                type:"post",
                                url:"Training",
                                data:{
                                    type:"getdatatrainingbyid",
                                    training_id:t_id
                                },
                                success:function(msg){
                                    let js =  JSON.parse(msg);
                                    $("#table_employee_edit").DataTable({
                                        data:js.listem,
                                        columns: [
                                            { 
                                                title: 'สาขา',
                                                data:"employee_company"
                                            },
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
                                    get_employee_edit(t_id)
        
                                  
                                   
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
                                    get_employee_edit(training_id)
                                    
                                }
                            })
                            
                        }
                        
                        function edit_getcourse(course_name){
                            let edit_topicmain_id = $("#edit_topicmain_id").val(); 
                            let edit_topicminor_id = $("#edit_topicminor_id").val(); 
                                 
        
                            $.ajax({
                                type:"post",
                                url:"Training",
                                data:{
                                    type:"getcoursebytopicminor_id",
                                    topicmain_id:edit_topicmain_id,
                                    topicminor_id:edit_topicminor_id
                                },
                                success:function(msg){
                                       
                                    if(course_name){
                                        let html = msg.replace("<option value='"+course_name+"'>"+course_name+"</option>", "");
                                        $("#edit_course_id").empty();
                                        $("#edit_course_id").append('<option value="'+course_name+'">'+course_name+'</option>');
                                        $("#edit_course_id").append(html);
                                        $("#edit_course_id").select2();
                                    }else{
                                        $("#edit_course_id").empty();
                                        $("#edit_course_id").append(msg);
                                        $("#edit_course_id").select2();
                                    }
                                     
                                }
                            })
                        }
                        
                        function edit_gettopicminor(minor_id,minor_name){
                            var edit_topicmain_id = $("#edit_topicmain_id").val();               
                           
        
                            $.ajax({
                                type:"post",
                                url:"Training",
                                data:{
                                    type:"gettopicminorbytopicmain_id",
                                    topicmain_id:edit_topicmain_id
                                },
                                success:function(msg){
                                    if(minor_id && minor_name){
                                        let html = msg.replace("<option value='"+minor_id+"'>"+minor_name+"</option>", "");
                                        $("#edit_topicminor_id").empty();
                                        $("#edit_topicminor_id").append('<option value="'+minor_id+'">'+minor_name+'</option>');
                                        $("#edit_topicminor_id").append(msg);
                                        $("#edit_topicminor_id").select2();
                                        
                                           
                                    }else{
                                        $("#edit_topicminor_id").empty();
                                        $("#edit_topicminor_id").append(msg);
                                        $("#edit_topicminor_id").select2();
                                        edit_getcourse()
                                    }
                                        
                                }
                            })
                        }	
                        
                        function edit_gettopicmain(main_id,main_name){
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
                                    // edit_gettopicminor(minor_id,minor_name,course_name)
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
                                    let js = JSON.parse(msg);
                                     
                                    
                                    edit_getaddress(js.training_address_id,js.training_address)
                                        
                                    edit_gettopicmain(js.training_topicmain_id,js.training_topicmain_name)
                                    edit_gettopicminor(js.training_topicminor_id,js.training_topicminor_name)
                                    edit_getcourse(js.training_course)
        
                                    $("#edit_training_id").val(js.training_id);
                                    $("#edit_company").val(js.training_company);
                                    $("#edit_expenses").val(js.training_expenses);
                                    $("#edit_date").val(js.training_datetraining);
                                    $("#edit_year").val(js.training_year);
                                    $("#edit_address").val(js.training_address);
                                    $("#edit_hour").val(js.training_hour);
                                    
                                    $("#edit_type").html(js.training_type);
                                    
                                    get_employee_edit(id)
                                   
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
                            let search_date_start = $("#search_date_start").val()
                            let search_date_end = $("#search_date_end").val()
                            let search_year = $("#search_year").val()
                            let search_address = $("#search_address").val()
                            
        
                            if(search_topicmain_id.includes("โปรดเลือก")){
                                search_topicmain_id == ""
                            }
                            if(search_topicminor_id.includes("โปรดเลือก")){
                                search_topicminor_id == ""
                            }
                            if(search_course_id.includes("โปรดเลือก")){
                                search_course_id == ""
                            }
        
                            console.log(search_topicmain_id)
                            console.log(search_topicminor_id)
                            console.log(search_course_id)
        
                            
                            var table = $("#table_training").DataTable({
                                processing: true,
                                serverSide: true,
                                ajax: {
                                    type:"post",
                                    url:"Training",
                                    data:{
                                        type:"getdatatraining",
                                        search_topicmain_id:search_topicmain_id,
                                        search_topicminor_id:search_topicminor_id,
                                        search_course_id:search_course_id,
                                        search_date_start:search_date_start,
                                        search_date_end:search_date_end,
                                        search_year:search_year,
                                        search_address:search_address
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
                                        title: 'สาขา', 
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
                            $("#myformadd").addClass("was-validated")
                            
                            empty = $('form#myformadd').find("input").filter(function() {
                                return this.value === "";
                            });
                            
                            if(empty.length) {
                                Swal.fire({
                                    icon:"error",
                                    title:"บันทึก",
                                    text:"บันทึกไม่สำเร็จ : กรุณากรอกข้อมูลให้ถูกต้อง"
                                })
                            }else{
                               
                                if($("#add_topicmain_id").val() == "" || $("#add_topicminor_id").val() == ""  || $("#add_course_id").val() == "" ){
                                    Swal.fire({
                                        icon:"error",
                                        title:"บันทึก",
                                        text:"บันทึกไม่สำเร็จ : กรุณาเลือกหมวดให้ถูกต้อง"
                                    })
                                } else{
                                
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
                            }
                          
                        }

   
                        $(document).ready(function(){
                            
        
                            $("#table_training").DataTable({
                                
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
                                        title: 'สาขา', 
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
                                    
                                ]
                               
                                  
                            })
                            getaddresssearch()
                            getdropdown(1)
                            //gettabletraining(1)
                            //gettopicmain(1)
                             
                            $(document).on('shown.bs.modal', '#modal_edittraining', function () {
                                $("#table_employee_edit").DataTable().columns.adjust().draw();
                            });
                            
                            $("#adddata").click(function (){
                               
                                ClearInput()
                                $("#modal_addtraining").modal('show')
                                getaddress()
                            })
                            
                            $("#listtraining").addClass("menu-is-opening menu-open");
                            $("#pagetraining").addClass("active");
                            $("#datatraining").addClass("active");
                           
                            
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



