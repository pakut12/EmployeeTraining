/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.ET_Course;
import com.pg.lib.model.ET_Topicminor;
import com.pg.lib.model.ET_Training;
import com.pg.lib.utility.ConnectDB;
import com.pg.lib.utility.Utility;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;

/**
 *
 * @author pakutsing
 */
public class TrainingService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public static int getdatafilteredtrainingbyemid(String id, String searchValue, String datestart, String dateend, String search_year) throws SQLException {
        List<ET_Training> list = new ArrayList<ET_Training>();
        int total = 0;
        try {
            String sql = "SELECT count(*) FROM et_employee a " +
                    "INNER JOIN et_training b on a.training_id = b.training_id " +
                    "INNER JOIN et_group c on c.group_id = b.training_groupid " +
                    "INNER JOIN et_topicmain e on c.group_topicmain_id = e.topicmain_id " +
                    "INNER JOIN et_topicminor f on f.topicminor_id = c.group_topicminor_id " +
                    "INNER JOIN et_address g on g.address_id = b.training_address " +
                    "WHERE a.employee = ? ";
            if (!datestart.equals("") && !dateend.equals("")) {
                sql += "and b.training_datetraining BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD') ";
            }
            if (!search_year.equals("")) {
                sql += "and b.training_year = '" + search_year + "' ";
            }

            sql += "and (b.training_year like ? or e.topicmain_name like ? or f.topicminor_name like ? or c.group_course_name like ? or b.training_hour like ? or b.training_datetraining LIKE ? or b.training_expenses like ? OR g.address_name like ?)";

            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);

            if (!datestart.equals("") && !dateend.equals("")) {
                ps.setString(1, id);
                ps.setString(2, datestart);
                ps.setString(3, dateend);
                ps.setString(4, "%" + searchValue + "%");
                ps.setString(5, "%" + searchValue + "%");
                ps.setString(6, "%" + searchValue + "%");
                ps.setString(7, "%" + searchValue + "%");
                ps.setString(8, "%" + searchValue + "%");
                ps.setString(9, "%" + searchValue + "%");
                ps.setString(10, "%" + searchValue + "%");
                ps.setString(11, "%" + searchValue + "%");

            } else {
                ps.setString(1, id);
                ps.setString(2, "%" + searchValue + "%");
                ps.setString(3, "%" + searchValue + "%");
                ps.setString(4, "%" + searchValue + "%");
                ps.setString(5, "%" + searchValue + "%");
                ps.setString(6, "%" + searchValue + "%");
                ps.setString(7, "%" + searchValue + "%");
                ps.setString(8, "%" + searchValue + "%");
                ps.setString(9, "%" + searchValue + "%");

            }


            rs = ps.executeQuery();

            while (rs.next()) {
                total = rs.getInt("COUNT(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return total;
    }

    public static int getdatatotaltrainingbyemid(String id) throws SQLException {
        List<ET_Training> list = new ArrayList<ET_Training>();
        int total = 0;
        try {
            String sql = "SELECT count(*) FROM et_employee a " +
                    "INNER JOIN et_training b on a.training_id = b.training_id " +
                    "INNER JOIN et_group c on c.group_id = b.training_groupid " +
                    "INNER JOIN et_topicmain e on c.group_topicmain_id = e.topicmain_id " +
                    "INNER JOIN et_topicminor f on f.topicminor_id = c.group_topicminor_id " +
                    "INNER JOIN et_address g on g.address_id = b.training_address " +
                    "WHERE a.employee = ? ";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                total = rs.getInt("COUNT(*)");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return total;
    }

    public static List<ET_Training> getdatatrainingbyemid(String id, String searchValue, int start, int length, String datestart, String dateend, String search_year) throws SQLException {
        List<ET_Training> list = new ArrayList<ET_Training>();

        try {
            String sql = "SELECT * FROM(select rownum as rnum,r.*,TO_CHAR(r.training_datetraining,'DD/MM/YYYY') as datetraining from ";
            sql += "(SELECT b.training_id,e.topicmain_name,f.topicminor_name,c.group_course_name,b.training_company,b.training_year,b.training_hour,b.training_datetraining,b.training_expenses,g.address_name FROM et_employee a " +
                    "INNER JOIN et_training b on a.training_id = b.training_id " +
                    "INNER JOIN et_group c on c.group_id = b.training_groupid " +
                    "INNER JOIN et_topicmain e on c.group_topicmain_id = e.topicmain_id " +
                    "INNER JOIN et_topicminor f on f.topicminor_id = c.group_topicminor_id " +
                    "INNER JOIN et_address g on g.address_id = b.training_address " +
                    "WHERE a.employee = ?  ";
            if (!datestart.equals("") && !dateend.equals("")) {
                sql += "and b.training_datetraining BETWEEN TO_DATE(?, 'YYYY-MM-DD') AND TO_DATE(?, 'YYYY-MM-DD') ";
            }
            if (!search_year.equals("")) {
                sql += "and b.training_year = '" + search_year + "' ";
            }
            sql += "and (b.training_year like ? or b.training_id like ? or e.topicmain_name like ? or f.topicminor_name like ? or c.group_course_name like ? or b.training_hour like ? or b.training_datetraining LIKE ? or b.training_expenses like ? OR g.address_name like ?))r) where rnum BETWEEN ? AND ?";
            sql += "order by training_year,training_datetraining";


            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            if (!datestart.equals("") && !dateend.equals("")) {
                ps.setString(1, id);
                ps.setString(2, datestart);
                ps.setString(3, dateend);
                ps.setString(4, "%" + searchValue + "%");
                ps.setString(5, "%" + searchValue + "%");
                ps.setString(6, "%" + searchValue + "%");
                ps.setString(7, "%" + searchValue + "%");
                ps.setString(8, "%" + searchValue + "%");
                ps.setString(9, "%" + searchValue + "%");
                ps.setString(10, "%" + searchValue + "%");
                ps.setString(11, "%" + searchValue + "%");
                ps.setString(12, "%" + searchValue + "%");

                ps.setInt(13, start);
                ps.setInt(14, start + length);
            } else {
                ps.setString(1, id);
                ps.setString(2, "%" + searchValue + "%");
                ps.setString(3, "%" + searchValue + "%");
                ps.setString(4, "%" + searchValue + "%");
                ps.setString(5, "%" + searchValue + "%");
                ps.setString(6, "%" + searchValue + "%");
                ps.setString(7, "%" + searchValue + "%");
                ps.setString(8, "%" + searchValue + "%");
                ps.setString(9, "%" + searchValue + "%");
                ps.setString(10, "%" + searchValue + "%");

                ps.setInt(11, start);
                ps.setInt(12, start + length);
            }

            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Training training = new ET_Training();

                training.setTraining_id(rs.getString("training_id"));
                training.setTraining_company(rs.getString("training_company"));
                training.setTraining_expenses(rs.getString("training_expenses"));
                training.setTraining_datetraining(rs.getString("datetraining"));
                training.setTraining_year(rs.getString("training_year"));
                training.setTraining_hour(rs.getString("training_hour"));
                training.setTraining_address(rs.getString("address_name"));
                training.setTraining_topicmain(rs.getString("topicmain_name"));
                training.setTraining_topminor(rs.getString("topicminor_name"));
                training.setTraining_course(rs.getString("group_course_name"));

                list.add(training);
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

    public static Boolean deltraining(String training_id) throws SQLException {

        Boolean status = false;
        try {
            String sql = "DELETE FROM et_training WHERE training_id = ?";
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

    public static List<ET_Training> getdatatrainingbyid(String id) throws SQLException {
        List<ET_Training> list = new ArrayList<ET_Training>();

        try {
            String sql = "SELECT * FROM et_training a INNER JOIN et_group b on a.training_groupid = b.group_id INNER JOIN et_topicmain c on c.topicmain_id = b.group_topicmain_id INNER JOIN et_topicminor d on d.topicminor_id = b.group_topicminor_id INNER JOIN et_address e ON e.address_id = a.training_address WHERE a.training_id = ?";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Training training = new ET_Training();

                training.setTraining_id(rs.getString("training_id"));
                training.setTraining_company(rs.getString("training_company"));
                training.setTraining_expenses(rs.getString("training_expenses"));
                training.setTraining_datetraining(rs.getString("training_datetraining"));
                training.setTraining_year(rs.getString("training_year"));
                training.setTraining_hour(rs.getString("training_hour"));
                training.setTraining_address(rs.getString("address_name"));
                training.setAddress_id(rs.getString("address_id"));
                training.setTraining_topicmain_id(rs.getString("topicmain_id"));
                training.setTraining_topicmain(rs.getString("topicmain_name"));
                training.setTraining_topminor_id(rs.getString("topicminor_id"));
                training.setTraining_topminor(rs.getString("topicminor_name"));
                training.setTraining_course(rs.getString("group_course_name"));
                training.setTraining_type(rs.getString("training_type"));

                list.add(training);
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

    public static Boolean CheckTraining(String topicmain_id, String topicminor_id, String course_id, String company, String expenses, String datetraining, String year, String address, String hour, String type_id) throws SQLException {
        Boolean status = false;
        String groupid = Checkidgroup(topicmain_id, topicminor_id, course_id);
        try {
            String sql = "SELECT COUNT(*) FROM et_training WHERE training_company = ? AND training_year = ? AND training_hour = ? AND training_datetraining =  TO_DATE(?, 'yyyy/mm/dd') AND training_expenses = ? AND training_address = ? AND training_groupid = ? AND training_type = ? ";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, company);
            ps.setString(2, year);
            ps.setString(3, hour);
            ps.setString(4, datetraining);
            ps.setString(5, expenses);
            ps.setString(6, address);
            ps.setString(7, groupid);
            ps.setString(8, type_id);

            rs = ps.executeQuery();

            int row = 0;
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

    public static int gettotletabletraining() throws SQLException {
        int totle = 0;
        try {
            String sql = "SELECT COUNT(*) FROM et_training a INNER JOIN et_group b on a.training_groupid = b.group_id INNER JOIN et_topicmain c on c.topicmain_id = b.group_topicmain_id INNER JOIN et_topicminor d on d.topicminor_id = b.group_topicminor_id INNER JOIN et_address e ON e.address_id = a.training_address ";
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

    public static int getfilteredtabletraining(String searchValue, String search_topicmain_id, String search_topicminor_id, String search_course_id, String search_date_start, String search_date_end, String search_year, String search_address) throws SQLException {
        int totle = 0;
        try {
            String sql = "SELECT count(*) FROM(select rownum as rnum,r.*,TO_CHAR(r.training_datetraining,'DD/MM/YYYY') as datetraining from ";
            sql += "(SELECT * FROM et_training a INNER JOIN et_group b on a.training_groupid = b.group_id INNER JOIN et_topicmain c on c.topicmain_id = b.group_topicmain_id INNER JOIN et_topicminor d on d.topicminor_id = b.group_topicminor_id  INNER JOIN et_address e ON e.address_id = a.training_address WHERE ";
            sql += "c.topicmain_id like ? AND d.topicminor_id like ? AND b.group_course_name like ? and a.training_year like ? and  e.address_id LIKE ? and ";

            if (!search_date_start.equals("") && !search_date_end.equals("")) {
                sql += "a.training_datetraining BETWEEN  TO_DATE(?, 'yyyy/mm/dd') and TO_DATE(?, 'yyyy/mm/dd') and ";
            }

            sql += " (a.training_company LIKE ? OR " +
                    "a.training_id LIKE ? OR " +
                    "a.training_year LIKE ? OR " +
                    "a.training_hour LIKE ? OR " +
                    "a.training_expenses LIKE ? OR " +
                    "e.address_name LIKE ? OR " +
                    "c.topicmain_name LIKE ? OR " +
                    "d.topicminor_name LIKE ? OR " +
                    "b.group_course_name LIKE ?))r) ";
            sql += " order by training_year,training_datetraining";


            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);

            if (!search_date_start.equals("") && !search_date_end.equals("")) {

                ps.setString(1, "%" + search_topicmain_id + "%");
                ps.setString(2, "%" + search_topicminor_id + "%");
                ps.setString(3, "%" + search_course_id + "%");
                ps.setString(4, "%" + search_year + "%");
                ps.setString(5, "%" + search_address + "%");
                ps.setString(6, search_date_start);
                ps.setString(7, search_date_end);
                ps.setString(8, "%" + searchValue + "%");
                ps.setString(9, "%" + searchValue + "%");
                ps.setString(10, "%" + searchValue + "%");
                ps.setString(11, "%" + searchValue + "%");
                ps.setString(12, "%" + searchValue + "%");
                ps.setString(13, "%" + searchValue + "%");
                ps.setString(14, "%" + searchValue + "%");
                ps.setString(15, "%" + searchValue + "%");
                ps.setString(16, "%" + searchValue + "%");

            } else {
                ps.setString(1, "%" + search_topicmain_id + "%");
                ps.setString(2, "%" + search_topicminor_id + "%");
                ps.setString(3, "%" + search_course_id + "%");
                ps.setString(4, "%" + search_year + "%");
                ps.setString(5, "%" + search_address + "%");
                ps.setString(6, "%" + searchValue + "%");
                ps.setString(7, "%" + searchValue + "%");
                ps.setString(8, "%" + searchValue + "%");
                ps.setString(9, "%" + searchValue + "%");
                ps.setString(10, "%" + searchValue + "%");
                ps.setString(11, "%" + searchValue + "%");
                ps.setString(12, "%" + searchValue + "%");
                ps.setString(13, "%" + searchValue + "%");
                ps.setString(14, "%" + searchValue + "%");

            }

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

    public static List<ET_Training> gettabletraining(int start, int length, String searchValue, String search_topicmain_id, String search_topicminor_id, String search_course_id, String search_date_start, String search_date_end, String search_year, String search_address) throws SQLException {
        List<ET_Training> listtraining = new ArrayList<ET_Training>();
        try {

            String sql = "SELECT * FROM(select rownum as rnum,r.*,TO_CHAR(r.training_datetraining,'DD/MM/YYYY') as datetraining from ";
            sql += "(SELECT * FROM et_training a INNER JOIN et_group b on a.training_groupid = b.group_id INNER JOIN et_topicmain c on c.topicmain_id = b.group_topicmain_id INNER JOIN et_topicminor d on d.topicminor_id = b.group_topicminor_id  INNER JOIN et_address e ON e.address_id = a.training_address WHERE ";
            sql += "c.topicmain_id like ? AND d.topicminor_id like ? AND b.group_course_name like ?  and a.training_year like ? and e.address_id LIKE ? and ";

            if (!search_date_start.equals("") && !search_date_end.equals("")) {
                sql += "a.training_datetraining BETWEEN  TO_DATE(?, 'yyyy/mm/dd') and TO_DATE(?, 'yyyy/mm/dd') and ";
            }

            sql += " (a.training_company LIKE ? OR " +
                    "a.training_id LIKE ? OR " +
                    "a.training_year LIKE ? OR " +
                    "a.training_hour LIKE ? OR " +
                    "a.training_expenses LIKE ? OR " +
                    "e.address_name LIKE ? OR " +
                    "c.topicmain_name LIKE ? OR " +
                    "d.topicminor_name LIKE ? OR " +
                    "b.group_course_name LIKE ?))r) where rnum BETWEEN ? AND ?";
            sql += " order by address_name ,training_year,training_datetraining,group_id  ";

           

            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);



            if (!search_date_start.equals("") && !search_date_end.equals("")) {

                ps.setString(1, "%" + search_topicmain_id + "%");
                ps.setString(2, "%" + search_topicminor_id + "%");
                ps.setString(3, "%" + search_course_id + "%");
                ps.setString(4, "%" + search_year + "%");
                ps.setString(5, "%" + search_address + "%");
                ps.setString(6, search_date_start);
                ps.setString(7, search_date_end);
                ps.setString(8, "%" + searchValue + "%");
                ps.setString(9, "%" + searchValue + "%");
                ps.setString(10, "%" + searchValue + "%");
                ps.setString(11, "%" + searchValue + "%");
                ps.setString(12, "%" + searchValue + "%");
                ps.setString(13, "%" + searchValue + "%");
                ps.setString(14, "%" + searchValue + "%");
                ps.setString(15, "%" + searchValue + "%");
                ps.setString(16, "%" + searchValue + "%");
                ps.setInt(17, start);
                ps.setInt(18, start + length);
            } else {
                ps.setString(1, "%" + search_topicmain_id + "%");
                ps.setString(2, "%" + search_topicminor_id + "%");
                ps.setString(3, "%" + search_course_id + "%");
                ps.setString(4, "%" + search_year + "%");
                ps.setString(5, "%" + search_address + "%");
                ps.setString(6, "%" + searchValue + "%");
                ps.setString(7, "%" + searchValue + "%");
                ps.setString(8, "%" + searchValue + "%");
                ps.setString(9, "%" + searchValue + "%");
                ps.setString(10, "%" + searchValue + "%");
                ps.setString(11, "%" + searchValue + "%");
                ps.setString(12, "%" + searchValue + "%");
                ps.setString(13, "%" + searchValue + "%");
                ps.setString(14, "%" + searchValue + "%");
                ps.setInt(15, start);
                ps.setInt(16, start + length);
            }

            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Training training = new ET_Training();
                training.setTraining_id(rs.getString("training_id"));
                training.setTraining_company(rs.getString("training_company"));
                training.setTraining_year(rs.getString("training_year"));
                training.setTraining_hour(rs.getString("training_hour"));
                training.setTraining_datetraining(rs.getString("datetraining"));
                training.setTraining_expenses(rs.getString("training_expenses"));
                training.setTraining_address(rs.getString("address_name"));
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

    public static int getprimarykey() throws SQLException {
        int primarykey = 0;
        try {
            String sql = "SELECT MAX(training_id) FROM et_training ";
            conn = ConnectDB.getConnectionhr();
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
            conn = ConnectDB.getConnectionhr();
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

    public static HashMap addtraining(String topicmain_id, String topicminor_id, String course_id, String company, String expenses, String datetraining, String year, String address, String hour, String[] listemployeeid, String type_id) throws SQLException {
        int primarykey = getprimarykey() + 1;

        HashMap status = new HashMap();
        try {
            String groupid = Checkidgroup(topicmain_id, topicminor_id, course_id);
            String sql = "INSERT INTO et_training (training_id,training_company, training_year, training_hour, training_datetraining, training_expenses, training_address, training_groupid, training_date_create,training_type) VALUES (?, ?, ?, ?, TO_DATE(?, 'yyyy/mm/dd'), ?, ?, ?, TO_DATE(?, 'yyyy/mm/dd'),?) ";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);

            ps.setInt(1, primarykey);
            ps.setString(2, company);
            ps.setString(3, year);
            ps.setString(4, hour);
            ps.setString(5, datetraining);
            ps.setString(6, expenses);
            ps.setString(7, address);
            ps.setString(8, groupid);
            ps.setString(9, Utility.getdatetoday());
            ps.setString(10, type_id);

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
            String sql = "SELECT b.topicmain_id,b.topicmain_name,c.topicminor_id,c.topicminor_name FROM et_group a INNER JOIN et_topicmain b ON a.group_topicmain_id = b.topicmain_id INNER JOIN et_topicminor c ON c.topicminor_id = a.group_topicminor_id WHERE a.group_topicmain_id = ? GROUP BY b.topicmain_id,b.topicmain_name,c.topicminor_id,c.topicminor_name order by c.topicminor_id";
            conn = ConnectDB.getConnectionhr();
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
            conn = ConnectDB.getConnectionhr();
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

    public static Boolean updatetraining(String edit_training_id, String edit_topicmain_id, String edit_topicminor_id, String edit_course_id, String edit_company, String edit_expenses, String edit_date, String edit_year, String edit_address, String edit_hour, String edit_type) throws SQLException {
        Boolean status = false;
        try {
            String groupid = Checkidgroup(edit_topicmain_id, edit_topicminor_id, edit_course_id);
            String sql = "UPDATE et_training SET training_company = ?,training_year = ?,training_hour = ?, training_datetraining = TO_DATE(?, 'yyyy/mm/dd'),training_expenses = ?,training_address = ?,training_groupid = ?,training_date_modify = TO_DATE(?, 'yyyy/mm/dd'),training_type = ? WHERE training_id = ?";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            ps.setString(1, edit_company);
            ps.setString(2, edit_year);
            ps.setString(3, edit_hour);
            ps.setString(4, edit_date);
            ps.setString(5, edit_expenses);
            ps.setString(6, edit_address);
            ps.setString(7, groupid);
            ps.setString(8, Utility.getdatetoday());
            ps.setString(9, edit_type);
            ps.setString(10, edit_training_id);

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
