package com.studyon.util;

import java.net.URLEncoder;

public class PgIndex {
	public static String pageList(int page, int totpage, String url, String addtag) {
		int idx_pre, idx_start;
		
		String s_home="";// 첫페이지로 이동
		String s_pre="";//Prev 저장변수
		String s_idx="";//번호저장변수	
		String s_next="";//Next저장변수
		String s_end="";//마지막 페이지 저장변수
		
		idx_start = ((page-1)/5)*5 + 1;  // 시작페이지 계산
		idx_pre = ((page-1)/5); //Preview 계산
		
		//Prev 표시부분
		if(idx_pre > 0) {
			s_pre = "<a href='"+url+"?page="+(idx_pre*5)+addtag+"'>"
					+ "<img src=/img/i_prev.gif width=30 height=7></a>";
		}else {
			s_pre = "<img src=/img/i_prev.gif width=30 height=7>";
		}
		//번호 표시부분
		for(int i=0; i<5; i++, idx_start++) {
			if(idx_start>totpage)
				break;
			if(idx_start == page) {
				s_idx = s_idx + " " + idx_start+ " ";
			}else{
				s_idx = s_idx + " <a href='"+url+"?page="+idx_start;
				s_idx = s_idx + addtag + "'> " + idx_start + " </a>";
			}
		}
		//Next 표시부분
		if(idx_start <= totpage) {
			s_next="<a href='"+url+"?page="+idx_start+addtag+"'>"
					+ "<img src=/img/i_next.gif width=30 height=7></a>";
		}else{
			s_next=" <img src=/img/i_next.gif width=30 height=7>";
		}
		
		String outHtml = s_home + s_pre + s_idx + s_next + s_end;
		return outHtml;
	}
	
	public static String pageListHan(int page,int totpage,String url,String search, String key) { //나중에 검색을 했을때 페이지가 어려개 나올수있잖어
		//기본적으로 뭐.... 10페이지까지 있다고할때 거기에 검색이 추가된다
		//문제점이 뭐가있냐면 내가 제목으로 한글이라고 검색을 하면 3페이지까지 나왔어 그럼 한글을 포함하는 제목이 30개라느거잖어
		//그럼 2페이지를 누를때 한글을 가지고 가야하는데 못가져감 한글이 깨져서 들어감
		int idx_pre, idx_start;
		  	
		String s_pre = "";    // Prev 저장 변수
		String s_idx = "";    // 번호 저장 변수
		String s_next = "";   // Next 저장 변수

		idx_start = ((page-1)/5)*5+1 ;  // 시작 페이지 계산
		idx_pre = ((page-1)/5);         // Priview 페이지 계산

	  	// Prev 표시 부분
	  	if(idx_pre > 0) {
	  		s_pre = "<a href='"+url+"?page="+(idx_pre*5)+"&search="+search+"&key="+URLEncoder.encode(key)+"'><img src=/img/i_prev.gif width=30 height=7></a>";
	  	} else {
	  		s_pre = "<img src=/img/i_prev.gif width=30 height=7> ";
	  	}

	  	// 번호 표시부분
	  	for(int i=0;i<5;i++,idx_start++) {
	  		if(idx_start>totpage) break;
	  		if(idx_start == page)
	  			s_idx = s_idx + " "+idx_start+" ";
	  		else {
	  			s_idx = s_idx + " <a href='" + url + "?page=" + idx_start;
	  			s_idx = s_idx + "&search="+search+"&key="+ URLEncoder.encode(key) + "'> " + idx_start + " </a> "; // 줄 그어있으면 될수있으면 쓰지않겠다는 의미 (써도 상관은 없음)
	  			//포스트 방식에선 request로 파라미터값 넘기면 한글이 안깨지는데 get방식은 무조건 한글이 깨짐 setcharacter 이거 해도 깨짐
	  		}
	  	}
		// Next 표시부분
	  	if(idx_start <= totpage ) {
	  		s_next = "<a href='"+url+"?page="+idx_start+"&search="+search+"&key="+URLEncoder.encode(key)+"'><img src=/img/i_next.gif width=30 height=7></a>";
	  	} else {
	  		s_next = " <img src=/img/i_next.gif width=30 height=7>";
	  	}

	  	String outHtml = s_pre + s_idx + s_next;  // Html 문 조합
	  	return outHtml;
	}
	
}
