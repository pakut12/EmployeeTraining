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
                            <h1 class="m-1">แสดงการฝึกอบรมตามหลักสูตร</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">หน้าเเรก</a></li>
                                <li class="breadcrumb-item"><a href="#">รายงาน</a></li>
                                <li class="breadcrumb-item active">แสดงการฝึกอบรมตามหลักสูตร</li>
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
                 
                    
                    <div class="modal fade" id="modal_report"  aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-xl">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">แสดงการฝึกอบรมตามหลักสูตร</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body ">
                                    <div class="text-center">
                                        <form id="myformevaluation" > 
                                            <input class="" type="hidden" id="evaluation_training_id" name="evaluation_training_id" > 
                                            <div class="row">
                                                <div class="col-4">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">ชื่อหมวดหลัก</label>
                                                        
                                                        <input class="form-control form-control-sm text-center" type="text" id="evaluation_topicmain_id" name="evaluation_topicmain_id" disabled> 
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">ชื่อหมวดย่อย</label>
                                                        
                                                        <input class="form-control form-control-sm text-center" type="text" id="evaluation_topicminor_id" name="evaluation_topicminor_id" disabled> 
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">ชื่อหลักสูตร</label>
                                                        
                                                        <input class="form-control form-control-sm text-center" type="text" id="evaluation_course_id" name="evaluation_course_id" disabled> 
                                                    </div>
                                                </div>
                                                
                                                
                                            </div>
                                            <div class="row">
                                                <div class="col-2">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">บริษัท</label>
                                                        <input class="form-control form-control-sm text-center" type="text" id="evaluation_company" name="evaluation_company" disabled> 
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">ค่าใช้จ่าย</label>
                                                        <input class="form-control form-control-sm text-center" type="text" id="evaluation_expenses" name="evaluation_expenses" disabled> 
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">วันที่อบรม</label>
                                                        <input class="form-control form-control-sm text-center" type="date" id="evaluation_date" name="evaluation_date" disabled> 
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">ปี</label>
                                                        <input class="form-control form-control-sm text-center" type="text" id="evaluation_year" name="evaluation_year" disabled> 
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">สถานที่จัดอบรม</label>
                                                        <input class="form-control form-control-sm text-center" type="text" id="evaluation_address" name="evaluation_address" disabled>  
                                                    </div>
                                                </div>
                                                <div class="col-2">
                                                    <div class="mb-3">
                                                        <label for="" class="form-label">ชั่วโมง</label>
                                                        <input class="form-control form-control-sm text-center" type="text" id="evaluation_hour" name="evaluation_hour" disabled> 
                                                    </div>
                                                </div>
                                            </div>
                                            
                                        </form>
                                    </div>
                                    <div class="row mt-3">
                                        
                                        <div class="col-12">
                                            <table class="table text-nowrap text-center table-bordered table-sm w-100" id="table_employee_evaluation" style="width:100%">
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
                                                </thead>
                                            </table>
                                        </div>
                                    </div>
                                    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    
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
                                    <div class="col-2">
                                        <label>หมวดหลัก</label>
                                        <select class="form-control form-control-sm text-center " style="width: 100%" id="search_topicmain_id" name="search_topicmain_id" required>
                                        </select>
                                    </div>
                                    <div class="col-2">
                                        <label>หมวดย่อย</label>
                                        <select class="form-control form-control-sm text-center " style="width: 100%" id="search_topicminor_id" name="search_topicminor_id" required>
                                        </select>
                                    </div>
                                    <div class="col-2">
                                        <label>หลักสูตร</label>
                                        <select class="form-control form-control-sm text-center " style="width: 100%" id="search_course_id" name="search_course_id" required>
                                        </select>
                                    </div>
                                    <div class="col-2">
                                        <label>ปี</label>
                                        <input class="form-control form-control-sm text-center" id="search_year" name="search_year">
                                    </div>
                                    <div class="col-2">
                                        <label>วันที่เริ่ม</label>
                                        <input class="form-control form-control-sm text-center" type="date" id="search_date_start" name="search_date_start"></input> 
                                    </div>
                                    
                                    <div class="col-2">
                                        <label>ถึงวันที่</label>
                                        <input class="form-control form-control-sm text-center" type="date" id="search_date_end" name="search_date_end"></input> 
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
                    
                    <div class="card card-success card-outline shadow-sm">
                        <div class="card-header">
                            แสดงการฝึกอบรมตามหลักสูตร
                        </div>
                        <div class="card-body">
                            
                            <div class="" id="mytable">
                                <table class="table text-nowrap text-center table-bordered table-sm w-100" id="table_report" >
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
                                  
                                            $("#evaluation_course_id").empty();
                                            $("#evaluation_course_id").append(msg);
                                            $("#evaluation_course_id").select2();
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
                                                            $("#evaluation_topicmain_id").empty();
                                                            $("#evaluation_topicmain_id").append(msg);
                                                            $("#evaluation_topicmain_id").select2();
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
                                    
                                                                            $("#evaluation_topicminor_id").empty();
                                                                            $("#evaluation_topicminor_id").append(msg);
                                                                            $("#evaluation_topicminor_id").select2();
                                                                            getcourse(2)
                                                                        }
                                                                    })
                                                                }
                            
                                                            }
                        
                                                            function updateevaluation(result){
                        
                                                                let idt = $("#evaluation_training_id").val();
                                                                let table = $("#table_employee_evaluation").DataTable()
                                                                let list = table.rows('.selected').data()
                            
                                                                if(list.length > 0){
                                                                    let arrlist = [];
                                                                    $.each(list,function(k,v){
                                                                        arrlist.push(v.employee_id)
                                                                    })
                          
                                                                    let input = "type=updateresult&listem="+arrlist+"&result="+result+"&idt="+idt
                            
                                                                    console.log(input)
                                                                    $.ajax({
                                                                        type:"post",
                                                                        url:"Employee",
                                                                        data:input,
                                                                        success:function(msg){
                                                                            if(msg == "true"){
                                                                                Swal.fire({
                                                                                    title:"บันทึก",
                                                                                    icon:"success",
                                                                                    text:"บันทึกสำเร็จ "
                                                                                })
                                                                            }else if(msg == "false"){
                                                                                Swal.fire({
                                                                                    title:"บันทึก",
                                                                                    icon:"error",
                                                                                    text:"บันทึกไม่สำเร็จ"
                                                                                })
                                                                            }
                                                                            $("#modal_evaluation").modal("hide")
                                                                        }
                                                                    })
                                                                }else{
                                                                    Swal.fire({
                                                                        title:"บันทึก",
                                                                        icon:"error",
                                                                        text:"บันทึกไม่สำเร็จ : กรุณาเลือกรายชื่อให้ถูกต้อง"
                                                                    })
                                                                }
                           
                                                            }


                                                            function evaluation(id){
                                                                $("#modal_report").modal('show')
                           
                                                                $.ajax({
                                                                    type:"post",
                                                                    url:"Training",
                                                                    data:{
                                                                        type:"getdatatrainingbyid",
                                                                        training_id:id
                                                                    },
                                                                    success:function(msg){
                                                                        var js =  JSON.parse(msg);
                                                                        console.log(js)
                                                                        $("#evaluation_training_id").val(js.training_id);
                                                                        $("#evaluation_topicmain_id").val(js.training_topicmain_name);
                                                                        $("#evaluation_topicminor_id").val(js.training_topicminor_name);
                                                                        $("#evaluation_course_id").val(js.training_course);
                                                                        $("#evaluation_company").val(js.training_company);
                                                                        $("#evaluation_expenses").val(js.training_expenses);
                                                                        $("#evaluation_date").val(js.training_datetraining);
                                                                        $("#evaluation_year").val(js.training_year);
                                                                        $("#evaluation_address").val(js.training_address);
                                                                        $("#evaluation_hour").val(js.training_hour);
                                    
                                                                        var table = $("#table_employee_evaluation").DataTable({
                                                                            data: js.listem,
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
                                                                                    data: "employee_lname" 
                                                                                },
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
                                                                                }
                                            
                                                                            ],
                                                                            processing: true,
                                                                            scrollCollapse: true,
                                                                            scrollX: true, 
                                                                            bDestroy: true,
                                                                            fixedColumns:{
                                                                                left: 2,
                                                                                right: 1
                                                                            },
                                       
                                                                            dom: 'Bfrtip',
                                                                            lengthMenu: [[10, 25, 50,100,9999999], [10, 25, 50,100 ,"All"]],
                                                                            buttons: [
                                                                                'pageLength',
                                                                                {
                                                                                    extend: 'excel',
                                                                                    title: 'รายชื่อผู้เข้าอบรมหลักสูตร : ' + js.training_course
                                                                                }
                                        
                                                                            ],
                                                                            order: [[1, 'asc']]
                                                                        });
                                    
                                                                        $(document).on('shown.bs.modal', '#modal_report', function () {
                                                                            table.columns.adjust().draw();
                                                                        });
       
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
                                                                if(num == 1){
                                                                    search_topicmain_id = null
                                                                    search_topicminor_id = null
                                                                    search_course_id = null
                                                                }
                                                                var table = $("#table_report").DataTable({
                                                                    serverSide: true,
                                                                    processing: true,
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
                                                                            search_year:search_year
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
                                                                                    btn_details : '<button class="btn btn-warning btn-sm" type="button" onclick="evaluation('+v.training_id+')" id="bt_details">ดูรายละเอียด</button>',
                                                
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
                                                                            title: 'รายละเอียด',
                                                                            data: "btn_details"
                                                                        }
                                                                    ],
                                
                                                                    scrollCollapse: true,
                                                                    scrollX:true, 
                                                                    bDestroy: true
                                                                })
                                                            }


                        

                                                            $(document).ready(function(){
                                                                gettopicmain(1)
                                                                $("#table_report").DataTable({
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
                                                                            title: 'รายละเอียด',
                                                                            data: "btn_details"
                                                                        }
                                                                    ]
                                                                })
                              
                                                                $("#search_topicmain_id").on('input', function() {
                                                                    gettopicminor(1)
                                 
                                                                });
                            
                                                                $("#search_topicminor_id").on('input', function() {
                                                                    getcourse(1)
                                                                });
        
                                                                $("#listreport").addClass("menu-is-opening menu-open");
                                                                $("#pagereport").addClass("active");
                                                                $("#datareportcourse").addClass("active");
                            
                           
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



