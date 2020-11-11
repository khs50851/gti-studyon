package com.studyon.domain;

import lombok.Data;

@Data
public class PageVO {
	//검색용
	private String search;
	private String key;
	
	//페이지 처리용
	private int startpage;
	private int endpage;
	
	
}
