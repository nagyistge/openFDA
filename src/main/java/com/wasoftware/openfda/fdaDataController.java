package com.wasoftware.openfda;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.wasoftware.openfda.restclient.drug.*;
import org.json.simple.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

//javax.json.JsonArray;
//import javax.json.JsonObject;


/**
 * Created by yipty on 6/22/2015.
 */

@Controller
public class FdaDataController {
    @RequestMapping(value = "/fdaData", method = RequestMethod.GET)
    public String fdadata(ModelMap model) {
        System.out.println("vvv");
        model.addAttribute("message", "Hello world!");
        return "fdaData";
    }
    @RequestMapping(value = "/getFdaData", method = RequestMethod.GET)
    public String getFdaData(ModelMap model) throws ParseException {
        adverseEvent adverseevent = new adverseEvent();
        String jsonResult = adverseevent.getAdverseEventCountByDate("20040101","20160101");
        JSONArray jsonArrayResult;
        jsonArrayResult = new JSONArray();
        try{
            JSONParser parser = new JSONParser();
            Object obj = parser.parse(jsonResult);
            JSONObject jsonObject = (JSONObject) obj;
            System.out.println("xxx");
            System.out.println(jsonObject.toString());
            jsonArrayResult = (JSONArray) jsonObject.get("results");
            System.out.println(jsonArrayResult.toString());
            System.out.println(" " + jsonArrayResult.size());
        }catch(Exception e){
            System.out.println(e.toString());
        }
        //return new ModelAndView("listUsers", "users", users);

        model.addAttribute("fdaResultSet", jsonArrayResult.toString());
        return "fdaData";
    }
}