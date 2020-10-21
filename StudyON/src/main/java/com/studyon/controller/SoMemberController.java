package com.studyon.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.studyon.domain.So_MemberVO;
import com.studyon.service.MailSendService;
import com.studyon.service.So_MemberService;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
@RequestMapping("/SoMember")
public class SoMemberController {
	private static final Logger log = LoggerFactory.getLogger(SoMemberController.class);
	@Autowired
	private MailSendService mailsender;
	private int x;
	@Setter(onMethod_=@Autowired)
	private So_MemberService service;
	private int y;
	
	//회원 등록페이지
	@GetMapping("So_Meminsert")
	public void So_meminsert() {
		log.info("Controller : meminsert...");
	}
	
	//회원 등록 버튼 클릭
	@PostMapping("memberinsertpro")	
	public String So_meminsertPro(So_MemberVO mem,RedirectAttributes rttr,HttpServletRequest request) {
		log.info("Controller : meminsertPro...");
		int row = service.So_MemberInsert(mem);
		log.info("Row : "+row);
		mailsender.mailSendWithUserKey(mem.getMem_email(), mem.getMem_id(), request);
		rttr.addFlashAttribute("row",row);
		return "redirect:/SoMain/index";
	}	
	
	//아이디 중복체크
	@ResponseBody
	@PostMapping("idChk")
	public Map<Object, Object> idChk(@RequestBody String mem_id) {
		int count = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		So_MemberVO mem = service.idChk(mem_id);
		log.info("mem : "+mem);
		if(mem!=null) {
			count=1;
			map.put("cnt", count);
		}
		return map;
	}
	
	@GetMapping("key_alter")
	public String key_alterConfirm(@RequestParam("mem_id") String mem_id, @RequestParam("user_key") String key) {

		mailsender.alter_userKey(mem_id, key); // mailsender의 경우 @Autowired

		return "SoMember/regSuccess";
	}
	
	//로그인페이지
	@GetMapping("So_Login")
	public void So_memLogin() {
		log.info("Controller : memLogin...");
	}
	
	
}
