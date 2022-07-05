package com.cuj.edge.end.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EndController {
	
	@RequestMapping(value = "/end", method = RequestMethod.POST)
	public String home(Locale locale, Model model) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		String strDate = sdf.format(date);
		
		model.addAttribute("serverTime", strDate);
		
		return "end/end";
	}
	
}
