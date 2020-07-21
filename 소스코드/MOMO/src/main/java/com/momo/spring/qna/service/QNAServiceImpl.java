package com.momo.spring.qna.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.momo.spring.qna.domain.Qna;
import com.momo.spring.qna.store.QNAStoreLogic;

public class QNAServiceImpl implements QNAService {

	@Autowired
	private QNAStoreLogic qnaStore;
	
	@Override
	public ArrayList<Qna> selectQnaList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Qna selectOne() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Qna insertQna() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateQna() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteQna() {
		// TODO Auto-generated method stub
		return 0;
	}

}
