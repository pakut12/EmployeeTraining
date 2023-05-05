/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.pg.lib.model.ET_Employee;
import com.pg.lib.service.EmployeeService;
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

                    
                    out.print(obj);
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
