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
