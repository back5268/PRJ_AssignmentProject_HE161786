/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author bacht
 */
public class DateTimeHelper {
    public static Date toDate(String value, String format) throws ParseException {
        return new SimpleDateFormat(format).parse(value);
    }

    public static Date removeTime(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.set(Calendar.HOUR_OF_DAY, 0);
        cal.set(Calendar.MINUTE, 0);
        cal.set(Calendar.SECOND, 0);
        cal.set(Calendar.MILLISECOND, 0);
        return cal.getTime();
    }

    public static java.util.Date toDateUtil(java.sql.Date d) {
        java.util.Date x = new java.util.Date(d.getTime());
        x = removeTime(x);
        return x;
    }

    public static java.sql.Date toDateSql(java.util.Date d) {
        d= removeTime(d);
        return new java.sql.Date(d.getTime());
    }

    public static int getDayofWeek(java.util.Date d) {
        Calendar c = Calendar.getInstance();
        c.setTime(d);
        int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
        return dayOfWeek;
    }
    
    public static Date addDays(java.util.Date d, int days)
    {
        Calendar cal = Calendar.getInstance(); 
        cal.setTime(d);
        cal.add(Calendar.DATE, days);
        return cal.getTime();
    }
    
    public static ArrayList<java.sql.Date> 
        getDateList(java.sql.Date from, java.sql.Date to)
    {
        ArrayList<java.sql.Date> dates = new ArrayList<>();
        int days = 0;
        java.util.Date e_from = toDateUtil(from);
        java.util.Date e_to = toDateUtil(to);
        while(true)
        {
            java.util.Date d = DateTimeHelper.addDays(e_from, days);
            dates.add(toDateSql(d));
            days++;
            if(d.compareTo(e_to)>=0)
                break;
        }
        return dates;
    }
    
    public static String getDayNameofWeek(java.sql.Date s) {
        java.util.Date d = toDateUtil(s);
        Calendar c = Calendar.getInstance();
        c.setTime(d);
        int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
        switch(dayOfWeek)
        {
            case 1: return "Sunday";
            case 2: return "Monday";
            case 3: return "Tuesday";
            case 4: return "Wednesday";
            case 5: return "Thursday";
            case 6: return "Friday";
            case 7: return "Saturday";
        }
        return "Error";
    }
    
    public static int getYear(java.sql.Date s) {
        java.util.Date d = toDateUtil(s);
        Calendar c = Calendar.getInstance();
        c.setTime(d);
        int year = c.get(Calendar.YEAR);
        return year;
    }
    
    public static String getDayMonth(java.sql.Date s) {
        java.util.Date d = toDateUtil(s);
        Calendar c = Calendar.getInstance();
        c.setTime(d);
        int day = c.get(Calendar.DAY_OF_MONTH);
        int month = c.get(Calendar.MONTH) + 1;
        String days = (day<10)?"0" + Integer.toString(day):Integer.toString(day);
        String months = (month<10)?"0" + Integer.toString(month):Integer.toString(month);
        return months + "-" + days;
    }
    
    public static String getWeek(java.sql.Date s1, java.sql.Date s2) {
        return DateTimeHelper.getDayMonth(s1) + " To " + DateTimeHelper.getDayMonth(s2);
    }
    
    public static ArrayList<String> 
        getDayMonthList(java.sql.Date from) {
            ArrayList<String> daymonths = new ArrayList<>();
        int check = 0;
        java.util.Date e_from = toDateUtil(from);
        e_from = DateTimeHelper.addDays(e_from, -63);
        java.util.Date e_to = DateTimeHelper.addDays(e_from, 6);
        while(check<20)
        {
            String daymonth = DateTimeHelper.getWeek(DateTimeHelper.toDateSql(e_from), toDateSql(e_to));
            daymonths.add(daymonth);
            e_from = DateTimeHelper.addDays(e_from, 7);
            e_to = DateTimeHelper.addDays(e_from, 6);
            check+=1;
        }
        return daymonths;
        }
    
    public static int compare(java.sql.Date a, java.sql.Date b)
    {
       
        Date e_a = toDateUtil(a);
        Date e_b = toDateUtil(b);
         System.out.println(a + " " + b +" " +e_a.compareTo(e_b));
        return e_a.compareTo(e_b);
    }
}
