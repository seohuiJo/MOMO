package com.momo.spring.qna.service;

import java.util.ArrayList;

import com.momo.spring.qna.domain.Qna;

public interface QNAService {

	public ArrayList<Qna> selectQnaList();
	
	public Qna selectOne();
	
	public Qna insertQna();
	
	public int updateQna();
	
	public int deleteQna();
}
