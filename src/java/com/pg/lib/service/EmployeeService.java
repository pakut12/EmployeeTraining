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
import com.pg.lib.utility.Utility;
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

    public static Boolean updateresult(String[] listem, String result, String training_id) throws SQLException {
        Boolean status = false;
        try {
            String sql = "UPDATE et_employee SET employee_result = ? WHERE employee = ? and training_id = ?";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);

            for (String em : listem) {
                ps.setString(1, result);
                ps.setString(2, em);
                ps.setString(3, training_id);
                ps.addBatch();
            }

            ps.executeBatch();

            status = true;

        } catch (Exception e) {
            status = false;
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
        }
        return status;

    }

    public static int getprimarykey() throws SQLException {
        int primarykey = 0;
        try {
            String sql = "SELECT MAX(employee_id) FROM et_employee ";
            conn = ConnectDB.getConnectionhr();
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

    public static Boolean Chkemployeebyid(String training_id, String employee) throws SQLException {
        Boolean status = false;
        int row = 0;
        try {
            String sql = "SELECT COUNT(*) FROM et_employee WHERE training_id = ? and employee = ?";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, training_id);
            ps.setString(2, employee);
            rs = ps.executeQuery();

            while (rs.next()) {
                row = rs.getInt("COUNT(*)");
            }

            if (row > 0) {
                status = false;
            } else {
                status = true;
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

    public static Boolean addemployeebyid(String employeeid, String training_id) throws SQLException {
        int primarykey = getprimarykey() + 1;
        Boolean status = false;
        try {

            String sql = "INSERT INTO et_employee (employee_id,training_id , employee, employee_result) VALUES (?, ?, ?,?) ";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, primarykey);
            ps.setString(2, training_id);
            ps.setString(3, employeeid);
            ps.setString(4, "0");

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

            String sql = "INSERT INTO et_employee (employee_id,training_id , employee,employee_result) VALUES (?, ?, ?,?) ";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);

            for (String id : listemployeeid) {
                ps.setInt(1, primarykey);
                ps.setString(2, training_id);
                ps.setString(3, id);
                ps.setString(4, "0");
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
            String sql = "select * from v_pwemployee@l_myhrpg where pwstatwork <> 'Y' and PWEMPLOYEE = ?";
            conn = ConnectDB.getConnectionhr();
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
                em.setEmployee_startdate(Utility.CoverDate(rs.getString("PWSTARTDATE")));
                em.setEmployee_birthday(Utility.CoverDate(rs.getString("PWBIRTHDAY")));
                em.setEmployee_pwgroup(rs.getString("PWGROUP"));
                em.setEmployee_company(rs.getString("PWCOMPANY"));
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
            String sql = "select * from v_pwemployee@l_myhrpg where pwstatwork <> 'Y' and PWEMPLOYEE in (";
            for (int n = 0; n < listem.size(); n++) {
                if (n < listem.size() - 1) {
                    sql += "'" + listem.get(n).getEmployee_id() + "',";
                } else {
                    sql += "'" + listem.get(n).getEmployee_id() + "')";
                }

            }

            conn = ConnectDB.getConnectionhr();
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
                em.setEmployee_startdate(Utility.CoverDate(rs.getString("PWSTARTDATE")));
                em.setEmployee_birthday(Utility.CoverDate(rs.getString("PWBIRTHDAY")));
                em.setEmployee_pwgroup(rs.getString("PWGROUP"));
                em.setEmployee_company(rs.getString("PWCOMPANY"));

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

    public static HashMap<String, String> getemployeeresult(String training_id) throws SQLException {
        HashMap<String, String> listresult = new HashMap<String, String>();

        try {
            String sql = "SELECT * FROM et_employee where training_id = ?";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, training_id);

            rs = ps.executeQuery();

            while (rs.next()) {
                listresult.put(rs.getString("employee"), rs.getString("employee_result"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return listresult;
    }

    public static List<ET_Employee> getemployeebytraining_id(String training_id) throws SQLException {
        List<ET_Employee> listemployee = new ArrayList<ET_Employee>();

        try {
            String sql = "SELECT * FROM et_employee where training_id = ?";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, training_id);

            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Employee em = new ET_Employee();
                em.setEmployee_id(rs.getString("employee"));
                em.setEmployee_result(rs.getString("employee_result"));
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
            conn = ConnectDB.getConnectionhr();
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
            conn = ConnectDB.getConnectionhr();
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
