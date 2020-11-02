package com.studyon.controller;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.studyon.domain.So_LectureVO;
import com.studyon.service.So_LectureService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
@RequestMapping("SoLecture")
public class SoLectureController {
	
	private static final Logger log = LoggerFactory.getLogger(SoLectureController.class);
	
	// 파일 저장 위치
//	private static final String uploadFolder = "/Volumes/HoMill D drive/Programing_Project/StudyON_Upload/lecture"; 
	
	@Setter(onMethod_ =@Autowired)
	private So_LectureService service;
	
	
	@GetMapping("So_Lectinsert")
	public void So_lectinsert() {
		log.info("Controller : lectinsert....");
	}
	
	@GetMapping("So_LectListinsert")
	public void So_lectListInsert() {
		log.info("Controller : lectinsert....");
	}
	
	
	@PostMapping("lectureInsertpro")
	public String lectureInsertpro(So_LectureVO vo) {
		log.info("VO : "+vo);
		log.info("Controller : lectureInsertpro");
		
		int row = service.So_LectureInsert(vo);
		
		return "redirect:/";
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
	
	// 강의 저장하는 폴더 생성
//	private String getFolder() {
//		
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
