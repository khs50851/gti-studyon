package com.studyon.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@Setter(onMethod_=@Autowired)
	private So_MemberService service;
	
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
	
	//전화번호 중복체크
	@ResponseBody
	@PostMapping("SearchId")
	public Map<Object, Object> SerchID(@RequestBody String mem_phone){
		int cnt = 0;
		Map<Object, Object> map = new HashMap<Object, Object>();
		So_MemberVO memphone = service.phoneChk(mem_phone);
		log.info("mem_phone : "+mem_phone);
		if(memphone!=null) {
			cnt = 1;
			map.put("cnt1", cnt);
		}
		return map;
	}
	
	@GetMapping("key_alter")
	public String key_alterConfirm(@RequestParam("mem_id") String mem_id, @RequestParam("user_key") String key) {
		mailsender.alter_userKey(mem_id, key); // mailsender의 경우 @Autowired
		return "SoMember/regSuccess";
	}
	
	@GetMapping("So_Login")
	public void So_memLogin() {
		log.info("Controller : memLogin...");
	}
	
	@PostMapping("So_Login")
	public String So_memLoginPro(So_MemberVO mem,HttpServletRequest req,RedirectAttributes rttr) {
		log.info("Controller : memLoginPro...");
		So_MemberVO vo = service.Login(mem);
		int result1 = 0;
		HttpSession session = req.getSession();
		if(vo==null) {
			result1=0;
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg",result1);
			return "redirect:/SoMember/So_Login";
		}else if(vo!=null&&vo.getUser_key().equals("Y")) {
			session.setAttribute("member", vo);
			return "redirect:/SoMain/index";
		}else if(vo!=null&&!vo.getUser_key().equals("Y")) {
			result1=1;
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg",result1);
			return "redirect:/SoMember/So_Login";
		}else {
			return "redirect:/SoMain/index";
		}
		
	}
	
	//ID찾기 눌렀을때
	@GetMapping("So_Idchk")
	public void So_Idchk() {
		log.info("Controller : So_Idchk...");
	}
	
	//이름이랑 전화번호 입력후 확인버튼 눌렀을때
	@PostMapping("So_Idchk")
	public String So_IdchkPro(@RequestParam("mem_name") String mem_name,@RequestParam("mem_phone") String mem_phone,RedirectAttributes rttr) {
		log.info("Controller : So_IdchkPro...");
		log.info("mem : "+mem_name+"mem : "+mem_phone);
		int result = 0;
			String searchid = service.serchId(mem_name,mem_phone);
			if(searchid!=null) {
				rttr.addFlashAttribute("id",searchid);
			
			}
	
		return "redirect:/SoMember/IdcheckPro";
	}
	
	@GetMapping("IdcheckPro")
	public void So_IdchkPropass() {
		log.info("Controller : So_IdchkPropass...");
	}
	
		//PW찾기 눌렀을때
		@GetMapping("So_Pwchk")
		public void So_Pwchk() {
			log.info("Controller : So_Pwchk...");
		}
		
		//ID랑 Email 입력후 확인버튼 눌렀을때
		@PostMapping("So_Pwchk")
		public String So_PwchkPro(@RequestParam("mem_email") String mem_email,@RequestParam("mem_id") String mem_id,HttpServletRequest request,RedirectAttributes rttr) {
			log.info("Controller : So_IdchkPro...");
			int result = 0;
			So_MemberVO mem = service.Searchmem(mem_email, mem_id);
			if(mem!=null) {
				mailsender.mailSendWithPassword(mem_email, mem_id, request);
				rttr.addFlashAttribute("row2",result);
				return "redirect:/SoMain/index";
			}else {
				result=1;
				rttr.addFlashAttribute("row2",result);
				return "redirect:/SoMember/So_Pwchk";
			}
			
			
			
		}
	
}
