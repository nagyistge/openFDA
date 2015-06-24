package com.wasoftware.openfda;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.wasoftware.openfda.restclient.drug.*;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.web.bind.annotation.RequestParam;
import com.wasoftware.util.GetMessage;

/**
 * Created by yipty on 6/22/2015.
 */

@Controller
public class FdaDataController {
    @RequestMapping(value = "/fdaData", method = RequestMethod.GET)
    public String fdaData(ModelMap model) {
        return "fdaData";
    }
    @RequestMapping(value = "/fdaData", method = RequestMethod.POST)
    public String getFdaData(ModelMap model,
                             @RequestParam(value = "fromDate",defaultValue="") String fromDate,
                             @RequestParam(value = "toDate",defaultValue="") String toDate
                             ) {
        String message="";
        if (fromDate.length() > 0 && toDate.length() > 0) {
            adverseEvent adverseevent = new adverseEvent();
            fromDate = reformatDate(fromDate);
            toDate = reformatDate(toDate);
            String jsonResult = "";
            JSONArray jsonArrayResult;
            jsonArrayResult = new JSONArray();
            JSONParser jsonParser = new JSONParser();
            try{
                jsonResult = adverseevent.getAdverseEventCountByDate(fromDate, toDate);
                Object object = jsonParser.parse(jsonResult);
                JSONObject jsonObject = (JSONObject) object;
                jsonArrayResult = (JSONArray) jsonObject.get("results");
                model.addAttribute("fdaResultSet", jsonArrayResult.toString());
            }catch(Exception e){
                System.out.println(e.toString());
                message = GetMessage.getMessage("fdaData.nodata");
            }
            model.addAttribute("hasResult", "yes");
            model.addAttribute("fdaResultSet", jsonArrayResult.toString());
        }
        model.addAttribute("message", message);
        return "fdaData";
    }
    public String reformatDate(String unformattedDate){
        String year = unformattedDate.substring(6, 10);
        String month = unformattedDate.substring(0, 2);
        String day = unformattedDate.substring(3, 5);
        String formattedDate = year + month + day;
        return formattedDate;
    }
}