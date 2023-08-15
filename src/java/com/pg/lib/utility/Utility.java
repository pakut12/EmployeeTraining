/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.utility;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;
import javax.naming.NamingException;

/**
 *
 * @author pakutsing
 */
public class Utility {

    public static String ChackType(String type_id) {
        String type = "";
        if (type_id.equals("")) {
            type = "0";
        } else if (type_id.equals("ภายใน")) {
            type = "1";
        } else if (type_id.equals("ภายนอก")) {
            type = "2";
        }
        return type;
    }

    public static String CoverDate(String txt) {

        String[] date = txt.split("-");
        String coverdate = date[2] + "/" + date[1] + "/" + date[0];

        //String[] date = txt.split("/");
        //String coverdate = date[2] + "-" + String.format("%2s", date[1]).replace(' ', '0') + "-" + String.format("%2s", date[0]).replace(' ', '0');
        return coverdate;
    }

    public static String CoverDate2(String txt) {

        String[] date = txt.split("/");
        String coverdate = date[2] + "-" + date[1] + "-" + date[0];

        return coverdate;
    }

    public static String getdatetoday() throws SQLException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
        Date date = new Date();
        return formatter.format(date);
    }

    public static String GetWorkTime(String startdate) throws NamingException, SQLException, ParseException {

      
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date startDate = sdf.parse(CoverDate2(startdate)); // Replace with your start date

        Date endDate = sdf.parse(getdatetoday());     // Replace with your end date

        Calendar startCal = Calendar.getInstance();
        startCal.setTime(startDate);

        Calendar endCal = Calendar.getInstance();
        endCal.setTime(endDate);

        int years = 0;
        int months = 0;

        while (startCal.before(endCal)) {
            startCal.add(Calendar.MONTH, 1);
            months++;

            if (startCal.after(endCal)) {
                startCal.add(Calendar.MONTH, -1);
                months--;
                break;
            }
        }

        years = months / 12;
        months = months % 12;


        String worktime = years + " ปี " + months + " เดือน";

        return worktime;
    }
}
