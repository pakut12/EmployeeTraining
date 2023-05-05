/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.ET_Course;
import com.pg.lib.model.ET_Employee;
import com.pg.lib.model.ET_Topicminor;
import com.pg.lib.model.ET_Training;
import com.pg.lib.utility.ConnectDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pakutsing
 */
public class EmployeeService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public static List<ET_Employee> getemployeebyid(String employeebyid) throws SQLException {
        List<ET_Employee> listemployee = new ArrayList<ET_Employee>();

        try {
            String sql = "select * from V_PWEMPLOYEE where PWEMPLOYEE = ?";
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, employeebyid);

            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Employee em = new ET_Employee();
                em.setEmployee_id(rs.getString("PWEMPLOYEE"));
                em.setEmployee_idcard(rs.getString("PWIDCARD"));
                em.setEmployee_prefixdesc(rs.getString("PREFIXDESC"));
                em.setEmployee_fname(rs.getString("PWFNAME"));
                em.setEmployee_lname(rs.getString("PWLNAME"));
                em.setEmployee_posiddesc(rs.getString("PWPOSIDESC"));
                em.setEmployee_deptdesc(rs.getString("PWDEPTDESC"));
                em.setEmployee_ct(rs.getString("PWCOST"));
                em.setEmployee_startdate(rs.getString("PWSTARTDATE"));
                listemployee.add(em);
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
            rs.close();
        }

        return listemployee;
    }
}
