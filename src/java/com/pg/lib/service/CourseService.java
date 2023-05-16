/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.ET_Course;
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
public class CourseService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public static Boolean updatecourse(String id, String name) throws SQLException {
        int primarykey = getprimarykey() + 1;

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        Boolean status = false;

        try {

            String sql = "UPDATE et_course SET course_name=? WHERE course_id = ?";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, name);

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

    public static Boolean delcourse(String id) throws SQLException {
        int primarykey = getprimarykey() + 1;

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        Boolean status = false;

        try {

            String sql = "DELETE FROM et_course WHERE course_id = ?";
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

    private static int getprimarykey() throws SQLException {
        int primarykey = 0;
        try {
            Boolean status = false;
            String sql = "SELECT MAX(course_id) as primarykey FROM et_course";
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

    public static List<ET_Course> getlistcoursebyid(String id) throws SQLException {
        List<ET_Course> list = new ArrayList();
        try {

            String sql = "SELECT * FROM et_course WHERE course_id = ?";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Course course = new ET_Course();
                course.setCourse_id(rs.getString("course_id"));
                course.setCourse_name(rs.getString("course_name"));
                course.setCourse_date_create(rs.getString("course_date_create"));

                list.add(course);
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

    public static List<ET_Course> getlistcourse() throws SQLException {
        List<ET_Course> list = new ArrayList();
        try {

            String sql = "SELECT * FROM et_course";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Course course = new ET_Course();
                course.setCourse_id(rs.getString("course_id"));
                course.setCourse_name(rs.getString("course_name"));
                course.setCourse_date_create(rs.getString("course_date_create"));

                list.add(course);
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

    public static Boolean addcourse(String name) throws SQLException {
        int primarykey = getprimarykey() + 1;

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        Boolean status = false;

        try {

            String sql = "INSERT INTO et_course (course_id, course_name, course_date_create) VALUES (?, ?, ?)";
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
}
