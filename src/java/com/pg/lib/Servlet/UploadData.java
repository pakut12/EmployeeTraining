/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.pg.lib.model.ET_Training;
import com.pg.lib.service.GroupService;
import com.pg.lib.utility.UploadFile;
import com.pg.lib.utility.Utility;
import java.io.*;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
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

                Boolean status = UploadFile.addemployeebyid(list);
                out.print(status);

            /*
            HashMap<String, String> ReadGroup = UploadFile.ReadGroup();
            HashMap<String, String> ReadTraining = UploadFile.ReadTraining();
            int n = 0;
            for (ET_Training l : list) {
            
            String type = Utility.ChackType(l.getTraining_type());
            String tid = l.getTraining_company() + "#" + l.getTraining_year() + "#" + l.getTraining_hour() + "#" + l.getTraining_datetraining() + "#" + l.getTraining_expenses() + "#" + l.getAddress_id() + "#" + ReadGroup.get(l.getTraining_topicmain_id() + "#" + l.getTraining_topminor_id() + "#" + l.getTraining_course());
            
            out.print(l.getTraining_company() + "#" + l.getTraining_year() + "#" + l.getTraining_hour() + "#" + l.getTraining_datetraining() + "#" + l.getTraining_expenses() + "#" + l.getAddress_id() + "#" + ReadGroup.get(l.getTraining_topicmain_id() + "#" + l.getTraining_topminor_id() + "#" + l.getTraining_course()));
            out.print("----------------------------------------------------------------------<br>");
            
            out.print("tid : " + ReadTraining.get(tid));
            out.print("บริษัท : " + l.getTraining_company() + "<br>");
            out.print("ประจำปี : " + l.getTraining_year() + "<br>");
            out.print("วันที่อบรม : " + l.getTraining_datetraining() + "<br>");
            out.print("ชั่วโมง : " + l.getTraining_hour() + "<br>");
            out.print("หลักสูตร : " + l.getTraining_course() + "<br>");
            out.print("รหัสกลุ่ม : " + ReadGroup.get(l.getTraining_topicmain_id() + "#" + l.getTraining_topminor_id() + "#" + l.getTraining_course()) + "<br>");
            out.print("ประเภท : " + type + "<br>");
            out.print("ค่าใช้จ่าย  : " + l.getTraining_expenses() + "<br>");
            out.print("สถาบันที่จัดอบรม : " + l.getAddress_id() + "<br>");
            out.print("รหัสพนักงาน : " + l.getTraining_employee() + "<br>");
            
            out.print("----------------------------------------------------------------------<br>");
            n++;
            
            }
            out.print("ยอด" + n);
             */
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
