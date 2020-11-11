package com.studyon.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.studyon.domain.PageVO;
import com.studyon.domain.So_MemberVO;
import com.studyon.domain.So_QnaVO;
import com.studyon.domain.So_ReplyVO;
import com.studyon.service.So_QnaService;
import com.studyon.service.So_ReplyService;
import com.studyon.util.PgIndex;

import lombok.AllArgsConstructor;
import lombok.Setter;

@Controller
@AllArgsConstructor
@RequestMapping("/SoQna")
public class SoQnaController {
	private static final Logger log = LoggerFactory.getLogger(SoQnaController.class);
	
	@Setter(onMethod_=@Autowired)
	private So_QnaService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Autowired
	private So_ReplyService rservice;
	
	@GetMapping("So_QnaWrite")
	public void qnaWrite(@ModelAttribute("page") int page) {
		log.info("controller : qnawrite.......");
	}
	
	
	
	@PostMapping("ckUpload")
	public void postCkEditorImgUpload(HttpServletRequest req,HttpServletResponse res,@RequestParam MultipartFile upload) {
		//랜덤문자 생성
		log.info("post CKEditor img upload");
		UUID uid = UUID.randomUUID();
		
		OutputStream out = null;
		PrintWriter printwriter = null;
		res.setCharacterEncoding("utf-8");
		res.setContentType("text/html;charset=utf-8");
		
		try {
			String fileName=upload.getOriginalFilename(); // 파일이름 가져오기
			byte[] bytes = upload.getBytes();
			//업로드 경로
			String ckUploadPath = uploadPath+File.separator+"ckUpload"+File.separator+uid+"_"+fileName;
			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush();//out에 저장된 데이터를 전송하고 초기화
			
			String callback = req.getParameter("CKEditorFuncNum");
			printwriter = res.getWriter();
			String fileUrl = "/ckUpload/"+uid+"_"+fileName; // 작성화면
			//업로드시 메시지 출력
			printwriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
			printwriter.flush();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			 try {
				 if(out!=null) {out.close();}
				 if(printwriter!=null) {printwriter.close();}
			 
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	@PostMapping("So_QnaWrite")
	public String qnaWritePro(So_QnaVO qvo,@ModelAttribute("page") int page,RedirectAttributes rttr,HttpServletRequest request) {
		log.info("controller : QnaWritePro.......");
		log.info("qvo : "+qvo);
		So_QnaVO a = new So_QnaVO();
		HttpSession session = request.getSession();
		So_MemberVO mvo = (So_MemberVO)session.getAttribute("member");
		log.info("memid : "+mvo);
		a.setMem_id(mvo.getMem_id());
		a.setQna_content(qvo.getQna_content());
		a.setQna_title(qvo.getQna_title());
		log.info("a : "+a);
		int row = 0;
		row = service.So_QnaWrite(a);
		rttr.addFlashAttribute("page",page);
		rttr.addFlashAttribute("row3",row);
		log.info("row3 : "+row);
		return "redirect:/SoQna/So_Qna?page="+page;
		
	}
	
//	@GetMapping("So_Qna")
//	public void qnalist(Model model) {
//		
//		log.info("Controller : QnaList.......");
//		model.addAttribute("list",service.So_QnaList());
//	}
	
	@GetMapping("")
	public String Goqnalist() {
		log.info("Controller : GoQnaList");
		return "redirect:/SoQna/So_Qna?page=1";
	}
	
	@GetMapping("So_Qna")
	public void qnalist(Model model,@RequestParam("page") int page,PageVO vo) {
		
		log.info("Controller : QnaList.......");
		String url = "So_Qna",addtag="";
		
		int nowpage=1; //현재페이지
		int maxlist=10;//페이지당 글수
		int totpage=1;//총페이지
		int totcount=0;
		if(vo.getKey() != null) {
			totcount=service.So_QnaCountSearch(vo);
		}else {
			totcount = service.So_QnaCount();//총 글 수 카운트
		}
		
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
		
		//현재페이지 시작번호
		int startpage = (nowpage-1)*maxlist+1;
		int endpage = nowpage * maxlist;
		int listcount=totcount-((nowpage-1)*maxlist);
		vo.setStartpage(startpage);
		vo.setEndpage(endpage);
		if(vo.getKey() != null) {
			
			model.addAttribute("list",service.So_QnaListSearch(vo));
		}else {
			model.addAttribute("list",service.So_QnaList(vo));
		}
		
		model.addAttribute("page",nowpage);
		model.addAttribute("listcount",listcount);
		model.addAttribute("totcount",totcount);
		model.addAttribute("totpage",totpage);
		if(vo.getKey()!=null) {
			model.addAttribute("listPage",PgIndex.pageListHan(nowpage, totpage, url, vo.getSearch(), vo.getKey()));
		}else {
			model.addAttribute("listPage",PgIndex.pageList(nowpage, totpage, url, addtag));
		}
		
	}
	
	@PostMapping("So_Qna")
	public void qnaListSearch(Model model,@RequestParam("page") int page,PageVO vo) {
		
		log.info("Controller : QnaList.......");
		String url = "So_Qna",addtag="";
		
		int nowpage=1; //현재페이지
		int maxlist=10;//페이지당 글수
		int totpage=1;//총페이지
		int totcount=0;
			totcount=service.So_QnaCountSearch(vo);
		
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
		
		//현재페이지 시작번호
		int startpage = (nowpage-1)*maxlist+1;
		int endpage = nowpage * maxlist;
		int listcount=totcount-((nowpage-1)*maxlist);
		vo.setStartpage(startpage);
		vo.setEndpage(endpage);
		
		model.addAttribute("list",service.So_QnaListSearch(vo));
		model.addAttribute("page",nowpage);
		model.addAttribute("listcount",listcount);
		model.addAttribute("totcount",totcount);
		model.addAttribute("totpage",totpage);
		model.addAttribute("listPage",PgIndex.pageListHan(nowpage, totpage, url, vo.getSearch(),vo.getKey()));
		
		
	}
	
	@GetMapping("So_QnaView")
	public void qnaView(@RequestParam("qna_bno") int qna_bno,Model model,@ModelAttribute("page") int page) {
		log.info("Controller : QnaView........");
		So_QnaVO qvo = service.So_QnaView(qna_bno);
		log.info("page : "+page);
		model.addAttribute("qvo",qvo);
		model.addAttribute("page",page);
		
	}
	
	@GetMapping("So_QnaModify")
	public void qnaModify(@RequestParam("qna_bno") int qna_bno,Model model,@ModelAttribute("page") int page) {
		log.info("Controller : QnaModify.......");
		So_QnaVO qvo = service.So_QnaView(qna_bno);
		log.info("QVO : "+qvo);
		log.info("PAGE : "+page);
		model.addAttribute("qvo",qvo);
	}
	
	@PostMapping("So_QnaModify")
	public String qnaModifyPro(So_QnaVO qvo,RedirectAttributes rttr,@ModelAttribute("page") int page) {
		log.info("Controller : QnaModifyPro...........");
		So_QnaVO qv = new So_QnaVO();
		qv = service.So_QnaView(qvo.getQna_bno());
		qvo.setMem_id(qv.getMem_id());
		log.info("qvo : "+qvo);
		int row = 0;
		row = service.So_QnaModify(qvo);
		log.info("row : "+row);
		
		rttr.addFlashAttribute("row",row);
		return "redirect:/SoQna/So_Qna?page="+page;
	}
	
	@GetMapping("So_QnaDelete")
	public String qnaDelete(@RequestParam("qna_bno") int qna_bno,RedirectAttributes rttr,@ModelAttribute("page") int page) {
		log.info("Controller : QnaDelete..........");
		int row = 0;
		row = service.So_QnaDelete(qna_bno);
		log.info("row : "+row);
		rttr.addFlashAttribute("row2",row);
		return "redirect:/SoQna/So_Qna?page="+page;
	}
	
	@ResponseBody
	@PostMapping("So_ReplyList")
	public List<So_ReplyVO> replyList(@RequestBody String qna_bno){
		log.info("ReplyList...........");
		log.info("qna_bno : "+qna_bno);
		String bno1=qna_bno;
		return rservice.So_ReplyList(Integer.parseInt(bno1.substring(8)));
	}
	
	@ResponseBody
	@PostMapping("So_ReplyInsert")
	public Map<String, Object> replyInsert(@RequestBody So_ReplyVO rvo,HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		log.info("ReplyInsert.........");
		HttpSession session = request.getSession();
		So_MemberVO mvo = (So_MemberVO)session.getAttribute("member");
		log.info("memid : "+mvo);
		rvo.setMem_id(mvo.getMem_id());
		log.info("rvo : "+rvo);
		int row = rservice.So_ReplyInsert(rvo);
		map.put("cnt", row);
		return map;
	}
	
	@PostMapping("So_ReplyModify")
	public Map<String, Object> SoReplyModify(@RequestBody So_ReplyVO rvo){
		Map<String, Object> map = new HashMap<String, Object>();
		log.info("So_replyModify.....");
		log.info("RVO : "+rvo);
		int row = rservice.So_ReplyModify(rvo);
		log.info("modirow : "+row);
		map.put("cnt", row);
		return map;
	}
	
	@ResponseBody
	@PostMapping("So_ReplyDelete")
	public Map<String, Object> Soreplydelete(@RequestBody So_ReplyVO rvo){
		Map<String, Object> map = new HashMap<String, Object>();
		log.info("So_replyDelete.........");
		log.info("delete RVO : "+rvo);
		int row = rservice.So_ReplyDelete(rvo);
		log.info("derow : "+row);
		map.put("cnt", row);
		return map;
	}
	
}
