/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.pg.lib.model.ET_Training;
import com.pg.lib.service.GroupService;
import com.pg.lib.utility.UploadFile;
import java.io.*;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author pakutsing
 */
public class UploadData extends HttpServlet {

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
            try {
                List<ET_Training> list = UploadFile.ReadFile();

                for (ET_Training l : list) {

                    out.print("----------------------------------------------------------------------<br>");

                    out.print("บริษัท : " + l.getTraining_company() + "<br>");
                    out.print("ประจำปี : " + l.getTraining_year() + "<br>");
                    out.print("วันที่อบรม : " + l.getTraining_datetraining() + "<br>");
                    out.print("ชั่วโมง : " + l.getTraining_hour() + "<br>");
                   
                    out.print("ประเภท : " + l.getTraining_type() + "<br>");
                    out.print("ค่าใช้จ่าย  : " + l.getTraining_expenses() + "<br>");
                    out.print("สถาบันที่จัดอบรม : " + l.getAddress_id() + "<br>");
                    out.print("รหัสพนักงาน : " + l.getTraining_employee() + "<br>");

                    out.print("รหัสหลักสูตร : " + l.getTraining_groupid() + "<br>");

                    out.print("----------------------------------------------------------------------");


                }
            } catch (Exception e) {
                e.printStackTrace();
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
            Logger.getLogger(UploadData.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(UploadData.class.getName()).log(Level.SEVERE, null, ex);
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
