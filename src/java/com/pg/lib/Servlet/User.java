/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.google.gson.Gson;
import com.pg.lib.model.ET_Address;
import com.pg.lib.model.ET_User;
import com.pg.lib.service.AddressService;
import com.pg.lib.service.UserService;
import java.io.*;
import java.net.*;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.JSONObject;

/**
 *
 * @author pakutsing
 */
public class User extends HttpServlet {

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

            if (type.equals("adduser")) {
                try {
                    String user_user = request.getParameter("user_user").trim();
                    String user_pass = request.getParameter("user_pass").trim();
                    String user_name = request.getParameter("user_name").trim();
                    String user_status = request.getParameter("user_status").trim();

                    boolean status = UserService.adduser(user_user, user_pass, user_name, user_status);

                    if (status) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getlistuser")) {
                try {
                    int draw = Integer.parseInt(request.getParameter("draw"));
                    int start = Integer.parseInt(request.getParameter("start"));
                    int length = Integer.parseInt(request.getParameter("length"));
                    String searchValue = request.getParameter("search[value]");
                    String orderColumn = request.getParameter("order[0][column]");
                    String orderDir = request.getParameter("order[0][dir]");

                    List<ET_User> list = UserService.getlistuser(start, length, searchValue);

                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("draw", draw);
                    obj.put("recordsTotal", UserService.gettotletableuser());
                    obj.put("recordsFiltered", UserService.getfilteredtableuser(searchValue));
                    obj.put("data", gson.toJsonTree(list));

                    response.setContentType("application/json");
                    response.getWriter().write(obj.toString());

                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("getlistuserbyid")) {
                try {
                    String user_id = request.getParameter("user_id").trim();
                    List<ET_User> list = UserService.getlistuserbyid(user_id);

                    String user_status = "";
                    if (list.get(0).getUser_status().equals("admin")) {
                        user_status = "<option value='admin'>Admin</option><option value='user'>User</option>";
                    } else if (list.get(0).getUser_status().equals("user")) {
                        user_status = "<option value='user'>User</option><option value='admin'>Admin</option>";
                    }

                    JSONObject obj = new JSONObject();
                    obj.put("user_id", list.get(0).getUser_id().toString());
                    obj.put("user_user", list.get(0).getUser_user().toString());
                    obj.put("user_pass", list.get(0).getUser_pass().toString());
                    obj.put("user_name", list.get(0).getUser_name().toString());
                    obj.put("user_status", user_status);


                    out.print(obj);

                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("deluser")) {
                try {
                    String user_id = request.getParameter("user_id").trim();
                    boolean status = UserService.deluser(user_id);

                    if (status) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }



                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("updateuser")) {
                try {
                    String user_id = request.getParameter("user_id").trim();
                    String user_user = request.getParameter("user_user").trim();
                    String user_pass = request.getParameter("user_pass").trim();
                    String user_name = request.getParameter("user_name").trim();
                    String user_status = request.getParameter("user_status").trim();

                    boolean status = UserService.updateuser(user_id, user_user, user_pass, user_name,user_status);

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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(User.class.getName()).log(Level.SEVERE, null, ex);
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
