package com.wasoftware.openfda;

import com.wasoftware.util.GetMessage;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@RequestMapping(value = "/", method = RequestMethod.GET)

	public String gotoLogin(ModelMap model) {
		return "login";
	}

	@RequestMapping(value = "/welcome", method = RequestMethod.GET)

	public String printWelcome(ModelMap model) {
		model.addAttribute("message", GetMessage.getMessage("home.introduction"));
		return "welcome";
	}
}