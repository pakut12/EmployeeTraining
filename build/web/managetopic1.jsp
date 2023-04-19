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
        <div class="modal fade" id="modal_addtopicmain" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">เพิ่มข้อมูลหมวดหลัก</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        
                        <div class="mb-3">
                            <label for="" class="form-label">ชื่อหมวดหลัก</label>
                            <input type="text" class="form-control form-control-sm text-center" id="add_name">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        <div class="mb-3">
                            <label for="" class="form-label">เลขที่</label>
                            <input type="text" class="form-control form-control-sm text-center" id="edit_id" disabled> 
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">ชื่อหมวดหลัก</label>
                            <input type="text" class="form-control form-control-sm text-center" id="edit_name">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="updatetopicmain()">Save</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="container ">
            <div class="card">
                <div class="card-header">
                    จัดการหมวดหลัก
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
                        $("#table_topicmain").DataTable();
                    }
                })
            }
            
    
            function addtopicmain(){
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
                    $("#modal_addtopicmain").modal('show')
                })
                
                gettopicmain();
            })
        </script>
    </body>
    <footer>
        <%@ include file = "share/footer.jsp" %>
    </footer>
</html>
