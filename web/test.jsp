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
                            <label for="" class="form-label">ชื่อหมวดหลัก</label>
                            <select class="form-select form-select-sm text-center" id="add_topicmain">
                                <option value=""></option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="" class="form-label">ชื่อหมวดย่อย</label>
                            <select class="form-select form-select-sm text-center" id="add_topicminor">
                                <option value=""></option>
                            </select>
                        </div>
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
      
        <div class="container ">
            <div class="card">
                <div class="card-header">
                    จัดการหลักสูตร
                </div>
                <div class="card-body">
                    <div class="row">
                        </
                </div>
            </div>
            
        </div>
        
        <script>
            
            
           
            

            
            $(document).ready(function(){
                $("#adddata").click(function (){
                    $("#modal_addcourse").modal('show')
                    gettopicmain()
                })
                $("#add_topicmain").on('input', function() {
                    gettopicminor()
                });
                getcourse()
            })
        </script>
    </body>
    <footer>
        <%@ include file = "share/footer.jsp" %>
    </footer>
</html>
