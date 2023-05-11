/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.google.gson.Gson;
import com.pg.lib.model.ET_Course;
import com.pg.lib.model.ET_Employee;
import com.pg.lib.model.ET_Topicminor;
import com.pg.lib.model.ET_Training;
import com.pg.lib.service.EmployeeService;
import com.pg.lib.service.TrainingService;
import com.pg.lib.utility.Utility;
import java.io.*;
import java.net.*;

import java.util.HashMap;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.JSONArray;
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


                    Boolean CheckTraining = TrainingService.CheckTraining(topicmain_id, topicminor_id, course_id, company, expenses, date, year, address, hour);

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

                    List<ET_Training> list = TrainingService.gettabletraining(start, length, searchValue);

                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("draw", draw);
                    obj.put("recordsTotal", TrainingService.gettotletabletraining());
                    obj.put("recordsFiltered", TrainingService.getfilteredtabletraining(searchValue));
                    obj.put("data", gson.toJsonTree(list));

                    response.setContentType("application/json");
                    response.getWriter().write(obj.toString());

                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("getdatatrainingbyid")) {
                try {
                    String id = request.getParameter("training_id").trim();

                    List<ET_Training> list = TrainingService.getdatatrainingbyid(id);
                    List<ET_Employee> listid = EmployeeService.getemployeebytraining_id(id);
                    List<ET_Employee> listem = EmployeeService.getemployeebylistid(listid);

                    JSONArray arr = new JSONArray();


                    for (ET_Employee l : listem) {

                        String employee_group = "";
                        if (l.getEmployee_pwgroup().equals("M")) {
                            employee_group = "รายเดือน";
                        } else if (l.getEmployee_pwgroup().equals("D")) {
                            employee_group = "รายวัน";
                        }

                        JSONObject objem = new JSONObject();
                        objem.put("employee_id", l.getEmployee_id());
                        objem.put("employee_idcard", l.getEmployee_idcard());
                        objem.put("employee_prefixdesc", l.getEmployee_prefixdesc());
                        objem.put("employee_fname", l.getEmployee_fname());
                        objem.put("employee_lname", l.getEmployee_lname());
                        objem.put("employee_posiddesc", l.getEmployee_posiddesc());
                        objem.put("employee_deptdesc", l.getEmployee_deptdesc());
                        objem.put("employee_ct", l.getEmployee_ct());
                        objem.put("employee_startdate", l.getEmployee_startdate());
                        objem.put("employee_birthday", l.getEmployee_birthday());
                        objem.put("employee_employment", employee_group);

                        objem.put("employee_age", Utility.GetWorkTime(l.getEmployee_startdate()));
                        objem.put("btn_del", "<button class='btn btn-danger btn-sm' type='button' onclick='del_employee_edit(" + id + "," + l.getEmployee_id() + ")' >ลบ</button>");
                        arr.put(objem);
                    }

                    JSONObject obj = new JSONObject();
                    obj.put("training_id", list.get(0).getTraining_id());
                    obj.put("training_company", list.get(0).getTraining_company());
                    obj.put("training_expenses", list.get(0).getTraining_expenses());
                    obj.put("training_datetraining", list.get(0).getTraining_datetraining());
                    obj.put("training_year", list.get(0).getTraining_year());
                    obj.put("training_hour", list.get(0).getTraining_hour());
                    obj.put("training_address", list.get(0).getTraining_address());
                    obj.put("training_address_id", list.get(0).getAddress_id());
                    obj.put("training_topicmain_id", list.get(0).getTraining_topicmain_id());
                    obj.put("training_topicmain_name", list.get(0).getTraining_topicmain());
                    obj.put("training_topicminor_id", list.get(0).getTraining_topminor_id());
                    obj.put("training_topicminor_name", list.get(0).getTraining_topminor());
                    obj.put("training_course", list.get(0).getTraining_course());

                    obj.put("listem", arr);

                    out.print(obj);

                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("deltraining")) {
                try {
                    String id = request.getParameter("training_id").trim();
                    Boolean statustraining = TrainingService.deltraining(id);

                    if (statustraining) {
                        Boolean statusemployee = EmployeeService.delemployee(id);
                        if (statusemployee) {
                            out.print("true");
                        } else {
                            out.print("false");
                        }
                    } else {
                        out.print("false");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("updatetraining")) {
                try {

                    String edit_training_id = request.getParameter("edit_training_id").trim();
                    String edit_topicmain_id = request.getParameter("edit_topicmain_id").trim();
                    String edit_topicminor_id = request.getParameter("edit_topicminor_id").trim();
                    String edit_course_id = request.getParameter("edit_course_id").trim();
                    String edit_company = request.getParameter("edit_company").trim();
                    String edit_expenses = request.getParameter("edit_expenses").trim();
                    String edit_date = request.getParameter("edit_date").trim();
                    String edit_year = request.getParameter("edit_year").trim();
                    String edit_address = request.getParameter("edit_address").trim();
                    String edit_hour = request.getParameter("edit_hour").trim();


                    if (TrainingService.CheckTraining(edit_topicmain_id, edit_topicminor_id, edit_course_id, edit_company, edit_expenses, edit_date, edit_year, edit_address, edit_hour)) {
                        Boolean statusupdate = TrainingService.updatetraining(edit_training_id, edit_topicmain_id, edit_topicminor_id, edit_course_id, edit_company, edit_expenses, edit_date, edit_year, edit_address, edit_hour);
                        if (statusupdate) {
                            out.print("true");
                        } else {
                            out.print("false2");
                        }
                    } else {
                        out.print("false1");
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
