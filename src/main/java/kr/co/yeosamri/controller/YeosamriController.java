package kr.co.yeosamri.controller;

import java.text.DateFormat;
import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.json.*;

import kr.co.yeosamri.service.*;
import kr.co.yeosamri.vo.*;

@Controller
public class YeosamriController {
	
	@Autowired
	YeosamriService service;
	
	private static final Logger logger = LoggerFactory.getLogger(YeosamriController.class);
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "main";
	}
	
	@RequestMapping(value = "/villageHall", method = {RequestMethod.GET, RequestMethod.POST})
	public String timeLine(Model model) {
		return "villageHall";
	}
	
	@RequestMapping(value = "/insertHistory", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView insertHistory(Model model, @RequestParam HashMap<String, Object> requestMap) {
		ModelAndView modelAndView = new ModelAndView(new MappingJackson2JsonView());
		
		requestMap.put("result", service.insertHistory(requestMap));
		modelAndView.addObject("requestMap", requestMap);
		
		return modelAndView;
	}
	
}
