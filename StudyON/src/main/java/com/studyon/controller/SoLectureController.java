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
@RequestMapping("SoLecture")
public class SoLectureController {
	
	private  static final Logger log = LoggerFactory.getLogger(SoLectureController.class);
	
	@GetMapping("So_Lectinsert")
	public void So_lectinsert() {
		log.info("Controller : lectinsert....");
	}
}
