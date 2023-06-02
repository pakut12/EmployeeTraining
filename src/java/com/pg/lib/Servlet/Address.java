/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.Servlet;

import com.google.gson.Gson;
import com.pg.lib.model.ET_Address;
import com.pg.lib.service.AddressService;
import java.io.*;
import java.net.*;

import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.http.*;
import org.json.JSONObject;

/**
 *
 * @author pakutsing
 */
public class Address extends HttpServlet {

    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException, NamingException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String type = request.getParameter("type").trim();

            if (type.equals("addaddress")) {
                try {
                    String address_name = request.getParameter("address_name").trim();
                    String address_address = request.getParameter("address_address").trim();

                    Boolean status = AddressService.addaddress(address_name, address_address);

                    if (status) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("gettableaddress")) {
                try {
                    int draw = Integer.parseInt(request.getParameter("draw"));
                    int start = Integer.parseInt(request.getParameter("start"));
                    int length = Integer.parseInt(request.getParameter("length"));
                    String searchValue = request.getParameter("search[value]");
                    String orderColumn = request.getParameter("order[0][column]");
                    String orderDir = request.getParameter("order[0][dir]");

                    List<ET_Address> list = AddressService.gettableaddress(start, length, searchValue);

                    Gson gson = new Gson();

                    JSONObject obj = new JSONObject();
                    obj.put("draw", draw);
                    obj.put("recordsTotal", AddressService.gettotletableaddress());
                    obj.put("recordsFiltered", AddressService.getfilteredtableaddress(searchValue));
                    obj.put("data", gson.toJsonTree(list));

                    response.setContentType("application/json");
                    response.getWriter().write(obj.toString());

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("deladdress")) {
                try {
                    String address_id = request.getParameter("address_id").trim();

                    Boolean status = AddressService.deladdress(address_id);

                    if (status) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else if (type.equals("getaddressbyid")) {

                try {
                    String address_id = request.getParameter("address_id").trim();
                    List<ET_Address> listaddress = AddressService.getaddressbyid(address_id);

                    JSONObject obj = new JSONObject();
                    obj.put("address_id", listaddress.get(0).getAddress_id());
                    obj.put("address_name", listaddress.get(0).getAddress_name());
                    obj.put("address_address", listaddress.get(0).getAddress_address());

                    out.print(obj);

                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("updateaddressbyid")) {
                try {
                    String address_id = request.getParameter("address_id").trim();
                    String address_name = request.getParameter("address_name").trim();
                    String address_address = request.getParameter("address_address").trim();

                    Boolean status = AddressService.updateaddress(address_id, address_name, address_address);

                    if (status) {
                        out.print("true");
                    } else {
                        out.print("false");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else if (type.equals("getaddress")) {
                try {
                    List<ET_Address> listaddress = AddressService.getaddress();
                    String html = "";
                    
                    html += "<option value=''>โปรดเลือก</option>";
                    for (ET_Address l : listaddress) {
                        html += "<option value='" + l.getAddress_id() + "'>" + l.getAddress_name() + "</option>";
                    }
                    out.print(html);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NamingException ex) {
            Logger.getLogger(Address.class.getName()).log(Level.SEVERE, null, ex);
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
