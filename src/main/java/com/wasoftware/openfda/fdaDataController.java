package com.wasoftware.openfda;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.wasoftware.openfda.restclient.drug.*;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.json.simple.parser.ParseException;
import java.io.*;

//javax.json.JsonArray;
//import javax.json.JsonObject;


/**
 * Created by yipty on 6/22/2015.
 */

@Controller
public class FdaDataController {
    @RequestMapping(value = "/fdaData", method = RequestMethod.GET)
    public String fdadata(ModelMap model) {
        return "fdaData";
    }
    @RequestMapping(value = "/fdaData", method = RequestMethod.POST)
    public String getFdaData(ModelMap model,
                             @RequestParam(value = "fromDate") String fromDate,
                             @RequestParam(value = "toDate") String toDate
                             ) {
        System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxx");
        System.out.println(fromDate);
        System.out.println(toDate);
        System.out.println("xxxxxxxxxxxxxxxxxxxxxxxxx");

        if (fromDate.length() > 0 && toDate.length() > 0) {
            adverseEvent adverseevent = new adverseEvent();
            //String jsonResult = adverseevent.getAdverseEventCountByDate("20040101", "20160101");
            System.out.println("fd"+ fromDate);
            System.out.println("td"+ toDate);
            fromDate = reformatDate(fromDate);
            toDate = reformatDate(toDate);
            String jsonResult = adverseevent.getAdverseEventCountByDate(fromDate, toDate);
            JSONArray jsonArrayResult;
            jsonArrayResult = new JSONArray();
            try {
                JSONParser jsonParser = new JSONParser();
                Object object = jsonParser.parse(jsonResult);
                JSONObject jsonObject = (JSONObject) object;
                jsonArrayResult = (JSONArray) jsonObject.get("results");
            } catch (Exception e) {
                System.out.println(e.toString());
            }
            //return new ModelAndView("listUsers", "users", users);

            model.addAttribute("fdaResultSet", jsonArrayResult.toString());
        }
        return "fdaData";
    }
    public String reformatDate(String unformattedDate){
        String year = unformattedDate.substring(6, 9);
        String month = unformattedDate.substring(0, 1);
        String day = unformattedDate.substring(3, 4);
        System.out.println("y"+year);
        System.out.println("m"+month);
        System.out.println("d"+day);
        String formattedDate = month + "/" + day + "/" + year;
        return formattedDate;
    }
}