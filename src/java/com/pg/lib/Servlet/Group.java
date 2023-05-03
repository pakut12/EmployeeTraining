/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.pg.lib.model.*;
import java.io.*;
import java.net.*;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
import com.pg.lib.service.*;
import java.util.List;
import org.json.JSONObject;

/**
 *
 * @author pakutsing
 */
public class Group extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String type = request.getParameter("type").trim();

            if (type.equals("gettopicmain")) {
                List<ET_Topicmain> listmain = TopicmainService.listtopicmain();
                String html = "";

                for (ET_Topicmain l : listmain) {
                    html += "<option value='" + l.getTopicmain_id() + "'>" + l.getTopicmain_name() + "</option>";
                }
                out.print(html);
            } else if (type.equals("gettopicminor")) {
                List<ET_Topicminor> listminor = TopicminorService.listtopicminor();
                String html = "";

                for (ET_Topicminor l : listminor) {

                    html += "<option value='" + l.getTopicminor_id() + "'>" + l.getTopicminor_name() + "</option>";
                }
                out.print(html);


            } else if (type.equals("getcourse")) {
                List<ET_Course> listcourse = CourseService.getlistcourse();
                String html = "";

                for (ET_Course l : listcourse) {
                    html += "<option value='" + l.getCourse_id() + "'>" + l.getCourse_name() + "</option>";
                }
                out.print(html);

            } else if (type.equals("addgroup")) {
                String topicmain_id = request.getParameter("topicmain_id").trim();
                String topicminor_id = request.getParameter("topicminor_id").trim();
                String course_name = request.getParameter("course_name").trim();

                Boolean status = GroupService.addgroup(topicmain_id, topicminor_id, course_name);
                if (status) {
                    out.print("true");
                } else {
                    out.print("false");
                }

            } else if (type.equals("gettablegroup")) {
                try {
                    List<ET_Group> list = GroupService.getlistgroupall();

                    String html = "";
                    html += "<div class='table-responsive'>";
                    html += "<table class='table  table-sm text-center text-nowrap' id='table_group'>";
                    html += "<thead>";
                    html += "<tr>";
                    html += "<th>ลำดับ</th>";
                    html += "<th>หมวดหลัก</th>";
                    html += "<th>หมวดย่อย</th>";
                    html += "<th>หลักสูตร</th>";
                    html += "<th>เเก้ไข</th>";
                    html += "<th>ลบ</th>";
                    html += "</tr>";
                    html += "</thead>";
                    html += "<tbody>";
                    for (int i = 0; i < list.size(); i++) {
                        html += "<tr>";
                        html += "<td>" + (i + 1) + "</td>";
                        html += "<td>" + list.get(i).getMain_topicmain_name() + "</td>";
                        html += "<td>" + list.get(i).getMain_topicminor_name() + "</td>";
                        html += "<td>" + list.get(i).getMain_course_name() + "</td>";
                        html += "<td><button type='button' class='btn btn-warning btn-sm' onclick='editgroup(" + list.get(i).getGroup_id() + "," + list.get(i).getMain_topicmain_id() + "," + list.get(i).getMain_topicminor_id() + "," + list.get(i).getMain_course_id() + ")'>เเก้ไข</button></td>";
                        html += "<td><button type='button' class='btn btn-danger btn-sm' onclick='delgroup(" + list.get(i).getGroup_id() + ")'>ลบ</button></td>";
                        html += "</tr>";
                    }
                    html += "</tbody>";
                    html += "</table>";
                    html += "</div>";
                    out.print(html);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("delgroup")) {
                try {
                    String main_id = request.getParameter("main_id").trim();

                    Boolean status = GroupService.delgroup(main_id);

                    if (status) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("getgroupbyid")) {
                try {
                    String main_id = request.getParameter("main_id").trim();

                    List<ET_Group> list = GroupService.getlistgroupallbyid(main_id);

                    JSONObject obj = new JSONObject();
                    obj.put("group_id", list.get(0).getGroup_id());
                    obj.put("topicmain_id", list.get(0).getMain_topicmain_id());
                    obj.put("topicmain_name", list.get(0).getMain_topicmain_name());
                    obj.put("topicminor_id", list.get(0).getMain_topicminor_id());
                    obj.put("topicminor_name", list.get(0).getMain_topicminor_name());
                    obj.put("course_id", list.get(0).getMain_course_id());
                    obj.put("course_name", list.get(0).getMain_course_name());

                    out.print(obj);

                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("updategroup")) {
                try {
                    String main_id = request.getParameter("main_id").trim();
                    String topicmain_id = request.getParameter("topicmain_id").trim();
                    String topicminor_id = request.getParameter("topicminor_id").trim();
                    String course_id = request.getParameter("course_name").trim();

                    Boolean status = GroupService.updategroup(main_id, topicmain_id, topicminor_id, course_id);

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Group.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Group.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /** 
     * Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
