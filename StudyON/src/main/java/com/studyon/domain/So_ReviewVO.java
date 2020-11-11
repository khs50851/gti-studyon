package com.studyon.domain;

import java.util.List;

import lombok.Data;

@Data
public class So_ReviewVO {
	private int bno;
	private String contents;
	private String regdate;
	private List<Integer> rating;
	private String mem_id;
	private int rate;
	private int page;
}
