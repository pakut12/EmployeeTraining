/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.ET_Course;
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
public class TrainingService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    private static int getprimarykey() throws SQLException {
        int primarykey = 0;
        try {
            String sql = "SELECT MAX(group_id) FROM et_training ";
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

    public static Boolean addtraining(String topicmain_id, String topicminor_id, String course_id, String company, String expenses, String date, String year, String address, String hour, String[] listemployeeid) throws SQLException {
        Boolean status = false;
        int primarykey = getprimarykey() + 1;
        try {
            String sql = "INSERT INTO et_training (training_id, training_company, training_year, training_datetraining, training_expenses, training_address, training_groupid, training_employee, training_date_create, training_date_modify)" +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);

            for (String id : listemployeeid) {
                ps.setInt(1, primarykey);
                ps.setString(1, topicmain_id);


                
                
                
                primarykey++;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
            
        }

        return status;
    }

    public static List<ET_Topicminor> gettopicminorbytopicmain_id(String topicmain_id) throws SQLException {
        List<ET_Topicminor> listminor = new ArrayList<ET_Topicminor>();

        try {
            String sql = "SELECT a.group_id,b.topicmain_id,b.topicmain_name,c.topicminor_id,c.topicminor_name,a.group_course_name FROM et_group a INNER JOIN et_topicmain b ON a.group_topicmain_id = b.topicmain_id INNER JOIN et_topicminor c ON c.topicminor_id = a.group_topicminor_id where group_topicmain_id = ?";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setString(1, topicmain_id);
            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Topicminor minor = new ET_Topicminor();
                minor.setTopicminor_id(rs.getString("topicminor_id"));
                minor.setTopicminor_name(rs.getString("topicminor_name"));
                listminor.add(minor);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
            rs.close();
        }

        return listminor;
    }

    public static List<ET_Course> getcoursebytopicminor_id(String topicmain_id, String topicminor_id) throws SQLException {
        List<ET_Course> listcourse = new ArrayList<ET_Course>();

        try {
            String sql = "SELECT a.group_id,b.topicmain_id,b.topicmain_name,c.topicminor_id,c.topicminor_name,a.group_course_name FROM et_group a INNER JOIN et_topicmain b ON a.group_topicmain_id = b.topicmain_id INNER JOIN et_topicminor c ON c.topicminor_id = a.group_topicminor_id where group_topicmain_id = ? and topicminor_id = ? ";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setString(1, topicmain_id);
            ps.setString(2, topicminor_id);

            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Course course = new ET_Course();
                course.setCourse_name(rs.getString("group_course_name"));
                listcourse.add(course);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            conn.close();
            ps.close();
            rs.close();
        }

        return listcourse;
    }
}
