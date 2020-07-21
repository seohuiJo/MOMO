package com.momo.spring.teamJoin.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.momo.spring.teamJoin.domain.TeamJoin;
import com.momo.spring.teamJoin.store.TeamJoinStoreLogic;

@Service("joinService")
public class TeamJoinServiceImpl implements TeamJoinService {
	
	@Autowired
	private TeamJoinStoreLogic joinStore;

	@Override
	public ArrayList<TeamJoin> selectJoinList(TeamJoin teamJoin) {
		return joinStore.selectJoinList(teamJoin);
	}

	@Override
	public TeamJoin selectOne() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertJoin(TeamJoin teamJoin) {
		return joinStore.insertJoin(teamJoin);
	}

	@Override
	public int updateJoin() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteJoin(String fromId) {
		return joinStore.deleteJoin(fromId);
	}

	@Override
	public ArrayList<TeamJoin> selectJoinList(int wId) {
		return joinStore.selectJoinList(wId);
	}

	@Override
	public int joinCount(int wId) {
		return joinStore.joinCount(wId);
	}
}
