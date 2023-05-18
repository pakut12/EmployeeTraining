/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.pg.lib.model.ET_User;
import com.pg.lib.service.AuthenticationService;
import java.io.*;
import java.math.BigInteger;
import java.net.*;

import java.security.MessageDigest;
import java.util.List;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author pakutsing
 */
public class Chkauthen extends HttpServlet {

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

            if (type.equals("login")) {
                try {
                    String username = request.getParameter("username").trim();
                    String password = request.getParameter("password").trim();
                    HttpSession session = request.getSession();


                    String url = "";
                    if (AuthenticationService.Checklogin(username, password)) {
                        List<ET_User> listuser = AuthenticationService.GetEmployee(username);
                        session.setAttribute("statuslogin", "1");
                        session.setAttribute("user", username);
                        session.setAttribute("name", listuser.get(0).getUser_name());
                        session.setAttribute("statususer", listuser.get(0).getUser_status());
                        url = "/index.jsp";
                    } else {
                        session.setAttribute("statuslogin", "0");
                        url = "/login.jsp?error=0";
                        request.setAttribute("error", "0");
                    }
                    getServletContext().getRequestDispatcher(url).forward(request, response);

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("logout")) {
                try {
                    HttpSession session = request.getSession();
                    session.removeAttribute("statuslogin");
                    session.removeAttribute("name");
                    session.removeAttribute("user");
                    session.removeAttribute("statususer");
                    session.invalidate();
                    getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);

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
