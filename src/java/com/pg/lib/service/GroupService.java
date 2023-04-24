/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import java.sql.*;
import com.pg.lib.utility.ConnectDB;

/**
 *
 * @author pakutsing
 */
public class GroupService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    private static int getprimarykey() throws SQLException {
        int primarykey = 0;
        try {
            String sql = "SELECT MAX(et_main_id) FROM et_main ";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            
            while (rs.next()) {
                primarykey = rs.getInt(1);
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

    public static Boolean addgroup(String topicmain_id, String topicminor_id,String course_id) throws SQLException {
        int primarykey = getprimarykey() + 1;

        Boolean status = false;
        
        try {
            String sql = "INSERT INTO et_main (et_main_id,et_main_topicmain_id,et_main_topicminor_id,et_main_course_id) VALUES (?,?,?,?)";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
        
            if (ps.executeUpdate() > 0) {
                status = true;
            } else {
                status = false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
            rs.close();
        }
        return status;
    }
}
