/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.ET_Group;
import java.sql.*;
import com.pg.lib.utility.ConnectDB;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pakutsing
 */
public class GroupService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public static Boolean updategroup(String group_id, String topicmain_id, String topicminor_id, String group_course_name) throws SQLException {

        
        Boolean status = false;

        try {
            String sql = "UPDATE et_group SET group_topicmain_id = ?,group_topicminor_id=?,group_course_name=? WHERE group_id = ?";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setString(1, topicmain_id);
            ps.setString(2, topicminor_id);
            ps.setString(3, group_course_name);
            ps.setString(4, group_id);

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

    public static List<ET_Group> getlistgroupallbyid(String id) throws SQLException {

        List<ET_Group> listgroup = new ArrayList<ET_Group>();

        try {
            String sql = "SELECT a.group_id,b.topicmain_id,b.topicmain_name,c.topicminor_id,c.topicminor_name,a.group_course_name FROM et_group a INNER JOIN et_topicmain b ON a.group_topicmain_id = b.topicmain_id INNER JOIN et_topicminor c ON c.topicminor_id = a.group_topicminor_id where a.group_id = ?";
            
            
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Group list = new ET_Group();
                list.setGroup_id(rs.getString("group_id"));
                list.setMain_topicmain_id(rs.getString("topicmain_id"));
                list.setMain_topicmain_name(rs.getString("topicmain_name"));
                list.setMain_topicminor_id(rs.getString("topicminor_id"));
                list.setMain_topicminor_name(rs.getString("topicminor_name"));
                list.setMain_course_name(rs.getString("group_course_name"));
                listgroup.add(list);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
            rs.close();
        }
        return listgroup;
    }

    public static List<ET_Group> getlistgroupall() throws SQLException {

        List<ET_Group> listgroup = new ArrayList<ET_Group>();

        try {
            String sql = "SELECT a.group_id,b.topicmain_id,b.topicmain_name,c.topicminor_id,c.topicminor_name,a.group_course_name FROM et_group a INNER JOIN et_topicmain b ON a.group_topicmain_id = b.topicmain_id INNER JOIN et_topicminor c ON c.topicminor_id = a.group_topicminor_id";
            
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Group list = new ET_Group();
                list.setGroup_id(rs.getString("group_id"));
                list.setMain_topicmain_id(rs.getString("topicmain_id"));
                list.setMain_topicmain_name(rs.getString("topicmain_name"));
                list.setMain_topicminor_id(rs.getString("topicminor_id"));
                list.setMain_topicminor_name(rs.getString("topicminor_name"));
                list.setMain_course_name(rs.getString("group_course_name"));
                listgroup.add(list);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
            rs.close();
        }
        return listgroup;
    }

    private static int getprimarykey() throws SQLException {
        int primarykey = 0;
        try {
            String sql = "SELECT MAX(group_id) FROM et_group ";
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

    public static Boolean addgroup(String topicmain_id, String topicminor_id, String course_name) throws SQLException {
        int primarykey = getprimarykey() + 1;

        Boolean status = false;

        if (topicmain_id.isEmpty()) {
            topicmain_id = "99";
        }
        if (topicminor_id.isEmpty()) {
            topicminor_id = "99";
        }
      
        try {
            String sql = "INSERT INTO et_group (group_id,group_topicmain_id,group_topicminor_id ,group_course_name ) VALUES (?,?,?,?)";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, primarykey);
            ps.setString(2, topicmain_id);
            ps.setString(3, topicminor_id);
            ps.setString(4, course_name);

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

    public static Boolean delgroup(String et_main_id) throws SQLException {

        Boolean status = false;
        try {
            String sql = "DELETE FROM et_group WHERE group_id = ?";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setString(1, et_main_id);

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
