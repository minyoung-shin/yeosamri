package kr.co.yeosamri.controller;

import java.io.*;
import java.util.*;

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
//		String uploadPath = "D:/programming/workspace/yeosamri/src/main/webapp/upload/";
		String uploadPath = "/usr/local/tomcat/webapps/yeosamri/upload/";
		
		UUID randomUUID 	 = UUID.randomUUID();
		Iterator<String> itr = mRequest.getFileNames();
		
        if(itr.hasNext()) {
        	MultipartFile mFile = mRequest.getFile(itr.next());
			String saveFileName = mFile.getOriginalFilename();
			
			if(saveFileName != null && !saveFileName.equals(" ")) {
				try {
					mFile.transferTo(new File(uploadPath+randomUUID+"_"+saveFileName));
					requestMap.put("photoUrl", randomUUID+"_"+saveFileName);
				} catch (IllegalStateException e) {					
					e.printStackTrace();
				} catch (IOException e) {					
					e.printStackTrace();
				}
			}
        }  
		
        modelAndView.addObject("result", service.insertHistory(requestMap));
		
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
//		String uploadPath = "D:/programming/workspace/yeosamri/src/main/webapp/upload/";
		String uploadPath = "/usr/local/tomcat/webapps/yeosamri/upload/";
		
		UUID randomUUID 	 = UUID.randomUUID();
		Iterator<String> itr = mRequest.getFileNames();
		
		if(itr.hasNext()) {
			MultipartFile mFile = mRequest.getFile(itr.next());
			String saveFileName = mFile.getOriginalFilename();

			// 파일을 선택했을 때
			if(saveFileName.length() > 0) {
				try {
					mFile.transferTo(new File(uploadPath+randomUUID+"_"+saveFileName));
					requestMap.put("photoUrl", randomUUID+"_"+saveFileName);
				} catch (IllegalStateException e) {					
					e.printStackTrace();
				} catch (IOException e) {					
					e.printStackTrace();
				}
			}			
		}
		
		modelAndView.addObject("result", service.updateHistory(requestMap));
		
		return modelAndView;
	}
	
	@RequestMapping(value = "/deleteHistory", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView deleteHistory(Model model, @RequestParam HashMap<String, Object> requestMap) {
		modelAndView.addObject("result", service.deleteHistory(requestMap));
		
		return modelAndView;
	}
	
}
