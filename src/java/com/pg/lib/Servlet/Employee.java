/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.pg.lib.model.ET_Employee;
import com.pg.lib.service.EmployeeService;
import com.pg.lib.utility.Utility;
import java.io.*;
import java.net.*;

import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.JSONObject;

/**
 *
 * @author pakutsing
 */
public class Employee extends HttpServlet {

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
            if (type.equals("getemployeebyid")) {
                try {
                    String employee_id = request.getParameter("employee_id").trim();
                    List<ET_Employee> list = EmployeeService.getemployeebyid(employee_id);

                    String employee_group = "";
                    if (list.get(0).getEmployee_pwgroup().equals("M")) {
                        employee_group = "รายเดือน";
                    } else if (list.get(0).getEmployee_pwgroup().equals("D")) {
                        employee_group = "รายวัน";
                    }

                    JSONObject obj = new JSONObject();
                    obj.put("employee_id", list.get(0).getEmployee_id());
                    obj.put("employee_idcard", list.get(0).getEmployee_idcard());
                    obj.put("employee_prefixdesc", list.get(0).getEmployee_prefixdesc());
                    obj.put("employee_fname", list.get(0).getEmployee_fname());
                    obj.put("employee_lname", list.get(0).getEmployee_lname());
                    obj.put("employee_posiddesc", list.get(0).getEmployee_posiddesc());
                    obj.put("employee_deptdesc", list.get(0).getEmployee_deptdesc());
                    obj.put("employee_ct", list.get(0).getEmployee_ct());
                    obj.put("employee_startdate", list.get(0).getEmployee_startdate());
                    obj.put("employee_employment", employee_group);
                    obj.put("employee_birthday", list.get(0).getEmployee_birthday());
                    obj.put("employee_age", Utility.GetWorkTime(list.get(0).getEmployee_startdate()));

                    out.print(obj);
                } catch (Exception e) {
                    e.printStackTrace();
                }


            } else if (type.equals("delemployeebyid")) {
                try {
                    String training_id = request.getParameter("training_id").trim();
                    String employee_id = request.getParameter("employee_id").trim();

                    Boolean status = EmployeeService.delemployeebyid(training_id, employee_id);

                    if (status) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("addemployeebyid")) {
                try {
                    String training_id = request.getParameter("training_id").trim();
                    String employee_id = request.getParameter("employee_id").trim();

                    Boolean statuschk = EmployeeService.Chkemployeebyid(training_id, employee_id);

                    if (statuschk) {
                        Boolean status = EmployeeService.addemployeebyid(employee_id, training_id);
                        if (status) {
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

            } else if (type.equals("updateresult")) {
                try {
                    String[] id = request.getParameter("listem").trim().split(",");
                    String result = request.getParameter("result").trim();
                    String idt = request.getParameter("idt").trim();

                    Boolean status = EmployeeService.updateresult(id, result, idt);

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
