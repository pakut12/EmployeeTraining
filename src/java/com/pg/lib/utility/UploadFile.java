/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.utility;

import com.pg.lib.Servlet.Group;
import com.pg.lib.model.ET_Training;
import com.pg.lib.service.EmployeeService;
import com.pg.lib.service.GroupService;
import com.pg.lib.service.TrainingService;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;

/**
 *
 * @author pakutsing
 */
public class UploadFile {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public static HashMap<String, String> ReadTraining() throws SQLException {
        HashMap<String, String> id = new HashMap<String, String>();

        try {
            String sql = "SELECT * FROM et_training a INNER JOIN et_group b on a.training_groupid = b.group_id INNER JOIN et_topicmain c on c.topicmain_id = b.group_topicmain_id INNER JOIN et_topicminor d on d.topicminor_id = b.group_topicminor_id INNER JOIN et_address e ON e.address_id = a.training_address ";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {
                id.put(rs.getString("TRAINING_COMPANY") + "#" + rs.getString("TRAINING_YEAR") + "#" + rs.getString("TRAINING_HOUR") + "#" + rs.getString("TRAINING_DATETRAINING").replaceAll(" 00:00:00.0", "") + "#" + rs.getString("TRAINING_EXPENSES") + "#" + rs.getString("TRAINING_ADDRESS") + "#" + rs.getString("TRAINING_GROUPID"), rs.getString("TRAINING_ID"));
               // System.out.println(rs.getString("TRAINING_COMPANY") + "#" + rs.getString("TRAINING_YEAR") + "#" + rs.getString("TRAINING_HOUR") + "#" + rs.getString("TRAINING_DATETRAINING").replaceAll(" 00:00:00.0", "") + "#" + rs.getString("TRAINING_EXPENSES") + "#" + rs.getString("TRAINING_ADDRESS") + "#" + rs.getString("TRAINING_GROUPID"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return id;
    }

    private static HashMap<String, String> ReadAddress() throws SQLException {

        HashMap<String, String> id = new HashMap<String, String>();

        try {
            String sql = "select * from ET_ADDRESS ";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                id.put(rs.getString("ADDRESS_NAME"), rs.getString("ADDRESS_ID"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }

        return id;
    }

    private static HashMap<String, String> ReadTopicmain() throws SQLException {
        HashMap<String, String> id = new HashMap<String, String>();

        try {
            String sql = "select * from ET_TOPICMAIN ";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                id.put(rs.getString("TOPICMAIN_NAME"), rs.getString("TOPICMAIN_ID"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }
        return id;
    }

    private static HashMap<String, String> ReadTopicminor() throws SQLException {
        HashMap<String, String> id = new HashMap<String, String>();
        try {
            String sql = "select * from ET_TOPICMINOR ";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);

            rs = ps.executeQuery();

            while (rs.next()) {
                id.put(rs.getString("TOPICMINOR_NAME"), rs.getString("TOPICMINOR_ID"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }
        return id;

    }

    public static HashMap<String, String> ReadGroup() throws SQLException {
        HashMap<String, String> id = new HashMap<String, String>();
        try {
            String sql = "select * from ET_GROUP ";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                id.put(rs.getString("GROUP_TOPICMAIN_ID") + "#" + rs.getString("GROUP_TOPICMINOR_ID") + "#" + rs.getString("GROUP_COURSE_NAME"), rs.getString("GROUP_ID"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }
        return id;

    }

    public static Boolean addgroup(List<ET_Training> list) throws SQLException {
        int primarykey = GroupService.getprimarykey() + 1;

        Boolean status = false;

        try {
            String sql = "INSERT INTO et_group (group_id,group_topicmain_id,group_topicminor_id ,group_course_name ) VALUES (?,?,?,?)";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);

            for (ET_Training l : list) {
                ps.setInt(1, primarykey);
                ps.setString(2, l.getTraining_topicmain_id());
                ps.setString(3, l.getTraining_topminor_id());
                ps.setString(4, l.getTraining_course());
                primarykey++;
                ps.addBatch();
            }

            ps.executeBatch();
            status = true;

        } catch (Exception e) {
            status = false;
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }
        return status;
    }

    public static Boolean addemployeebyid(List<ET_Training> list) throws SQLException {
        HashMap<String, String> ReadGroup = ReadGroup();
        HashMap<String, String> ReadTraining = ReadTraining();
        int primarykey = EmployeeService.getprimarykey() + 1;
        Boolean status = false;
        try {

            String sql = "INSERT INTO et_employee (employee_id,training_id , employee, employee_result) VALUES (?, ?, ?,?) ";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);

            for (ET_Training l : list) {
                String tid = l.getTraining_company() + "#" + l.getTraining_year() + "#" + l.getTraining_hour() + "#" + l.getTraining_datetraining() + "#" + l.getTraining_expenses() + "#" + l.getAddress_id() + "#" + ReadGroup.get(l.getTraining_topicmain_id() + "#" + l.getTraining_topminor_id() + "#" + l.getTraining_course());

                String data = "";
                if (ReadTraining.get(tid) == null) {
                    data = "0";
                } else {
                    data = ReadTraining.get(tid);
                }

                ps.setInt(1, primarykey);
                ps.setString(2, data);
                ps.setString(3, l.getTraining_employee());
                ps.setString(4, "1");
                ps.addBatch();
                primarykey++;
            }

            ps.executeBatch();
            status = true;
        } catch (Exception e) {
            status = false;
            e.printStackTrace();
        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();
        }





        return status;
    }

    public static Boolean addtraining(List<ET_Training> list) throws SQLException {
        int primarykey = TrainingService.getprimarykey() + 1;
        HashMap<String, String> ReadGroup = UploadFile.ReadGroup();
        Boolean status = false;
        try {

            String sql = "INSERT INTO et_training (training_id,training_company, training_year, training_hour, training_datetraining, training_expenses, training_address, training_groupid, training_date_create,TRAINING_TYPE) " +
                    "VALUES (?, ?, ?, ?, TO_DATE(?, 'yyyy/mm/dd'), ?, ?, ?, TO_DATE(?, 'yyyy/mm/dd'),?)";
            conn = ConnectDB.getConnectionhr();
            ps = conn.prepareStatement(sql);

            for (ET_Training l : list) {

                ps.setInt(1, primarykey);
                ps.setString(2, l.getTraining_company());
                ps.setString(3, l.getTraining_year());
                ps.setString(4, l.getTraining_hour());
                ps.setString(5, l.getTraining_datetraining());
                ps.setString(6, l.getTraining_expenses());
                ps.setString(7, l.getAddress_id());
                ps.setString(8, ReadGroup.get(l.getTraining_topicmain_id() + "#" + l.getTraining_topminor_id() + "#" + l.getTraining_course()));
                ps.setString(9, Utility.getdatetoday());
                ps.setString(10, Utility.ChackType(l.getTraining_type()));
                ps.addBatch();

                primarykey++;
            }

            ps.executeBatch();
            status = true;

        } catch (Exception e) {
            status = false;
            e.printStackTrace();

        } finally {
            ConnectDB.closeConnection(conn);
            ps.close();
            rs.close();

        }

        return status;
    }

    public static List<ET_Training> ReadFile() throws IOException {

        List<ET_Training> listtraining = new ArrayList<ET_Training>();
        try {
            HashMap<String, String> ReadTopicminor = ReadTopicminor();
            HashMap<String, String> ReadTopicmain = ReadTopicmain();
            HashMap<String, String> ReadAddress = ReadAddress();


            FileInputStream fileInputStream = new FileInputStream("C:/Users/pakutsing/Desktop/Github/EmployeeTraining/web/test.xls");
            HSSFWorkbook workbook = new HSSFWorkbook(fileInputStream);
            HSSFSheet worksheet = workbook.getSheetAt(0);
            Iterator<Row> rowIterator = worksheet.iterator();
            //Loop Row
            while (rowIterator.hasNext()) {
                Row row = rowIterator.next();
                //skip column name at first row

                if (row.getRowNum() == 0) {
                    continue;
                }
                Iterator<Cell> cellIterator = row.cellIterator();
                ET_Training training = new ET_Training();

                while (cellIterator.hasNext()) {
                    Cell cell = cellIterator.next();
                    cell.setCellType(cell.CELL_TYPE_STRING);

                    if (cell.getColumnIndex() == 0) {
                        if (!cell.getStringCellValue().isEmpty()) {
                            training.setTraining_company(cell.getStringCellValue().trim().toUpperCase());
                        } else {
                            training.setTraining_company("");
                        }

                        System.out.println(cell.getStringCellValue());
                    } else if (cell.getColumnIndex() == 1) {
                        if (!cell.getStringCellValue().isEmpty()) {
                            training.setTraining_year(cell.getStringCellValue().trim());
                        } else {
                            training.setTraining_year("");
                        }

                        System.out.println(cell.getStringCellValue());
                    } else if (cell.getColumnIndex() == 2) {
                        if (!cell.getStringCellValue().isEmpty()) {
                            training.setTraining_datetraining(Utility.CoverDate(cell.getStringCellValue().trim()));
                        } else {
                            training.setTraining_datetraining("");
                        }


                        System.out.println(cell.getStringCellValue());
                    } else if (cell.getColumnIndex() == 3) {
                        if (!cell.getStringCellValue().isEmpty()) {
                            training.setTraining_hour(cell.getStringCellValue().trim());
                        } else {
                            training.setTraining_hour("");
                        }


                        System.out.println(cell.getStringCellValue());
                    } else if (cell.getColumnIndex() == 4) {
                        if (!cell.getStringCellValue().isEmpty()) {
                            training.setTraining_course(cell.getStringCellValue().trim());
                        } else {
                            training.setTraining_course("");
                        }


                        System.out.println(cell.getStringCellValue());
                    } else if (cell.getColumnIndex() == 5) {
                        if (!cell.getStringCellValue().isEmpty()) {
                            training.setTraining_type(cell.getStringCellValue().trim());
                        } else {
                            training.setTraining_type("");
                        }


                        System.out.println(cell.getStringCellValue());
                    } else if (cell.getColumnIndex() == 6) {
                        if (!cell.getStringCellValue().isEmpty()) {
                            double number = Double.parseDouble(cell.getStringCellValue());

                            DecimalFormat decimalFormat = new DecimalFormat("0.00");
                            String formattedNumber = decimalFormat.format(number);

                            training.setTraining_expenses(formattedNumber);
                        } else {
                            training.setTraining_expenses("0");
                        }


                        System.out.println(cell.getStringCellValue());
                    } else if (cell.getColumnIndex() == 7) {
                        if (!cell.getStringCellValue().isEmpty()) {
                            String[] txt = cell.getStringCellValue().trim().split("-");
                            if (cell.getStringCellValue().equals("QP-WI")) {
                                training.setTraining_topicmain_id("101");
                                training.setTraining_topminor_id("99");
                            } else if (txt.length == 1) {
                                training.setTraining_topicmain_id(ReadTopicmain.get(txt[0]));
                                training.setTraining_topminor_id("99");

                            } else if (txt.length == 2) {
                                training.setTraining_topicmain_id(ReadTopicmain.get(txt[0].replaceAll(" ", "")));
                                training.setTraining_topminor_id(ReadTopicminor.get(txt[1].replaceAll(" ", "")));
                                System.out.println("LIST ID : " + txt[0].replaceAll(" ", ""));
                                System.out.println("LIST ID : " + txt[1].replaceAll(" ", ""));
                            }

                        } else {
                            training.setTraining_topicmain_id("");
                            training.setTraining_topminor_id("");
                        }


                        System.out.println(cell.getStringCellValue());

                    } else if (cell.getColumnIndex() == 8) {
                        if (!cell.getStringCellValue().isEmpty()) {
                            training.setAddress_id(ReadAddress.get(cell.getStringCellValue()));
                        } else {
                            training.setAddress_id("");
                        }
                        System.out.println(cell.getStringCellValue());

                    } else if (cell.getColumnIndex() == 9) {
                        if (!cell.getStringCellValue().isEmpty()) {
                            training.setTraining_groupid(cell.getStringCellValue());
                        } else {
                            training.setTraining_groupid("");
                        }
                        System.out.println(cell.getStringCellValue());
                    } else if (cell.getColumnIndex() == 10) {
                        if (!cell.getStringCellValue().isEmpty()) {
                            training.setTraining_employee(cell.getStringCellValue());
                        } else {
                            training.setTraining_employee("");
                        }
                        System.out.println(cell.getStringCellValue());
                    }

                }
                System.out.println("----------------------------------------------------------------------------------------------------------");
                listtraining.add(training);
            }
            fileInputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }


        return listtraining;

    }
}


