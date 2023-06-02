/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.ET_Training;
import com.pg.lib.utility.ConnectDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author pakutsing
 */
public class ReportService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

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
            sql += "c.topicmain_id like ? AND d.topicminor_id like ? and a.training_year like ? and  e.address_id LIKE ? and";

            if (!search_date_start.equals("") && !search_date_end.equals("")) {
                sql += "a.training_datetraining BETWEEN  TO_DATE(?, 'yyyy/mm/dd') and TO_DATE(?, 'yyyy/mm/dd') and";
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
                ps.setString(3, "%" + search_year + "%");
                ps.setString(4, "%" + search_address + "%");
                ps.setString(5, "%" + search_date_start + "%");
                ps.setString(6, "%" + search_date_end + "%");
                ps.setString(7, "%" + searchValue + "%");
                ps.setString(8, "%" + searchValue + "%");
                ps.setString(9, "%" + searchValue + "%");
                ps.setString(10, "%" + searchValue + "%");
                ps.setString(11, "%" + searchValue + "%");
                ps.setString(12, "%" + searchValue + "%");
                ps.setString(13, "%" + searchValue + "%");
                ps.setString(14, "%" + searchValue + "%");
                ps.setString(15, "%" + searchValue + "%");
             
            } else {
                ps.setString(1, "%" + search_topicmain_id + "%");
                ps.setString(2, "%" + search_topicminor_id + "%");
                ps.setString(3, "%" + search_year + "%");
                ps.setString(4, "%" + search_address + "%");
                ps.setString(5, "%" + searchValue + "%");
                ps.setString(6, "%" + searchValue + "%");
                ps.setString(7, "%" + searchValue + "%");
                ps.setString(8, "%" + searchValue + "%");
                ps.setString(9, "%" + searchValue + "%");
                ps.setString(10, "%" + searchValue + "%");
                ps.setString(11, "%" + searchValue + "%");
                ps.setString(12, "%" + searchValue + "%");
                ps.setString(13, "%" + searchValue + "%");
              
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
            sql += "c.topicmain_id like ? AND d.topicminor_id like ? and a.training_year like ? and e.address_id LIKE ? and";

            if (!search_date_start.equals("") && !search_date_end.equals("")) {
                sql += "a.training_datetraining BETWEEN  TO_DATE(?, 'yyyy/mm/dd') and TO_DATE(?, 'yyyy/mm/dd') and";
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

            System.out.println(sql);
            
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);

            if (!search_date_start.equals("") && !search_date_end.equals("")) {
                ps.setString(1, "%" + search_topicmain_id + "%");
                ps.setString(2, "%" + search_topicminor_id + "%");
                ps.setString(3, "%" + search_year + "%");
                ps.setString(4, "%" + search_address + "%");
                ps.setString(5, "%" + search_date_start + "%");
                ps.setString(6, "%" + search_date_end + "%");
                ps.setString(7, "%" + searchValue + "%");
                ps.setString(8, "%" + searchValue + "%");
                ps.setString(9, "%" + searchValue + "%");
                ps.setString(10, "%" + searchValue + "%");
                ps.setString(11, "%" + searchValue + "%");
                ps.setString(12, "%" + searchValue + "%");
                ps.setString(13, "%" + searchValue + "%");
                ps.setString(14, "%" + searchValue + "%");
                ps.setString(15, "%" + searchValue + "%");
                ps.setInt(16, start);
                ps.setInt(17, start + length);
            } else {
                ps.setString(1, "%" + search_topicmain_id + "%");
                ps.setString(2, "%" + search_topicminor_id + "%");
                ps.setString(3, "%" + search_year + "%");
                ps.setString(4, "%" + search_address + "%");
                ps.setString(5, "%" + searchValue + "%");
                ps.setString(6, "%" + searchValue + "%");
                ps.setString(7, "%" + searchValue + "%");
                ps.setString(8, "%" + searchValue + "%");
                ps.setString(9, "%" + searchValue + "%");
                ps.setString(10, "%" + searchValue + "%");
                ps.setString(11, "%" + searchValue + "%");
                ps.setString(12, "%" + searchValue + "%");
                ps.setString(13, "%" + searchValue + "%");
                ps.setInt(14, start);
                ps.setInt(15, start + length);
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
}
