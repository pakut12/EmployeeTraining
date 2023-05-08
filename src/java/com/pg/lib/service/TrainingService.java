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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;
import java.util.HashMap;

/**
 *
 * @author pakutsing
 */
public class TrainingService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public static Boolean CheckTraining(String topicmain_id, String topicminor_id, String course_id, String company, String expenses, String datetraining, String year, String address, String hour, String[] listemployeeid) throws SQLException {
        Boolean status = false;
        String groupid = Checkidgroup(topicmain_id, topicminor_id, course_id);
        try {
            String sql = "SELECT COUNT(*) FROM et_training WHERE training_company = ? AND training_year = ? AND training_hour = ? AND training_datetraining = ? AND training_expenses = ? AND training_address = ? AND training_groupid = ? and training_date_create =?";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setString(1, company);
            ps.setString(2, year);
            ps.setString(3, hour);
            ps.setString(4, datetraining);
            ps.setString(5, expenses);
            ps.setString(6, address);
            ps.setString(7, groupid);
            ps.setString(8, getdatetoday());

            rs = ps.executeQuery();

            int row = 0;
            while (rs.next()) {
                row = rs.getInt("COUNT(*)");
                System.out.println(row);

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

    public static int gettotletabletraining() throws SQLException {
        int totle = 0;
        try {
            String sql = "SELECT COUNT(*) FROM et_training a INNER JOIN et_group b on a.training_groupid = b.group_id INNER JOIN et_topicmain c on c.topicmain_id = b.group_topicmain_id INNER JOIN et_topicminor d on d.topicminor_id = b.group_topicminor_id ";
            conn = ConnectDB.getConnectionMysql();
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

    public static List<ET_Training> gettabletraining(int start, int length) throws SQLException {
        List<ET_Training> listtraining = new ArrayList<ET_Training>();
        try {
            String sql = "SELECT a.training_id,a.training_company,a.training_year,a.training_hour,a.training_datetraining,a.training_expenses,a.training_address,c.topicmain_name,d.topicminor_name,b.group_course_name FROM et_training a INNER JOIN et_group b on a.training_groupid = b.group_id INNER JOIN et_topicmain c on c.topicmain_id = b.group_topicmain_id INNER JOIN et_topicminor d on d.topicminor_id = b.group_topicminor_id INNER JOIN et_employee e on e.training_id = a.training_id GROUP BY a.training_id,a.training_company,a.training_year,a.training_hour,a.training_datetraining,a.training_expenses,a.training_address,c.topicmain_name,d.topicminor_name limit ?,? ";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, start);
            ps.setInt(2, start + length);
            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Training training = new ET_Training();
                training.setTraining_id(rs.getString("training_id"));
                training.setTraining_company(rs.getString("training_company"));
                training.setTraining_year(rs.getString("training_year"));
                training.setTraining_hour(rs.getString("training_hour"));
                training.setTraining_datetraining(rs.getString("training_datetraining"));
                training.setTraining_expenses(rs.getString("training_expenses"));
                training.setTraining_address(rs.getString("training_address"));
                training.setTraining_topicmain(rs.getString("topicmain_name"));
                training.setTraining_topminor(rs.getString("topicminor_name"));
                training.setTraining_course(rs.getString("group_course_name"));

                listtraining.add(training);

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return listtraining;
    }

    private static int getprimarykey() throws SQLException {
        int primarykey = 0;
        try {
            String sql = "SELECT MAX(training_id) FROM et_training ";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                primarykey = rs.getInt("MAX(training_id)");
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

    private static String Checkidgroup(String topicmain_id, String topicminor_id, String course_id) throws SQLException {
        String groupid = "";
        try {
            String sql = "SELECT * FROM et_group WHERE group_topicmain_id = ? and group_topicminor_id = ? and group_course_name = ?";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setString(1, topicmain_id);
            ps.setString(2, topicminor_id);
            ps.setString(3, course_id);

            rs = ps.executeQuery();
            while (rs.next()) {
                groupid = rs.getString("group_id");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }
        return groupid;
    }

    private static String getdatetoday() throws SQLException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        return formatter.format(date);
    }

    public static HashMap addtraining(String topicmain_id, String topicminor_id, String course_id, String company, String expenses, String datetraining, String year, String address, String hour, String[] listemployeeid) throws SQLException {
        int primarykey = getprimarykey() + 1;

        HashMap status = new HashMap();
        try {
            String groupid = Checkidgroup(topicmain_id, topicminor_id, course_id);
            String sql = "INSERT INTO et_training (training_id,training_company, training_year, training_hour, training_datetraining, training_expenses, training_address, training_groupid, training_date_create) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) ";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);

            ps.setInt(1, primarykey);
            ps.setString(2, company);
            ps.setString(3, year);
            ps.setString(4, hour);
            ps.setString(5, datetraining);
            ps.setString(6, expenses);
            ps.setString(7, address);
            ps.setString(8, groupid);
            ps.setString(9, getdatetoday());

            if (ps.executeUpdate() > 0) {
                status.put("status", "true");
                status.put("id", primarykey);
            } else {
                status.put("status", "false");
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
            ConnectDB.closeConnection(conn);
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
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return listcourse;
    }
}
