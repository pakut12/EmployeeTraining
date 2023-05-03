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
