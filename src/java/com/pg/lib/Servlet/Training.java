/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.google.gson.Gson;
import com.pg.lib.model.ET_Course;
import com.pg.lib.model.ET_Topicminor;
import com.pg.lib.model.ET_Training;
import com.pg.lib.service.EmployeeService;
import com.pg.lib.service.TrainingService;
import java.io.*;
import java.net.*;

import java.util.HashMap;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.JSONObject;

/**
 *
 * @author pakutsing
 */
public class Training extends HttpServlet {

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
            if (type.equals("gettopicminorbytopicmain_id")) {
                try {
                    String topicmain_id = request.getParameter("topicmain_id").trim();
                    List<ET_Topicminor> list = TrainingService.gettopicminorbytopicmain_id(topicmain_id);

                    String html = "";

                    for (int i = 0; i < list.size(); i++) {
                        html += "<option value='" + list.get(i).getTopicminor_id() + "'>" + list.get(i).getTopicminor_name() + "</option>";
                    }

                    out.print(html);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getcoursebytopicminor_id")) {
                try {
                    String topicmain_id = request.getParameter("topicmain_id").trim();
                    String topicminor_id = request.getParameter("topicminor_id").trim();

                    List<ET_Course> list = TrainingService.getcoursebytopicminor_id(topicmain_id, topicminor_id);

                    String html = "";

                    for (int i = 0; i < list.size(); i++) {
                        html += "<option value='" + list.get(i).getCourse_name() + "'>" + list.get(i).getCourse_name() + "</option>";
                    }

                    out.print(html);

                } catch (Exception e) {
                    e.printStackTrace();
                }


            } else if (type.equals("addtraining")) {
                try {
                    String topicmain_id = request.getParameter("add_topicmain_id").trim();
                    String topicminor_id = request.getParameter("add_topicminor_id").trim();
                    String course_id = request.getParameter("add_course_id").trim();
                    String company = request.getParameter("add_company").trim();
                    String expenses = request.getParameter("add_expenses").trim();
                    String date = request.getParameter("add_date").trim();
                    String year = request.getParameter("add_year").trim();
                    String address = request.getParameter("add_address").trim();
                    String hour = request.getParameter("add_hour").trim();
                    String[] listemployeeid = request.getParameter("listemployeeid").trim().split(",");


                    Boolean CheckTraining = TrainingService.CheckTraining(topicmain_id, topicminor_id, course_id, company, expenses, date, year, address, hour, listemployeeid);

                    if (CheckTraining) {
                        HashMap statusaddtraining = TrainingService.addtraining(topicmain_id, topicminor_id, course_id, company, expenses, date, year, address, hour, listemployeeid);
                        if (statusaddtraining.get("status").equals("true")) {
                            Boolean statusem = EmployeeService.addemployee(listemployeeid, statusaddtraining.get("id").toString());
                            if (statusem) {
                                out.print("true");
                            } else {
                                out.print("false3");
                            }

                        } else {
                            out.print("false2");
                        }
                    } else {
                        out.print("false1");
                    }



                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("getdatatraining")) {
                try {
                    int draw = Integer.parseInt(request.getParameter("draw"));
                    int start = Integer.parseInt(request.getParameter("start"));
                    int length = Integer.parseInt(request.getParameter("length"));
                    String searchValue = request.getParameter("search[value]");
                    String orderColumn = request.getParameter("order[0][column]");
                    String orderDir = request.getParameter("order[0][dir]");

                    List<ET_Training> list = TrainingService.gettabletraining(start,length);

                    System.out.println(list);

                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("draw", draw);
                    obj.put("recordsTotal", TrainingService.gettotletabletraining());
                    obj.put("recordsFiltered", 1000);
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
