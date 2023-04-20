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
                        <h5 class="modal-title" id="exampleModalLabel">เพิ่มข้อมูลกลุ่ม</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body text-center">
                        <div class="mb-3">
                            <label for="" class="form-label">ชื่อหมวดหลัก</label>
                            <select class="form-select form-select-sm">
                                
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">ชื่อหมวดย่อย</label>
                            <select class="form-select form-select-sm">
                                
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">ชื่อหลักสูตร</label>
                            <select class="form-select form-select-sm">
                                
                            </select>
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
                        <h5 class="modal-title" id="exampleModalLabel">เเก้ไขข้อมูลจัดกลุ่ม</h5>
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
                    จัดการกลุ่ม
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
            function getcourse(){
                
            }
            function gettopicmain(){
                $.ajax({
                    type:"post",
                    url:"Topicmain",
                    data:{
                         
                    }
                    
                })
                
            }	
            function gettopicminor(){
                
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
