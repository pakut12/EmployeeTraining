/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.pg.lib.utility;

import java.sql.SQLException;
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

    public static String CoverDate(String txt) {
        String[] date = txt.split("-");
        String coverdate = date[2] + "/" + date[1] + "/" + date[0];
        return coverdate;
    }

    private static String getdatetoday() throws SQLException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd",Locale.ENGLISH);
        Date date = new Date();
        return formatter.format(date);
    }

    public static String GetWorkTime(String startdate) throws NamingException, SQLException {

        String[] datestart = startdate.split("/");
        String[] dateend = getdatetoday().split("-");

        Calendar cal1 = Calendar.getInstance();
        Calendar cal2 = Calendar.getInstance();


       
        cal1.set(Integer.parseInt(datestart[2]), Integer.parseInt(datestart[1]), Integer.parseInt(datestart[0])); // August 1st, 2000
        cal2.set(Integer.parseInt(dateend[0]), Integer.parseInt(dateend[1]), Integer.parseInt(dateend[2])); // May 10th, 2023

        Date date1 = cal1.getTime();
        Date date2 = cal2.getTime();

        int years = cal2.get(Calendar.YEAR) - cal1.get(Calendar.YEAR);
        int months = cal2.get(Calendar.MONTH) - cal1.get(Calendar.MONTH);

        if (months < 0) {
            years--;
            months += 12;
        }

        String worktime = years + " ปี " + (months - 1) + " เดือน";

        return worktime;
    }
}
