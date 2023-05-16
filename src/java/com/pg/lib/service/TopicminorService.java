/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import java.sql.*;
import com.pg.lib.model.ET_Topicmain;
import com.pg.lib.model.ET_Topicminor;
import com.pg.lib.utility.ConnectDB;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

/**
 *
 * @author pakutsing
 */
public class TopicminorService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public static Boolean updatetopic(String name, String id) throws SQLException {
        
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        Boolean status = false;

        try {

            String sql = "UPDATE et_topicminor SET topicminor_name = ? ,topicminor_date_modify = TO_DATE(?, 'yyyy/mm/dd') WHERE topicminor_id = ?";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, formatter.format(date));
            ps.setString(3, id);


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

    private static int getprimarykey() throws SQLException {
        int primarykey = 0;
        try {
            Boolean status = false;
            String sql = "SELECT MAX(topicminor_id) as primarykey FROM et_topicminor";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                primarykey = rs.getInt("primarykey");
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

    public static List<ET_Topicminor> getbyidlisttopicminor(String id) throws SQLException {
        List<ET_Topicminor> list = new ArrayList();
        try {
            String sql = "SELECT * FROM et_topicminor where topicminor_id = ?";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Topicminor minor = new ET_Topicminor();
                minor.setTopicminor_id(rs.getString("topicminor_id"));
                minor.setTopicminor_name(rs.getString("topicminor_name"));
                minor.setTopicminor_date_create(rs.getString("topicminor_date_create"));
                minor.setTopicminor_date_modify(rs.getString("topicminor_date_modify"));
                list.add(minor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();

        }
        return list;
    }

    public static List<ET_Topicminor> listtopicminor() throws SQLException {
        List<ET_Topicminor> list = new ArrayList();
        try {
            String sql = "SELECT TO_CHAR(a.topicminor_date_create,'DD/MM/YYYY') as date_create,TO_CHAR(a.topicminor_date_modify,'DD/MM/YYYY') as date_modify,a.* FROM et_topicminor a order by a.TOPICMINOR_ID";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Topicminor minor = new ET_Topicminor();
                minor.setTopicminor_id(rs.getString("topicminor_id"));
                minor.setTopicminor_name(rs.getString("topicminor_name"));
                minor.setTopicminor_date_create(rs.getString("date_create"));
                minor.setTopicminor_date_modify(rs.getString("date_modify"));
                list.add(minor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();

        }
        return list;
    }

    public static Boolean addtopic(String name) throws SQLException {
        int primarykey = getprimarykey() + 1;

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        Boolean status = false;

        try {

            String sql = "INSERT INTO et_topicminor (topicminor_id, topicminor_name, topicminor_date_create) VALUES (?, ?, TO_DATE(?, 'yyyy/mm/dd'))";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, primarykey);
            ps.setString(2, name);
            ps.setString(3, formatter.format(date));


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

    public static Boolean deltopic(String id) throws SQLException {

        Boolean status = false;

        try {
            String sql = "DELETE FROM et_topicminor WHERE topicminor_id = ? ";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);

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
}
