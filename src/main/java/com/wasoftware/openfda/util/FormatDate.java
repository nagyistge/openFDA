package com.wasoftware.openfda.util;

/**
 * Created by yipty on 6/24/2015.
 */
public class FormatDate {
    public static String formatDate(String unformattedDate){
        // this function is to convert date string from 06/01/2014  to date string 20140601
        String year = unformattedDate.substring(6, 10);
        String month = unformattedDate.substring(0, 2);
        String day = unformattedDate.substring(3, 5);
        String formattedDate = year + month + day;
        return formattedDate;
    }
}
