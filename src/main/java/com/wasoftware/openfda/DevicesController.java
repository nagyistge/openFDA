package com.wasoftware.openfda;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by ehung on 6/25/2015.
 */
public class DevicesController {
	@RequestMapping(value = "/devices", method = RequestMethod.GET)
	public String fdaData(ModelMap model) {
		return "devices";
	}
}
