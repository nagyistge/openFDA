package com.wasoftware.openfda;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;

import java.util.LinkedHashMap;
import java.util.List;

@Controller
public class HelloController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String gotoLogin(ModelMap model) {
		//model.addAttribute("message", "Hello world!");
		return "login";
	}
	@RequestMapping(value = "/hello", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		model.addAttribute("message", "Hello world!");
		return "hello";
	}
	@RequestMapping(value = "/FdaData", method = RequestMethod.GET)
	public String getFdadata(ModelMap model) {
		model.addAttribute("message", "Hello world!");
		return "FdaData";
	}
	@RequestMapping(value = "/getFdaData", method = RequestMethod.GET)
	public String getFdadataAPI(ModelMap model) {
		RestTemplate restTemplate = new RestTemplate();
		String url="https://api.fda.gov/drug/event.json?search=receivedate:[20040101+TO+20160101]&count=receivedate";
		//List<LinkedHashMap> users = restTemplate.getForObject(url, List.class);
        String users = "";
		System.out.println(users.toString());
		//return new ModelAndView("listUsers", "users", users);

		model.addAttribute("message", "Hello world!");
		return "FdaData";
	}
}