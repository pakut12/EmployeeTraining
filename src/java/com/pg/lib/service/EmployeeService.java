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
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author pakutsing
 */
public class EmployeeService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    private static int getprimarykey() throws SQLException {
        int primarykey = 0;
        try {
            String sql = "SELECT MAX(employee_id) FROM et_employee ";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                primarykey = rs.getInt("MAX(employee_id)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
            rs.close();
        }
        return primarykey;
    }

    public static Boolean addemployeebyid(String employeeid, String training_id) throws SQLException {
        int primarykey = getprimarykey() + 1;
        Boolean status = false;
        try {

            String sql = "INSERT INTO et_employee (employee_id,training_id , employee) VALUES (?, ?, ?) ";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, primarykey);
            ps.setString(2, training_id);
            ps.setString(3, employeeid);

            if (ps.executeUpdate() > 0) {
                status = true;
            } else {
                status = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return status;
    }

    public static Boolean addemployee(String[] listemployeeid, String training_id) throws SQLException {
        int primarykey = getprimarykey() + 1;

        Boolean status = false;
        try {

            String sql = "INSERT INTO et_employee (employee_id,training_id , employee) VALUES (?, ?, ?) ";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);

            for (String id : listemployeeid) {
                ps.setInt(1, primarykey);
                ps.setString(2, training_id);
                ps.setString(3, id);
                ps.addBatch();
                primarykey++;
            }

            ps.executeBatch();

            status = true;

        } catch (Exception e) {
            status = false;
            e.printStackTrace();

        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();

        }

        return status;
    }

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
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return listemployee;
    }

    public static List<ET_Employee> getemployeebylistid(List<ET_Employee> listem) throws SQLException {
        List<ET_Employee> listemployee = new ArrayList<ET_Employee>();

        try {
            String sql = "select * from V_PWEMPLOYEE where PWEMPLOYEE in (";
            for (int n = 0; n < listem.size(); n++) {
                if (n < listem.size() - 1) {
                    sql += "'" + listem.get(n).getEmployee_id() + "',";
                } else {
                    sql += "'" + listem.get(n).getEmployee_id() + "')";
                }

            }

            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement(sql);
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
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return listemployee;
    }

    public static List<ET_Employee> getemployeebytraining_id(String training_id) throws SQLException {
        List<ET_Employee> listemployee = new ArrayList<ET_Employee>();

        try {
            String sql = "SELECT * FROM et_employee where training_id = ?";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setString(1, training_id);

            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Employee em = new ET_Employee();
                em.setEmployee_id(rs.getString("employee"));
                listemployee.add(em);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return listemployee;
    }

    public static Boolean delemployee(String training_id) throws SQLException {

        Boolean status = false;
        try {
            String sql = "DELETE FROM et_employee WHERE training_id = ? ";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setString(1, training_id);

            if (ps.executeUpdate() > 0) {
                status = true;
            } else {
                status = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return status;
    }

    public static Boolean delemployeebyid(String training_id, String employee_id) throws SQLException {

        Boolean status = false;
        try {
            String sql = "DELETE FROM et_employee WHERE training_id = ? and employee = ? ";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setString(1, training_id);
            ps.setString(2, employee_id);

            if (ps.executeUpdate() > 0) {
                status = true;
            } else {
                status = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return status;
    }
}
