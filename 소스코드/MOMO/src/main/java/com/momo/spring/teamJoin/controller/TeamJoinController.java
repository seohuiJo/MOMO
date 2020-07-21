package com.momo.spring.teamJoin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.momo.spring.member.domain.Member;
import com.momo.spring.member.service.MemberService;
import com.momo.spring.teamJoin.domain.TeamJoin;
import com.momo.spring.teamJoin.service.TeamJoinService;

@Controller
public class TeamJoinController {

	@Autowired
	private TeamJoinService joinService;
	
	@Autowired
	private MemberService mService;

	public ArrayList<TeamJoin> selectJoinList() {
		return null;
	}

	public TeamJoin selectOne() {
		return null;
	}

	@RequestMapping("teamJoin.mo")
	public String insertJoin(TeamJoin teamJoin, Model model) {
		ArrayList<TeamJoin> teamList = joinService.selectJoinList(teamJoin);
		int result = joinService.insertJoin(teamJoin);

		if (result > 0) {
			model.addAttribute("team", teamList);
			model.addAttribute("msg","팀 가입이 완료 되었습니다.");
			return "home"; //새로고침 방법 찾아보기
		} else {
			model.addAttribute("msg", "팀에 들어갈 수 없습니다.");
			return "home";
		}
	}

	public int updateJoin() {
		return 0;

	}
	/**
	 * 탈퇴하기
	 * @param fromId
	 * @param model
	 * @return
	 */
	@RequestMapping("teamOut.mo")
	public String deleteJoin(String fromId,Model model) {
		int result = joinService.deleteJoin(fromId);
		
		if(result > 0) {
			model.addAttribute("msg","팀에서 탈퇴했습니다.");
			return "home";
		}else {
			model.addAttribute("msg","팀 탈퇴 실패");
			return "home";
		}
	}
	
	/**
	 * 팀원 정보 보기
	 * @param fromId
	 * @return
	 */
	@RequestMapping("selectJoinMember.mo")
	public ModelAndView selectJoinMember(String fromId, ModelAndView mv) {
		Member mem = mService.selectJoinMember(fromId);
		
		if(mem != null) {
			mv.addObject("member",mem);
			mv.setViewName("we/weJoinMemberProfile");
		}else {
			mv.addObject("msg","팀원 정보를 불러올 수 없습니다.");
			mv.setViewName("home");
		}
		return mv;
	}
}
