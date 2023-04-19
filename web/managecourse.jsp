<%-- 
    Document   : index
    Created on : 20 ธ.ค. 2565, 14:04:11
    Author     : pakutsing
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@ include file = "share/header.jsp" %>
        
    </head>
    <body>
        <%@ include file = "share/navbar.jsp" %>
        
        <!-- Modal -->
        <div class="modal fade" id="modal_addcourse" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">เพิ่มข้อมูลหลักสูตร</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        
                        <div class="mb-3">
                            <label for="" class="form-label">ชื่อหลักสูตร</label>
                            <input type="text" class="form-control form-control-sm text-center" id="add_course">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="addcourse()">Save</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modal_editcourse" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">เเก้ไขข้อมูลหมวดย่อย</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        <div class="mb-3">
                            <label for="" class="form-label">เลขที่</label>
                            <input type="text" class="form-control form-control-sm text-center" id="edit_id" disabled> 
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">ชื่อหลักสูตร</label>
                            <input type="text" class="form-control form-control-sm text-center" id="edit_course">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="updatecourse()">Save</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="card">
                <div class="card-header">
                    จัดการหลักสูตร
                </div>
                <div class="card-body">
                    <div class="text-end mb-3">
                        <div class="btn-success btn" id="adddata">เพิ่มข้อมูล</div>
                    </div>
                    <div class="" id="mytable">
                        
                    </div>
                </div>
            </div>
        </div>
        
        <script>
            function updatecourse(){
                console.log($("#edit_id").val())        
                console.log($("#edit_name").val())   
                
                $.ajax({
                    type:"post",
                    url:"Course",
                    data:{
                        type:"updatecourse",
                        id:$("#edit_id").val(),
                        name:$("#edit_course").val()
                    },
                    success:function(msg){
                        
                        
                        if(msg == "true"){
                            Swal.fire({
                                icon:"success",
                                title:"เเก้ไข",
                                text:"เเก้ไขสำเร็จ"
                            })
                        }else{
                            Swal.fire({
                                icon:"error",
                                title:"เเก้ไข",
                                text:"เเก้ไขไม่สำเร็จ"
                            })
                        }
                        getcourse()
                        
                    }
                })
            }
            
            function delcourse(id){
                $.ajax({
                    type:"post",
                    url:"Course",
                    data:{
                        type:"delcourse",
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
                        getcourse()
                    }
                })
            }
            
            function editcourse(id){
                $.ajax({
                    type:"post",
                    url:"Course",
                    data:{
                        type:"getlistcoursebyid",
                        id:id
                    },
                    success:function(msg){
                        $("#modal_editcourse").modal('show')
                        var js = JSON.parse(msg)
                        $("#edit_id").val(js.id);
                        $("#edit_course").val(js.name);
                        console.log(js)
                    }
                })
            }
            
            function getcourse(){
                $.ajax({
                    type:"post",
                    url:"Course",
                    data:{
                        type:"getcourse"
                    },
                    success:function(msg){
                       
                        $("#mytable").html(msg)
                        $("#table_course").DataTable();
                    }
                })
            }
            
            function addcourse(){
                $.ajax({
                    type:"post",
                    url:"Course",
                    data:{
                        type:"addcourse",
                        name:$("#add_course").val()
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
                       
                        $("#modal_addcourse").modal('hide');
                        getcourse()
                    }
                })
            }
            
        

            
            $(document).ready(function(){
                $("#adddata").click(function (){
                    $("#modal_addcourse").modal('show')
                 
                })
               
                getcourse()
            })
        </script>
    </body>
    <footer>
        <%@ include file = "share/footer.jsp" %>
    </footer>
</html>
