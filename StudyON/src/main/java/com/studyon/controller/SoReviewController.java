package com.studyon.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.studyon.domain.PageVO;
import com.studyon.domain.So_MemberVO;
import com.studyon.domain.So_ReviewVO;
import com.studyon.service.So_ReviewService;
import com.studyon.util.PgIndex;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
@RequestMapping("/SoReview")
public class SoReviewController {
	private static final Logger log = LoggerFactory.getLogger(SoReviewController.class);
	
	@Setter(onMethod_=@Autowired)
	private So_ReviewService service;
	
	@GetMapping("So_Review")
	public void SoReview(Model model,@RequestParam("page") int page,PageVO vo) {
		log.info("Controller : review......");
		model.addAttribute("list",service.So_ReviewList(vo));
		model.addAttribute("page",page);
		
		// 평점 옵션
		Map ratingOptions = new HashMap();
		ratingOptions.put(0, "☆☆☆☆☆");
		ratingOptions.put(1, "★☆☆☆☆");
		ratingOptions.put(2, "★★☆☆☆");
		ratingOptions.put(3, "★★★☆☆");
		ratingOptions.put(4, "★★★★☆");
		ratingOptions.put(5, "★★★★★");
		model.addAttribute("ratingOptions", ratingOptions);
	}
	
	@ResponseBody
	@PostMapping("So_Review")
	public Map<String, Object> SoReviewPro(Model model,@RequestBody So_ReviewVO rvo,HttpServletRequest request) {
		log.info("Controller : reviewPro...........");
		Map<String, Object> map = new HashMap<String, Object>();
		log.info("rvo : "+rvo);
		int row = 0;
		int rating = rvo.getRating().size();
		log.info("rating : "+ rating);
		So_ReviewVO rv = new So_ReviewVO();
		HttpSession session = request.getSession();
		So_MemberVO mvo = (So_MemberVO)session.getAttribute("member");
		log.info("memid : "+mvo);
		rv.setMem_id(mvo.getMem_id());
		rv.setContents(rvo.getContents());
		rv.setRate(rating);
		log.info("rv : "+rv);
		row = service.reviewinsert(rv);
		map.put("cnt", row);
		return map;
	}
	
	//이전 삭제코드
//	@ResponseBody
//	@PostMapping("So_ReviewDelete")
//	public Map<String, Object> SoReviewDelete(Model model,@RequestBody String bno,HttpServletRequest request){
//		log.info("Controller : reviewDelete........");
//		int cnt1 = 0;
//		log.info(bno);
//		String bno1 = bno;
//		
//		log.info("bno1 : "+bno1);
//		Map<String, Object> map = new HashMap<String, Object>();
//		cnt1 = service.So_ReviewDelete(Integer.parseInt(bno1.substring(4)));
//		log.info("cnt1"+cnt1);
//		map.put("cnt1", cnt1);
//		return map;
//	}
	
	@ResponseBody
	@PostMapping("getReqlyList")
	public List<So_ReviewVO> SoReviewList(Model model,@RequestParam("page") int page,PageVO vo){
		log.info("Controller : reviewList...........");
		model.addAttribute("page",page);
		String url = "So_Review",addtag="";
		log.info("page : "+page);
		int nowpage=1; //현재페이지
		int maxlist=10;//페이지당 글수
		int totpage=1;//총페이지
		int totcount=0;
		totcount = service.So_ReviewCount();//총 글 수 카운트
		log.info("totcount : "+totcount);
		//총 페이지 계산
		if(totcount%maxlist==0) {
			totpage = totcount/maxlist;
		}else {
			totpage=totcount/maxlist+1;
		}
		if(totpage==0) {
			totpage=1;
		}
		if(page!=0) {
			nowpage=page;
		}
		if(nowpage>totpage) {
			nowpage=totpage;
		}
		log.info("nowpage : "+nowpage);
		//현재페이지 시작번호
		int startpage = (nowpage-1)*maxlist+1;
		int endpage = nowpage * maxlist;
		int listcount=totcount-((nowpage-1)*maxlist);
		log.info("startpage : "+startpage);
		log.info("endpage : "+endpage);
		vo.setStartpage(startpage);
		vo.setEndpage(endpage);
	
		
		return service.So_ReviewList(vo);
		
	}
	
	@GetMapping("test1")
	public void test1() {
		
	}
	
	@ResponseBody
	@PostMapping("So_ReviewModify")
	public Map<String, Object> SoReviewModify(@RequestBody So_ReviewVO rvo,Model model) {
		log.info("Controller : reviewModiry...........");
		Map<String, Object> map = new HashMap<String, Object>();
		log.info("rvo : "+rvo);
		log.info("page : "+rvo.getPage());
		int row = service.So_ReviewModify(rvo);
		log.info("cnt : "+row);
		map.put("page", rvo.getPage());
		map.put("cnt", row);
		return map;
	}
	
	
	@ResponseBody
	@PostMapping("getReqlyListMore")
	public List<So_ReviewVO> SoReviewListMore(Model model,@RequestParam("page") int page,PageVO vo){
		log.info("Controller : reviewListMore...........");
		model.addAttribute("page",page);
		String url = "So_Review",addtag="";
		log.info("page : "+page);
		int nowpage=1; //현재페이지
		int maxlist=10;//페이지당 글수
		int totpage=1;//총페이지
		int totcount=0;
		totcount = service.So_ReviewCount();//총 글 수 카운트
		log.info("totcount : "+totcount);
		//총 페이지 계산
		if(totcount%maxlist==0) {
			totpage = totcount/maxlist;
		}else {
			totpage=totcount/maxlist+1;
		}
		if(totpage==0) {
			totpage=1;
		}
		if(page!=0) {
			nowpage=page;
		}
		if(nowpage>totpage) {
			nowpage=totpage;
		}
		log.info("nowpage : "+nowpage);
		//현재페이지 시작번호
		int startpage = (nowpage-1)*maxlist+1;
		int endpage = nowpage * maxlist;
		int listcount=totcount-((nowpage-1)*maxlist);
		log.info("startpage : "+startpage);
		log.info("endpage : "+endpage);
		vo.setStartpage(startpage);
		vo.setEndpage(endpage);
		
		return service.So_ReviewList(vo);
		
	}
	
	@ResponseBody
	@PostMapping("So_ReviewDelete")
	public Map<String, Object> SoReviewDelete(@RequestBody So_ReviewVO rvo) {
		log.info("Controller : reviewDelete...........");
		Map<String, Object> map = new HashMap<String, Object>();
		int row = service.So_ReviewDelete(rvo);
		log.info("row : "+row);
		log.info("page : "+rvo.getPage());
		map.put("cnt", row);
		map.put("page", rvo.getPage());
		return map;
	}
	
}
