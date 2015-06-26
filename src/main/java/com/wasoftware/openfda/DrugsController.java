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
import com.wasoftware.util.*;

/**
 * Created by yipty on 6/22/2015.
 */

@Controller
public class DrugsController {
    @RequestMapping(value = "/drugs", method = RequestMethod.GET)
    public String fdaData(ModelMap model) {
        return "drugs";
    }
    @RequestMapping(value = "/drugs", method = RequestMethod.POST)
    public String getFdaData(ModelMap model,
                             @RequestParam(value = "fromDate",defaultValue="") String fromDate,
                             @RequestParam(value = "toDate",defaultValue="") String toDate
    ) {
        String errorMessage="";
        if (fromDate.length() > 0 && toDate.length() > 0) {
            adverseEvent adverseevent = new adverseEvent();
            fromDate = FormatDate.formatDate(fromDate);
            toDate = FormatDate.formatDate(toDate);
            String jsonResult = "";
            JSONArray jsonArrayResult;
            jsonArrayResult = new JSONArray();
            JSONParser jsonParser = new JSONParser();
            try{
                jsonResult = adverseevent.getAdverseEventCountByDate(fromDate, toDate);
                Object object = jsonParser.parse(jsonResult);
                JSONObject jsonObject = (JSONObject) object;
                jsonArrayResult = (JSONArray) jsonObject.get("results");
                model.addAttribute("drugResultSet", jsonArrayResult.toString());
            }catch(Exception e){
                System.out.println(e.toString());
                errorMessage = GetMessage.getMessage("drugs.nodata");
            }
            model.addAttribute("hasResult", "yes");
            model.addAttribute("drugResultSet", jsonArrayResult.toString());
        }
        model.addAttribute("errorMessage", errorMessage);
        return "drugs";
    }

}
