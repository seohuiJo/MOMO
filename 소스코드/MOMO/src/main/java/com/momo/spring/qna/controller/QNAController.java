package com.momo.spring.qna.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.momo.spring.qna.domain.Qna;
import com.momo.spring.qna.service.QNAService;

public class QNAController {
	
	@Autowired
	private QNAService qnaService;
	
	public ArrayList<Qna> selectQnaList() {
		return null;
	}
	
	public Qna selectOne() {
		return null;
	}
	
	public Qna insertQna() {
		return null;
	}
	
	public int updateQna() {
		return 0;
	}
	
	public int deleteQna() {
		return 0;
	}
	
	

}
