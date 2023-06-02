/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.google.gson.Gson;
import com.pg.lib.model.ET_Training;
import com.pg.lib.service.ReportService;
import com.pg.lib.service.TrainingService;
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
public class Report extends HttpServlet {

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

            if (type.equals("getdatatrainingbytopic")) {
                try {
                    int draw = Integer.parseInt(request.getParameter("draw"));
                    int start = Integer.parseInt(request.getParameter("start"));
                    int length = Integer.parseInt(request.getParameter("length"));
                    String searchValue = request.getParameter("search[value]");
                    String orderColumn = request.getParameter("order[0][column]");
                    String orderDir = request.getParameter("order[0][dir]");

                    String search_topicmain_id = request.getParameter("search_topicmain_id").trim();
                    String search_topicminor_id = request.getParameter("search_topicminor_id").trim();
                    String search_course_id = "";
                    String search_date_start = request.getParameter("search_date_start").trim();
                    String search_date_end = request.getParameter("search_date_end").trim();
                    String search_year = request.getParameter("search_year").trim();
                    String search_address = request.getParameter("search_address").trim();

                    List<ET_Training> list = ReportService.gettabletraining(start, length, searchValue, search_topicmain_id, search_topicminor_id, search_course_id, search_date_start, search_date_end, search_year, search_address);

                    System.out.println(search_address);
                    System.out.println(list.size());
                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("draw", draw);
                    obj.put("recordsTotal", ReportService.gettotletabletraining());
                    obj.put("recordsFiltered", ReportService.getfilteredtabletraining(searchValue, search_topicmain_id, search_topicminor_id, search_course_id, search_date_start, search_date_end, search_year, search_address));
                    obj.put("data", gson.toJsonTree(list));

                    response.setContentType("application/json");
                    response.getWriter().write(obj.toString());

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
