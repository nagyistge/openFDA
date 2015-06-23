package com.wasoftware.openfda;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.LinkedHashMap;
import java.util.List;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by yipty on 6/22/2015.
 */

@Controller
public class fdaDataController {
    @RequestMapping(value = "/FdaData", method = RequestMethod.GET)
    public String Fdadata(ModelMap model) {
        model.addAttribute("message", "Hello world!");
        return "FdaData";
    }
    @RequestMapping(value = "/getFdaData", method = RequestMethod.GET)
    public String FdadataAPI(ModelMap model) {
        RestTemplate restTemplate = new RestTemplate();
        String url="https://api.fda.gov/drug/event.json?search=receivedate:[20040101+TO+20160101]&count=receivedate";
        //List<LinkedHashMap> users = restTemplate.getForObject(url, List.class);
        String users = "";
        System.out.println(users.toString());
        //return new ModelAndView("listUsers", "users", users);

        //model.addAttribute("message", "Hello world!");
        return "login";
    }
}
