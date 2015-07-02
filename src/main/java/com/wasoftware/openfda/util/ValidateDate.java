package com.wasoftware.openfda.util;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by yipty on 7/2/2015.
 */
public class ValidateDate {
    public static boolean validateDate(String input){
        boolean isValidDate = false;
        try {
            SimpleDateFormat simpleDateFormatdf = new SimpleDateFormat("MM/dd/yyyy");
            Date dateInputDate = simpleDateFormatdf.parse(input);//"2009-12-31");
            isValidDate = true;
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return isValidDate;
    }
    public static boolean compareDate(String fromDate, String toDate){
        boolean isToDateGreaterOrEqual = false;
        try {

            SimpleDateFormat simpleDateFormatdf = new SimpleDateFormat("MM/dd/yyyy");
            Date dateFromDate = simpleDateFormatdf.parse(fromDate);//"2009-12-31");
            Date dateToDate = simpleDateFormatdf.parse(toDate);//"2010-01-31");


            if (dateFromDate.compareTo(dateToDate) <= 0) {
                isToDateGreaterOrEqual = true;
            }



        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return isToDateGreaterOrEqual;
    }
}
