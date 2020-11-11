package com.studyon.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class UploadController {
	
	private static final Logger log = LoggerFactory.getLogger(UploadController.class);
	
	@GetMapping("/uploadForm")
	public void uploadForm() {
		
		log.info("upload form");
	}
	
}
