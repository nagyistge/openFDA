package com.wasoftware.openfda.util;

import java.util.Locale;
import java.util.ResourceBundle;
import org.springframework.context.i18n.LocaleContextHolder;
/**
 * Created by yipty on 6/24/2015.
 */
public class GetMessage {
    public static String getMessage (String inputMessageCode){
        String messageStr = "";
        //this is only work for spring framework
        Locale locale = LocaleContextHolder.getLocale();
        ResourceBundle messages = ResourceBundle.getBundle("messages", locale);
        try{
            messageStr = messages.getString(inputMessageCode);
        }catch(Exception e){
            System.out.println(e.toString());
        }
        return messageStr;
    }
}
