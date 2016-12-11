package kr.co.yeosamri.controller;

import java.io.*;
import java.text.DateFormat;
import java.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;
import org.springframework.web.servlet.*;
import org.springframework.web.servlet.view.json.*;

import kr.co.yeosamri.service.*;
import kr.co.yeosamri.vo.*;

@Controller
public class YeosamriController {
	ModelAndView modelAndView = new ModelAndView(new MappingJackson2JsonView());
	
	@Autowired
	YeosamriService service;
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public String home(Model model) {
		return "main";
	}
	
	@RequestMapping(value = "/villageHall", method = {RequestMethod.GET, RequestMethod.POST})
	public String timeLine(Model model, @RequestParam HashMap<String, Object> requestMap) {
		List<HistoryVO> historyList = service.selectHistory();
		model.addAttribute("historyList", historyList);
		
		return "villageHall";
	}
	
	@RequestMapping(value = "/insertHistory", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView insertHistory(Model model, @RequestParam HashMap<String, Object> requestMap,
			MultipartHttpServletRequest mRequest) {
		
		String uploadPath 	  = "D:/programming/workspace/yeosamri/src/main/webapp/upload/";
//		String uploadPath 	  = "/usr/local/tomcat/webapps/yeosamri/upload/";
		Iterator<String> iter = mRequest.getFileNames();
		UUID randomUUID 	  = UUID.randomUUID();
		
		while(iter.hasNext()) {
			String uploadFileName 	= iter.next();			
			MultipartFile mFile 	= mRequest.getFile(uploadFileName);
			String saveFileName 	= mFile.getOriginalFilename();
			
			if(saveFileName != null && !saveFileName.equals(" ")) {
				try {
					mFile.transferTo(new File(uploadPath+randomUUID+"_"+saveFileName));  // 첨부된 파일을 지정한 경로에 저장해주는 메서드
					requestMap.put("photoUrl", randomUUID+"_"+saveFileName);
				} catch (IllegalStateException e) {					
					e.printStackTrace();
				} catch (IOException e) {					
					e.printStackTrace();
				}
			}			
		}
		
		requestMap.put("result", service.insertHistory(requestMap));
		modelAndView.setViewName("redirect:/villageHall");
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/selectHistoryDetail", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView selectHistoryDetail(Model model, @RequestParam HashMap<String, Object> requestMap) {
		HistoryVO vo = service.selectHistoryDetail(requestMap);
		modelAndView.addObject("vo", vo);
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/updateHistory", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView updateHistory(Model model, @RequestParam HashMap<String, Object> requestMap,
			MultipartHttpServletRequest mRequest) {
		String uploadPath 	  = "D:/programming/workspace/yeosamri/src/main/webapp/upload/";
//		String uploadPath 	  = "/usr/local/tomcat/webapps/yeosamri/upload/";
		Iterator<String> iter = mRequest.getFileNames();
		UUID randomUUID 	  = UUID.randomUUID();
		
		while(iter.hasNext()) {
			String uploadFileName 	= iter.next();			
			MultipartFile mFile 	= mRequest.getFile(uploadFileName);
			String saveFileName 	= mFile.getOriginalFilename();
			
			if(saveFileName != null && !saveFileName.equals(" ")) {
				try {
					mFile.transferTo(new File(uploadPath+randomUUID+"_"+saveFileName));  // 첨부된 파일을 지정한 경로에 저장해주는 메서드
					requestMap.put("photoUrl", randomUUID+"_"+saveFileName);
				} catch (IllegalStateException e) {					
					e.printStackTrace();
				} catch (IOException e) {					
					e.printStackTrace();
				}
			}			
		}
		
		service.updateHistory(requestMap);
		modelAndView.setViewName("redirect:/villageHall");
		
		return modelAndView;
	}
	
}
