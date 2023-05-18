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
public class UserService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    private static int Chackuser(String user_id) throws SQLException {
        int num = 0;
        try {
            String sql = "SELECT count(*) FROM et_user where user_user = ? ";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user_id);
            rs = ps.executeQuery();

            while (rs.next()) {
                num = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }
        return num;
    }

    private static int getprimarykey() throws SQLException {
        int primarykey = 0;
        try {
            String sql = "SELECT MAX(user_id) FROM et_user ";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                primarykey = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }
        return primarykey;
    }

    public static boolean adduser(String user_user, String user_pass, String user_name, String user_status) throws SQLException {
        boolean status = false;
        int Chackuser = Chackuser(user_user);
        System.out.println(Chackuser);

        int primarykey = getprimarykey() + 1;
        if (Chackuser == 0) {
            try {
                String sql = "INSERT INTO ET_USER (USER_ID, USER_USER, USER_PASS, USER_NAME, USER_STATUS) VALUES (?, ?, ?,?,?)";
                conn = ConnectDB.getConnectionhr();
                ps = conn.prepareStatement(sql);
                ps.setInt(1, primarykey);
                ps.setString(2, user_user);
                ps.setString(3, user_pass);
                ps.setString(4, user_name);
                ps.setString(5, user_status);

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
        }

        return status;
    }

    public static boolean deluser(String user_id) throws SQLException {
        boolean status = false;
        int primarykey = getprimarykey() + 1;
        try {
            String sql = "DELETE FROM ET_USER WHERE USER_ID = ?";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user_id);

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

    public static boolean updateuser(String user_id, String user_user, String user_pass, String user_name,String user_status) throws SQLException {
        boolean status = false;
        int primarykey = getprimarykey() + 1;
        try {
            String sql = "UPDATE ET_USER SET USER_USER = ?,USER_PASS = ?,USER_NAME = ?,USER_STATUS = ?  WHERE USER_ID = ?";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user_user);
            ps.setString(2, user_pass);
            ps.setString(3, user_name);
            ps.setString(4, user_status);
            ps.setString(5, user_id);

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

    public static int gettotletableuser() throws SQLException {
        int totle = 0;
        try {
            String sql = "SELECT COUNT(*) FROM ET_USER where user_id > 99";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                totle = rs.getInt("COUNT(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return totle;
    }

    public static int getfilteredtableuser(String searchValue) throws SQLException {
        int totle = 0;
        try {
            String sql = "select count(*) from ET_USER WHERE (user_id LIKE ? or user_name LIKE ? or user_user LIKE ? or user_pass LIKE ? or user_status LIKE ?) and user_id > 99 order by user_id";

            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchValue + "%");
            ps.setString(2, "%" + searchValue + "%");
            ps.setString(3, "%" + searchValue + "%");
            ps.setString(4, "%" + searchValue + "%");
            ps.setString(5, "%" + searchValue + "%");
            
            rs = ps.executeQuery();

            while (rs.next()) {
                totle = rs.getInt("COUNT(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return totle;
    }

    public static List<ET_User> getlistuser(int start, int length, String searchValue) throws SQLException {
        List<ET_User> listuser = new ArrayList<ET_User>();
        try {
            String sql = "SELECT * FROM(select rownum as rnum,r.* from ";
            sql += "(select * from ET_USER WHERE (user_id LIKE ? or user_name LIKE ? or user_user LIKE ? or user_pass LIKE ? or user_status LIKE ?) and user_id > 99 order by user_id)r) where rnum BETWEEN ? AND ? ";

            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchValue + "%");
            ps.setString(2, "%" + searchValue + "%");
            ps.setString(3, "%" + searchValue + "%");
            ps.setString(4, "%" + searchValue + "%");
            ps.setString(5, "%" + searchValue + "%");

            ps.setInt(6, start);
            ps.setInt(7, start + length);
            rs = ps.executeQuery();

            while (rs.next()) {
               
                ET_User user = new ET_User();
                user.setUser_id(rs.getString("user_id"));
                user.setUser_user(rs.getString("user_user"));
                user.setUser_pass(rs.getString("user_pass"));
                user.setUser_name(rs.getString("user_name"));
                user.setUser_status(rs.getString("user_status").toUpperCase());

                listuser.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return listuser;
    }

    public static List<ET_User> getlistuserbyid(String user_id) throws SQLException {
        List<ET_User> listuser = new ArrayList<ET_User>();
        try {
            String sql = "select * from ET_USER where user_id = ? ";

            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, user_id);
            rs = ps.executeQuery();

            while (rs.next()) {
                ET_User user = new ET_User();
                user.setUser_id(rs.getString("user_id"));
                user.setUser_user(rs.getString("user_user"));
                user.setUser_pass(rs.getString("user_pass"));
                user.setUser_name(rs.getString("user_name"));
                user.setUser_status(rs.getString("user_status"));
                listuser.add(user);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return listuser;
    }
}
