/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.google.gson.Gson;
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
import org.json.JSONArray;
import org.json.JSONException;
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
            throws ServletException, IOException, SQLException, JSONException {
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
                    int draw = Integer.parseInt(request.getParameter("draw"));
                    int start = Integer.parseInt(request.getParameter("start"));
                    int length = Integer.parseInt(request.getParameter("length"));
                    String searchValue = request.getParameter("search[value]");
                    String orderColumn = request.getParameter("order[0][column]");
                    String orderDir = request.getParameter("order[0][dir]");

                    String search_topicmain_id = request.getParameter("search_topicmain_id").trim();
                    String search_topicminor_id = request.getParameter("search_topicminor_id").trim();


                    List<ET_Group> list = GroupService.getlistgroupall(searchValue, start, length, search_topicmain_id, search_topicminor_id);

                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("draw", draw);
                    obj.put("recordsTotal", GroupService.gettotaltablegroup(searchValue, search_topicmain_id, search_topicminor_id));
                    obj.put("recordsFiltered", GroupService.getfilteredtablegroup(searchValue, search_topicmain_id, search_topicminor_id));
                    obj.put("data", gson.toJsonTree(list));

                    response.setContentType("application/json");
                    response.getWriter().write(obj.toString());

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

            } else if (type.equals("test12")) {
                List<ET_Group> listgroup = GroupService.getlistgroupall();

                JSONArray arr = new JSONArray();
                for (ET_Group l : listgroup) {
                    JSONObject obj = new JSONObject();
                    obj.put("group_id", l.getGroup_id());
                    obj.put("topicmain_id", l.getMain_topicmain_id());
                    obj.put("topicmain_name", l.getMain_topicmain_name());
                    obj.put("topicminor_id", l.getMain_topicminor_id());
                    obj.put("topicminor_name", l.getMain_topicminor_name());
                    obj.put("course_name", l.getMain_course_name());
                    arr.put(obj);
                }
                out.print(arr);
                

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
            try {
                processRequest(request, response);
            } catch (JSONException ex) {
                Logger.getLogger(Group.class.getName()).log(Level.SEVERE, null, ex);
            }
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
            try {
                processRequest(request, response);
            } catch (JSONException ex) {
                Logger.getLogger(Group.class.getName()).log(Level.SEVERE, null, ex);
            }
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
