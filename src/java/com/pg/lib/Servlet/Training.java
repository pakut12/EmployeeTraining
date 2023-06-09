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

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
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
            throws ServletException, IOException, SQLException {
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
                    String type_id = request.getParameter("add_type").trim();

                    Boolean CheckTraining = TrainingService.CheckTraining(topicmain_id, topicminor_id, course_id, company, expenses, date, year, address, hour, type_id);

                    if (CheckTraining) {
                        HashMap statusaddtraining = TrainingService.addtraining(topicmain_id, topicminor_id, course_id, company, expenses, date, year, address, hour, listemployeeid, type_id);
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

                    String search_topicmain_id = request.getParameter("search_topicmain_id").trim();
                    String search_topicminor_id = request.getParameter("search_topicminor_id").trim();
                    String search_course_id = request.getParameter("search_course_id").trim();
                    String search_date_start = request.getParameter("search_date_start").trim();
                    String search_date_end = request.getParameter("search_date_end").trim();
                    String search_year = request.getParameter("search_year").trim();
                    String search_address = request.getParameter("search_address").trim();


                    List<ET_Training> list = TrainingService.gettabletraining(start, length, searchValue, search_topicmain_id, search_topicminor_id, search_course_id, search_date_start, search_date_end, search_year, search_address);

                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("draw", draw);
                    obj.put("recordsTotal", TrainingService.gettotletabletraining());
                    obj.put("recordsFiltered", TrainingService.getfilteredtabletraining(searchValue, search_topicmain_id, search_topicminor_id, search_course_id, search_date_start, search_date_end, search_year, search_address));
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

                    HashMap<String, String> listresult = EmployeeService.getemployeeresult(id);

                    JSONArray arr = new JSONArray();
                    int n = 0;
                    String typehtml = "";
                    if (list.get(0).getTraining_type().equals("0")) {
                        typehtml += "<option value='0'>-</option>";
                        typehtml += "<option value='1'>ภายใน</option>";
                        typehtml += "<option value='2'>ภายนอก</option>";
                    } else if (list.get(0).getTraining_type().equals("1")) {
                        typehtml += "<option value='1'>ภายใน</option>";
                        typehtml += "<option value='0'>-</option>";
                        typehtml += "<option value='2'>ภายนอก</option>";
                    } else if (list.get(0).getTraining_type().equals("2")) {
                        typehtml += "<option value='2'>ภายนอก</option>";
                        typehtml += "<option value='0'>-</option>";
                        typehtml += "<option value='1'>ภายใน</option>";
                    }
                    for (ET_Employee l : listem) {

                        String employee_group = "";
                        if (l.getEmployee_pwgroup().equals("M")) {
                            employee_group = "รายเดือน";
                        } else if (l.getEmployee_pwgroup().equals("D")) {
                            employee_group = "รายวัน";
                        }

                        String result = "";
                        if (listresult.get(l.getEmployee_id()).equals("0")) {
                            result = "<div class='text-danger'>ไม่ผ่าน</div>";
                        } else if (listresult.get(l.getEmployee_id()).equals("1")) {
                            result = "<div class='text-success'>ผ่าน</div>";
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
                        objem.put("employee_result", result);

                        objem.put("employee_age", Utility.GetWorkTime(l.getEmployee_startdate()));
                        objem.put("employee_company", l.getEmployee_company());
                        objem.put("btn_del", "<button class='btn btn-danger btn-sm' type='button' onclick='del_employee_edit(" + id + "," + l.getEmployee_id() + ")' >ลบ</button>");

                        arr.put(objem);
                        n++;
                    }

                    JSONObject obj = new JSONObject();
                    obj.put("training_id", list.get(0).getTraining_id());
                    obj.put("training_company", list.get(0).getTraining_company());
                    obj.put("training_expenses", list.get(0).getTraining_expenses());
                    obj.put("training_datetraining", list.get(0).getTraining_datetraining().replaceAll(" 00:00:00.0", ""));
                    obj.put("training_year", list.get(0).getTraining_year());
                    obj.put("training_hour", list.get(0).getTraining_hour());
                    obj.put("training_address", list.get(0).getTraining_address());
                    obj.put("training_address_id", list.get(0).getAddress_id());
                    obj.put("training_topicmain_id", list.get(0).getTraining_topicmain_id());
                    obj.put("training_topicmain_name", list.get(0).getTraining_topicmain());
                    obj.put("training_topicminor_id", list.get(0).getTraining_topminor_id());
                    obj.put("training_topicminor_name", list.get(0).getTraining_topminor());
                    obj.put("training_course", list.get(0).getTraining_course());
                    obj.put("training_type", typehtml);

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
                    String edit_type = request.getParameter("edit_type").trim();

                    if (TrainingService.CheckTraining(edit_topicmain_id, edit_topicminor_id, edit_course_id, edit_company, edit_expenses, edit_date, edit_year, edit_address, edit_hour, edit_type)) {
                        Boolean statusupdate = TrainingService.updatetraining(edit_training_id, edit_topicmain_id, edit_topicminor_id, edit_course_id, edit_company, edit_expenses, edit_date, edit_year, edit_address, edit_hour, edit_type);
                        if (statusupdate) {
                            out.print("true");
                        } else {
                            out.print("false2");
                        }
                    } else {
                        out.print("true");
                    }


                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("getdatatrainingbyemid")) {
                try {

                    String id = request.getParameter("search_employee_id").trim();
                    String datestart = request.getParameter("search_datestart");
                    String dateend = request.getParameter("search_dateend");
                    String search_year = request.getParameter("search_year");

                    int draw = Integer.parseInt(request.getParameter("draw"));
                    int start = Integer.parseInt(request.getParameter("start"));
                    int length = Integer.parseInt(request.getParameter("length"));
                    String searchValue = request.getParameter("search[value]");
                    String orderColumn = request.getParameter("order[0][column]");
                    String orderDir = request.getParameter("order[0][dir]");

                    List<ET_Training> list = TrainingService.getdatatrainingbyemid(id, searchValue, start, length, datestart, dateend, search_year);

                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("draw", draw);
                    obj.put("recordsTotal", TrainingService.getdatatotaltrainingbyemid(id));
                    obj.put("recordsFiltered", TrainingService.getdatafilteredtrainingbyemid(id, searchValue, datestart, dateend, search_year));
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Training.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Training.class.getName()).log(Level.SEVERE, null, ex);
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
