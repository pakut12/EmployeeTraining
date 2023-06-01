<%-- 
    Document   : test
    Created on : 25 พ.ค. 2566, 9:55:57
    Author     : pakutsing
--%>
<%@page import="java.util.*" %>
<%@page import="com.pg.lib.model.*" %>
<%@page import="com.pg.lib.service.GroupService" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <%@ include file="share/header.jsp" %>
    </head>
    <body>
        <div class="row">
            <div class="col-sm-12 col-md-4">
                <select id="company" class="w-100"></select>
            </div>
            <div class="col-sm-12 col-md-4">
                <select id="product" class="w-100"></select>
            </div>
            <div class="col-sm-12 col-md-4">
                 <select id="test" class="w-100"></select>
            </div>
        </div>
       
        <button id="asd" onclick="bt()">asdasd</button>
        <script>
            
            function bt(){
                console.log($("#company").val())          
                console.log($("#product").val())   
                console.log($("#test").val())   
            }
            
            $('#company').select2();
            $('#product').select2();
            $('#test').select2();
            
            function getdropdown(){
                $.ajax({
                    type:"post",
                    url:"Group",
                    data:{
                        type:"test12"
                    },
                    success:function(msg){
                        let arr = JSON.parse(msg); 
                        $("#product").html("<option id=''>Select</option>")
                        $("#company").html('<option id="">Select</option>')
                        $("#test").html('<option id="">Select</option>')
                      
                        $(arr).each(function(index,value){
                            if($("#company").find('option[id="'+ value.topicmain_id +'"]').length == 0){
                                $("#company").append('<option id="'+ value.topicmain_id +'" value='+value.topicmain_id+'>'+value.topicmain_name+'</option>')
                            }
                        })
                       
                        $("#company").change(function(){
                            var companyId = $(this).val()
                            $("#product").html("<option id=''>Select</option>")
                            
                            if(companyId != ''){
                                $(arr).each(function(index,value){
                                    if(value.topicmain_id == companyId){
                                        if($("#product").find('option[id="'+ value.topicminor_id +'"]').length == 0){
                                            $("#product").append('<option id="'+value.topicminor_id+'" value='+value.topicminor_id+'>'+ value.topicminor_name+'</option>')
                                        }
                                    }
                                })
                            }
                        })
                        
                        $("#product").change(function(){
                            var courseId = $(this).val()
                            $("#test").html("<option id=''>Select</option>")
                            
                            if(courseId != ''){
                                $(arr).each(function(index,value){
                                    if(value.topicminor_id == courseId && value.topicmain_id == $("#company").val()){
                                        if($("#test").find('option[id="'+ value.topicminor_id +'"]').length == 0){
                                            $("#test").append('<option id="'+value.course_name+' value='+value.course_name+'">'+ value.course_name+'</option>')
                                        }
                                    }
                                })
                            }
                        })
                     
                        
                    }
                })
            
            }
            
            
            $(document).ready(function(){
                getdropdown()
                $("#search_topicmain_id").select2();
                $("#search_topicminor_id").select2();
                $("#search_course_id").select2();
               
            })
        </script>
    </body>
</html>
