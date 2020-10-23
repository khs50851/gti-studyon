package com.studyon.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("SoMain/")
public class SoMainController {
	private static final Logger log = LoggerFactory.getLogger(SoMainController.class);
	
	
	@GetMapping("index")
	public void So_index() {
		log.info("Controller : index.....");
	}
	
	@GetMapping("inner-page")
	public void So_innerPage() {
		
	}
	
	@GetMapping("logout")
	public String Logout(HttpSession session) {
	session.invalidate();
	return "redirect:/SoMain/index";
	}
	
}
