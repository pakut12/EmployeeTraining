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
                                    <h5 class="modal-title" id="exampleModalLabel">เพิ่มข้อมูลกลุ่ม</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body text-center">
                                    <form id="myformadd"> 
                                        <div class="row">
                                            <div class="col-4">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ชื่อหมวดหลัก</label>
                                                    <select class="form-control form-control-sm text-center " style="width: 100%" id="add_topicmain_id" name="add_topicmain_id">
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ชื่อหมวดย่อย</label>
                                                    <select class="form-control form-control-sm text-center" id="add_topicminor_id" name="add_topicminor_id" style="width: 100%">
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                            <div class="col-4">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ชื่อหลักสูตร</label>
                                                    <select class="form-control form-control-sm text-center" id="add_course_id" name="add_course_id" style="width: 100%">
                                                        
                                                    </select>
                                                </div>
                                            </div>
                                            
                                            
                                        </div>
                                        <div class="row">
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">บริษัท</label>
                                                    <input class="form-control form-control-sm text-center" type="text" id="add_company" name="add_company"> 
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ค่าใช้จ่าย</label>
                                                    <input class="form-control form-control-sm text-center" type="text" id="add_expenses" name="add_expenses"> 
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">วันที่อบรม</label>
                                                    <input class="form-control form-control-sm text-center" type="date" id="add_date" name="add_date"> 
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ปี</label>
                                                    <input class="form-control form-control-sm text-center" type="text" id="add_year" name="add_year"> 
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">สถาบันที่จัดอบรม</label>
                                                    <input class="form-control form-control-sm text-center" type="text" id="add_address" name="add_address"> 
                                                </div>
                                            </div>
                                            <div class="col-2">
                                                <div class="mb-3">
                                                    <label for="" class="form-label">ชั่วโมง</label>
                                                    <input class="form-control form-control-sm text-center" type="text" id="add_hour" name="add_hour"> 
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
                                                <input class="form-control form-control-sm text-center" type="text" id="employee_id"> 
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
                                            <table class="table text-nowrap text-center table-bordered table-sm w-100" id="table_employee" >
                                                
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
                    
                    <div class="modal fade" id="modal_editgroup"  aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">เเก้ไขข้อมูลจัดกลุ่ม</h5>
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
                                        <select class="form-control form-control-sm text-center" id="edit_course_id" style="width: 100%">
                                            
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                    <button type="button" class="btn btn-primary" onclick="updategroup()">Save</button>
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
                                
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <script>
                        
                        const employeelist = [];
                    
                        function getcourse(){
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
                                    getcourse()
                                }
                            })
                        }	
                        
                        function getemployeebyid(){
                            var table = $("#table_employee").DataTable({
                                data:employeelist,
                                columns: [
                                    { 
                                        title: 'รหัส',
                                        data: "employee_id"
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
                                        data: "employee_posiddesc" },
                                    { 
                                        title: 'ระดับงาน', 
                                        data:"employee_deptdesc"
                                                 
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
                                        data: "employee_deptdesc" 
                                    },
                                    { 
                                        title: 'วันเริ่มงาน',
                                        data: "employee_startdate"
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
                            var id = $("#employee_id").val();
                            
                            $.ajax({
                                type:"post",
                                url:"Employee",
                                data:{
                                    type:"getemployeebyid",
                                    employee_id:id
                                },
                                success:function(msg){
                                    
                                    var js = JSON.parse(msg)
                                  
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
                                        employee_btdel:"<button type='button' class='btn btn-danger btn-sm' onclick='delemployeebyid("+(employeelist.length-1)+")'>ลบ</button>"
                                      
                                    }
                                    
                                    employeelist.push(employee)
                                    getemployeebyid()
                                 
                                }
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
                            
                            console.log(form)
                            
                            $.ajax({
                                type:"post",
                                url:"Training",
                                data:form,
                                success:function(msg){
                                    console.log(msg)
                                }
                            })
        
                          
                        }

   
                        $(document).ready(function(){
                            $("#adddata").click(function (){
                                $("#modal_addtraining").modal('show')
                            })
                            
                            $("#listdata").addClass("menu-is-opening menu-open");
                            $("#pagedata").addClass("active");
                            $("#datamain").addClass("active");
                            
                            gettopicmain()
                            
                            $("#add_topicmain_id").on('input', function() {
                                gettopicminor()
                            });
                            
    
                            $("#add_topicminor_id").on('input', function() {
                                getcourse()
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



