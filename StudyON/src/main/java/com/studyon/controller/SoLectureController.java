package com.studyon.controller;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("SoLecture")
public class SoLectureController {
	
	private static final Logger log = LoggerFactory.getLogger(SoLectureController.class);
	
	// 파일 저장 위치
//	private static final String uploadFolder = "/Volumes/HoMill D drive/Programing_Project/StudyON_Upload/lecture"; 
	
	
	@GetMapping("So_Lectinsert")
	public void So_lectinsert() {
		log.info("Controller : lectinsert....");
	}
	
	
	// MultipartFile 타입
	
//	@PostMapping("/uploadFormAction")
//	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {
//		
//		for (MultipartFile multipartFile : uploadFile) {
//			
//			log.info("----------------------------------------------------");
//			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
//			log.info("Upload File Size : " + multipartFile.getSize());
//			
//			File saveFile = new File(uploadFolder, multipartFile.getOriginalFilename());
//			
//			try {
//				multipartFile.transferTo(saveFile);
//			}catch(Exception e) {
//				log.error(e.getMessage());
//			} // end of catch
//			
//		} // end of for
//	
//	}
	
	// Ajax 타입
	
	@PostMapping("/uploadAjaxAction")
	public void uploadAjaxPost(MultipartFile[] uploadFile) {
		
		log.info("update ajax post.........");
		
		String uploadFolder = "/Volumes/HoMill D drive/Programing_Project/StudyON_Upload/lecture";
		
		for (MultipartFile multipartFile : uploadFile) {
			
			log.info("------------------------------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());
			
			String uploadFileName = multipartFile.getOriginalFilename();
			
			// IE has file path
			uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1);
			log.info("only file name : " + uploadFileName);
			
			File saveFile = new File(uploadFolder, uploadFileName);
			
			try {
				
				multipartFile.transferTo(saveFile);
			}catch(Exception e) {
				log.error(e.getMessage());
			} // end of catch
			 
		} // end of for
	}
}
