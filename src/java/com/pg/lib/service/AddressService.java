/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.service;

import com.pg.lib.model.ET_Address;
import com.pg.lib.utility.ConnectDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.naming.NamingException;

/**
 *
 * @author pakutsing
 */
public class AddressService {

    private static Connection conn;
    private static PreparedStatement ps;
    private static ResultSet rs;

    public static Boolean updateaddress(String address_id, String address_name, String address_address) throws SQLException {
        Boolean status = false;
        try {
            String sql = "UPDATE et_address SET address_name = ?,address_address = ? WHERE address_address = ?";

            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setString(1, address_id);
            ps.setString(2, address_name);
            ps.setString(3, address_address);

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
     public static List<ET_Address> getaddress() throws SQLException {
        List<ET_Address> listtraining = new ArrayList<ET_Address>();
        try {
            String sql = "SELECT * FROM et_address ";

            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Address address = new ET_Address();
                address.setAddress_id(rs.getString("address_id"));
                address.setAddress_name(rs.getString("address_name"));
                address.setAddress_address(rs.getString("address_address"));

                listtraining.add(address);

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

    public static List<ET_Address> getaddressbyid(String id) throws SQLException {
        List<ET_Address> listtraining = new ArrayList<ET_Address>();
        try {
            String sql = "SELECT * FROM et_address WHERE address_id = ?";

            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Address address = new ET_Address();
                address.setAddress_id(rs.getString("address_id"));
                address.setAddress_name(rs.getString("address_name"));
                address.setAddress_address(rs.getString("address_address"));

                listtraining.add(address);

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

    public static int getprimarykey() throws ClassNotFoundException, SQLException, NamingException {

        int primarykey = 0;
        try {
            String sql = "SELECT MAX(address_id) as primarykey FROM et_address;";
            conn = ConnectDB.getConnectionMysql();
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
        }
        return primarykey;
    }

    public static Boolean addaddress(String address_name, String address_address) throws ClassNotFoundException, SQLException, NamingException {
        Boolean status = false;
        int primarykey = getprimarykey() + 1;
        try {
            String sql = "INSERT INTO et_address (address_id, address_name, address_address) VALUES (?, ?, ?)";
            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, primarykey);
            ps.setString(2, address_name);
            ps.setString(3, address_address);

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

    public static int gettotletableaddress() throws SQLException {
        int totle = 0;
        try {
            String sql = "SELECT COUNT(*) FROM et_address where address_id > 99";
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

    public static int getfilteredtableaddress(String searchValue) throws SQLException {
        int totle = 0;
        try {
            String sql = "SELECT COUNT(*) FROM et_address WHERE (address_id LIKE ? or address_name LIKE ? or address_address LIKE ?) and address_id > 99";

            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchValue + "%");
            ps.setString(2, "%" + searchValue + "%");
            ps.setString(3, "%" + searchValue + "%");
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

    public static List<ET_Address> gettableaddress(int start, int length, String searchValue) throws SQLException {
        List<ET_Address> listtraining = new ArrayList<ET_Address>();
        try {
            String sql = "SELECT * FROM et_address WHERE (address_id LIKE ? or address_name LIKE ? or address_address LIKE ?) and address_id > 99 LIMIT ?,?";

            conn = ConnectDB.getConnectionMysql();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + searchValue + "%");
            ps.setString(2, "%" + searchValue + "%");
            ps.setString(3, "%" + searchValue + "%");

            ps.setInt(4, start);
            ps.setInt(5, start + length);
            rs = ps.executeQuery();

            while (rs.next()) {
                ET_Address address = new ET_Address();
                address.setAddress_id(rs.getString("address_id"));
                address.setAddress_name(rs.getString("address_name"));
                address.setAddress_address(rs.getString("address_address"));

                listtraining.add(address);

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

    public static Boolean deladdress(String id) throws SQLException {
        Boolean status = false;
        try {
            String sql = "DELETE FROM et_address WHERE address_id = ?";

            conn = ConnectDB.getConnectionMysql();
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
