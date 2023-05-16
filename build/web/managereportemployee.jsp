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
                            <h1 class="m-1">แสดงการฝึกอบรมตามรหัสพนักงาน</h1>
                        </div><!-- /.col -->
                        <div class="col-sm-6">
                            <ol class="breadcrumb float-sm-right">
                                <li class="breadcrumb-item"><a href="#">หน้าเเรก</a></li>
                                <li class="breadcrumb-item"><a href="#">รายงาน</a></li>
                                <li class="breadcrumb-item active">แสดงการฝึกอบรมตามรหัสพนักงาน</li>
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
                                    <h5 class="modal-title" id="exampleModalLabel">แสดงการฝึกอบรมตามรหัสพนักงาน</h5>
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
                        <div class="card-body">
                            <form id="myformsearch">
                                <div class="row mx-auto text-center">
                                    <div class="col-sm-12 col-md-4"> 
                                        <label for="search_employee_id">รหัสพนักงาน</label>
                                        <input class="form-control form-control-sm w-100 text-center" type="text" id="search_employee_id" name="search_employee_id">
                                    </div>
                                    <div class="col-sm-12 col-md-4"> 
                                        <label for="search_employee_id">วันที่เริ่ม</label>
                                        <input class="form-control form-control-sm w-100 text-center" type="date" id="search_datestart" name="search_dateend">
                                    </div>
                                    <div class="col-sm-12 col-md-4"> 
                                        <label for="search_employee_id">ถึงวันที่</label>
                                        <input class="form-control form-control-sm w-100 text-center" type="date" id="search_dateend" name="search_dateend">
                                    </div>
                                </div>
                                <div class="row mt-3">
                                    <div class="col-sm-12 col-md-12">
                                        <button class="btn btn-primary btn-sm  w-100" onclick="gettabletraining()" type="button">ค้นหา</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    
                    <div class="card card-success card-outline shadow-sm">
                        <div class="card-header">
                            แสดงการฝึกอบรมตามรหัสพนักงาน
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
                                    </thead>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <script>
                        
                        const employeelist = [];
                    
                        pdfMake.fonts = {
                            THSarabun: {
                                normal: 'THSarabunNew.ttf',
                                bold: 'THSarabunNew-Bold.ttf',
                                italics: 'THSarabunNew-Italic.ttf',
                                bolditalics: 'THSarabunNew-BoldItalic.ttf'
                            }
                        }
    
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


                        function gettabletraining(num){
                            let search_employee_id = $("#search_employee_id").val()
                            let search_datestart = $("#search_datestart").val()
                            let search_dateend = $("#search_dateend").val()
                            
                            if(num == 1){
                                search_employee_id = null
                            }
                            
                            var table = $("#table_report").DataTable({
                                serverSide: true,
                                processing: true,
                                ajax: {
                                    type:"post",
                                    url:"Training",
                                    data:{
                                        type:"getdatatrainingbyemid",
                                        search_employee_id:search_employee_id,
                                        search_datestart:search_datestart,
                                        search_dateend:search_dateend
                                    },
                                    dataSrc:function(json){
                                        console.log(json)
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
                                        title: 'เลขที่',
                                        data: "training_id"
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
                                        title: 'ค่าใช้จ่าย',
                                        data: "training_expenses" 
                                    },
                                    { 
                                        title: 'สถานที่จัดอบรม', 
                                        data:"training_address"         
                                    },
                                    { 
                                        title: 'วันที่อบรม', 
                                        data: "training_datetraining" 
                                    }
                                    
                                ],
                                dom: 'Bfrtip',
                                lengthMenu: [[10, 25, 50,100,9999999], [10, 25, 50,100 ,"All"]],
                                buttons: [
                                    'pageLength',
                                    {
                                        extend: 'excel',
                                        title: 'รายชื่อหลักของผู้อบรม : '+ $("#search_employee_id").val()
                                    },
                                    
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
                                        title: 'เลขที่',
                                        data: "training_id"
                                    },
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
                                        title: 'ค่าใช้จ่าย',
                                        data: "training_expenses" 
                                    },
                                    { 
                                        title: 'วันที่อบรม', 
                                        data: "training_datetraining" 
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
                            $("#datareportemployee").addClass("active");
                            
                           
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



