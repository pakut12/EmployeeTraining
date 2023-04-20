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
        <div class="modal fade" id="modal_addtopicminor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">เพิ่มข้อมูลหมวดย่อย</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        
                        <div class="mb-3">
                            <label for="" class="form-label">ชื่อหมวดย่อย</label>
                            <input type="text" class="form-control form-control-sm text-center" id="add_name">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" onclick="addtopicminor()">Save</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="modal_edittopicminor" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                            <label for="" class="form-label">ชื่อหมวดย่อย</label>
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
                    จัดการหมวดย่อย
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
            function gettopicminor(){
                $.ajax({
                    type:"post",
                    url:"Topicminor",
                    data:{
                        type:"gettopicminor"
                    },
                    success:function(msg){
                        console.log(msg)
                        $("#mytable").html(msg)
                      
                        var table = $('#table_topicminor').DataTable({
                           
                        });
 
                        // Order by the grouping
                       
                    }
                })
            }
            
            function updatetopicmain(){
                $.ajax({
                    type:"post",
                    url:"Topicminor",
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
                       
                        $("#modal_edittopicminor").modal('hide');
                        gettopicminor()
                    }
                })
            }
          
            
            function gettopicmain(){
                $.ajax({
                    type:"post",
                    url:"Topicmain",
                    data:{
                        type:"getlisttopicmain"
                    },
                    success:function(msg){
                        $("#add_topicmain").empty();
                        $("#add_topicmain").html(msg);
                        
                    }
                })
            }
            

            function deltopicminor(id){
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
                            url:"Topicminor",
                            data:{
                                type:"deltopicminor",
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
                                gettopicminor()
                            }
                        })
                    }
                })
        
               
            }

            function addtopicminor(){
                $.ajax({
                    type:"post",
                    url:"Topicminor",
                    data:{
                        type:"addtopicminor",
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
                        $("#modal_addtopicminor").modal('hide');
                        gettopicminor()
                    }
                })
            }
            
            function edittopicminor(id){
                $("#modal_edittopicminor").modal('show')
                
                $.ajax({
                    type:"post",
                    url:"Topicminor",
                    data:{
                        type:"gettopicmainbyid",
                        id:id
                    },
                    success:function(msg){
                        var js = JSON.parse(msg);
                        console.log(msg);
                        $("#edit_id").val(js.id);
                        
                        $("#edit_name").val(js.name);
                       
                     
                    }
                })
                 
        
            }
            
            $(document).ready(function(){
                $("#adddata").click(function (){
                    $("#modal_addtopicminor").modal('show')
                    gettopicmain()
                })
                
                gettopicminor()
            })
        </script>
    </body>
    <footer>
        <%@ include file = "share/footer.jsp" %>
    </footer>
</html>
