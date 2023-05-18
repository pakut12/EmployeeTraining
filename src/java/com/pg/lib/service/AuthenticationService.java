/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.ET_User;
import com.pg.lib.utility.ConnectDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pakutsing
 */
public class AuthenticationService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public static boolean checkStatusWorking(String user) {
        boolean statusWorking = false;
        try {
            conn = ConnectDB.getConnection();
            ps = conn.prepareStatement("SELECT pwstatwork FROM v_pwemployee WHERE pwemployee = ?");
            ps.setString(1, user);
            rs = ps.executeQuery();

            if (rs.next()) {
                if (!rs.getString("pwstatwork").trim().equals("Y")) {
                    statusWorking = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                ps.close();
                ConnectDB.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return statusWorking;
    }

    public static boolean Checklogin(String username, String digestpass) {

        boolean statusLogin = false;
        try {
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement("SELECT count(*) as statuslogin from ET_USER where user_user = ? and user_pass = ? ");
            ps.setString(1, username);
            ps.setString(2, digestpass);
            rs = ps.executeQuery();

            if (rs.next()) {
                if (rs.getInt("statuslogin") > 0) {

                    statusLogin = true;
                } else {
                    statusLogin = false;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                ps.close();
                ConnectDB.closeConnection(conn);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return statusLogin;
    }

    public static  List<ET_User> GetEmployee(String userid) {
        List<ET_User> list = new ArrayList<ET_User>();
        try {
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement("SELECT * from ET_USER where user_user = ? ");
            ps.setString(1, userid);
            rs = ps.executeQuery();
            while (rs.next()) {
                ET_User user = new ET_User();
                user.setUser_id(rs.getString("user_id"));
                user.setUser_user(rs.getString("user_user"));
                user.setUser_pass(rs.getString("user_pass"));
                user.setUser_name(rs.getString("user_name"));
                user.setUser_status(rs.getString("user_status"));
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                rs.close();
                ps.close();
                ConnectDB.closeConnection(conn);
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return list;
    }
}
