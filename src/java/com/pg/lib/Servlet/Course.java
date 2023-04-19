/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.pg.lib.model.ET_Course;
import com.pg.lib.model.ET_Topicminor;
import com.pg.lib.service.CourseService;
import java.io.*;
import java.net.*;

import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.JSONObject;

/**
 *
 * @author pakutsing
 */
public class Course extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String type = request.getParameter("type").trim();
            if (type.equals("addcourse")) {

                String name = request.getParameter("name").trim();
                try {
                    Boolean status = CourseService.addcourse(name);

                    if (status) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("getcourse")) {
                try {
                    List<ET_Course> list = CourseService.getlistcourse();

                    String html = "";
                    html += "<table class='table  table-sm text-center text-nowrap' id='table_course'>";
                    html += "<thead>";
                    html += "<tr>";
                    html += "<th>ลำดับ</th>";
                    html += "<th>หลักสูตร</th>";
                    html += "<th>วันที่สร้าง</th>";
                    html += "<th>เเก้ไข</th>";
                    html += "<th>ลบ</th>";
                    html += "</tr>";
                    html += "</thead>";
                    html += "<tbody>";
                    for (int i = 0; i < list.size(); i++) {
                        html += "<tr>";
                        html += "<td>" + (i + 1) + "</td>";

                        html += "<td>" + list.get(i).getCourse_name() + "</td>";
                        html += "<td>" + list.get(i).getCourse_date_create() + "</td>";
                        html += "<td><button type='button' class='btn btn-warning btn-sm' onclick='editcourse(" + list.get(i).getCourse_id() + ")'>เเก้ไข</button></td>";
                        html += "<td><button type='button' class='btn btn-danger btn-sm' onclick='delcourse(" + list.get(i).getCourse_id() + ")'>ลบ</button></td>";
                        html += "</tr>";
                    }
                    html += "</tbody>";
                    html += "</table>";

                    out.print(html);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getlistcoursebyid")) {

                String id = request.getParameter("id").trim();
                try {
                    List<ET_Course> list = CourseService.getlistcoursebyid(id);
                    JSONObject obj = new JSONObject();
                    obj.put("id", list.get(0).getCourse_id());
                    obj.put("name", list.get(0).getCourse_name());

                    out.print(obj);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("delcourse")) {

                String id = request.getParameter("id").trim();
                try {
                    Boolean status = CourseService.delcourse(id);

                    if (status) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }


                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("updatecourse")) {

                String id = request.getParameter("id").trim();
                String name = request.getParameter("name").trim();


                try {
                    Boolean status = CourseService.updatecourse(name, id);

                    if (status) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }


                } catch (Exception e) {
                    e.printStackTrace();
                }

            }
        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
