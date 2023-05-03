/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.pg.lib.model.ET_Topicmain;
import com.pg.lib.service.TopicmainService;
import java.io.*;
import java.net.*;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.JSONObject;

/**
 *
 * @author pakutsing
 */
public class Topicmain extends HttpServlet {

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
                try {
                    List<ET_Topicmain> list = TopicmainService.listtopicmain();

                    String html = "";
                    html += "<div class='table-responsive'>";
                    html += "<table class='table table-striped  table-sm text-center text-nowrap' id='table_topicmain'>";
                    html += "<thead>";
                    html += "<tr>";
                    html += "<th>ลำดับ</th>";
                    html += "<th>ชื่อ</th>";
                    html += "<th>วันที่สร้าง</th>";
                    html += "<th>วันที่เเก้ไข</th>";
                    html += "<th>เเก้ไข</th>";
                    html += "<th>ลบ</th>";
                    html += "</tr>";
                    html += "</thead>";
                    html += "<tbody>";
                    for (int i = 0; i < list.size(); i++) {
                        html += "<tr>";
                        html += "<td>" + (i + 1) + "</td>";
                        html += "<td>" + list.get(i).getTopicmain_name() + "</td>";
                        html += "<td>" + list.get(i).getTopicmain_date_create() + "</td>";
                        html += "<td>" + list.get(i).getTopicmain_date_modify() + "</td>";
                        html += "<td><button type='button' class='btn btn-warning btn-sm' onclick='edittopicmain(" + list.get(i).getTopicmain_id() + ")'>เเก้ไข</button></td>";
                        html += "<td><button type='button' class='btn btn-danger btn-sm' onclick='deltopicmain(" + list.get(i).getTopicmain_id() + ")'>ลบ</button></td>";
                        html += "</tr>";
                    }
                    html += "</tbody>";
                    html += "</table>";
                    html += "</div>";
                    out.print(html);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("addtopicmain")) {
                String name = request.getParameter("name").trim();
                Boolean status = TopicmainService.addtopic(name);

                if (status) {
                    out.print("true");
                } else {
                    out.print("false");
                }

            } else if (type.equals("deltopicmain")) {
                String id = request.getParameter("id").trim();
                Boolean status = TopicmainService.deltopic(id);

                if (status) {
                    out.print("true");
                } else {
                    out.print("false");
                }

            } else if (type.equals("gettopicmainbyid")) {
                String id = request.getParameter("id").trim();
                try {

                    List<ET_Topicmain> list = TopicmainService.gettopicmainbyid(id);
                    JSONObject obj = new JSONObject();
                    obj.put("id", list.get(0).getTopicmain_id());
                    obj.put("name", list.get(0).getTopicmain_name());

                    out.print(obj);
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("updatetopicmainbyid")) {
                String name = request.getParameter("name").trim();
                String id = request.getParameter("id").trim();
                try {

                    Boolean status = TopicmainService.updatetopic(name, id);
                    if (status) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("getlisttopicmain")) {
                try {
                    List<ET_Topicmain> list = TopicmainService.listtopicmain();

                    String html = "";

                    for (int i = 0; i < list.size(); i++) {
                        html += "<option value='" + list.get(i).getTopicmain_id() + "'>" + list.get(i).getTopicmain_name() + "</option>";

                    }

                    out.print(html);
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
            Logger.getLogger(Topicmain.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Topicmain.class.getName()).log(Level.SEVERE, null, ex);
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
