package com.momo.spring.member.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.momo.spring.career.domain.Career;
import com.momo.spring.career.service.CareerService;
import com.momo.spring.me.domain.Me;
import com.momo.spring.me.service.MeService;
import com.momo.spring.member.domain.Member;
import com.momo.spring.member.service.MemberService;
import com.momo.spring.place.domain.Place;
import com.momo.spring.place.service.PlaceService;
import com.momo.spring.we.domain.We;
import com.momo.spring.we.service.WeService;

@SessionAttributes({"loginUser"})
@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@Autowired
	private CareerService cService;
	
	@Autowired
	private WeService wService;
	
	@Autowired
	private MeService meService;
	
	@Autowired
	private PlaceService pService;
	
	
	/**
	 * 멤버 전체조회
	 * @param mv
	 * @return
	 */
	 @RequestMapping("mlist.mo")
     public ModelAndView selectList(ModelAndView mv) {
		   
		   ArrayList<Member> list = mService.selectList();
		   
		   if (!list.isEmpty()) {
				mv.addObject("list", list);
				mv.setViewName("/member/memberList");
			} else {
				mv.addObject("msg", "회원조회실패");
				mv.setViewName("common/errorPage");
			}
		   return mv;
	   }
	
	/**
	 * 로그인팝업창
	 * @param mv
	 * @return
	 */
	@RequestMapping("loginPopUp.mo")
	public ModelAndView loginPopUp(ModelAndView mv) {
		mv.setViewName("member/simpleJoin");
		return mv;
	}
	
	/**
	 * 로그인
	 * @param mv
	 * @return
	 */
	@RequestMapping("signIn.mo")
	public ModelAndView signIn(ModelAndView mv) {
		mv.setViewName("member/signIn");
		return mv;
	}
	/**
	 * 로그인
	 * @param mem
	 * @param mv
	 * @return
	 */
	@RequestMapping(value="login.mo", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView memberLogin(Member mem, ModelAndView mv) {
		Member loginUser = mService.loginMember(mem);
        ArrayList<We> wList = wService.selectHighTeamList();
		ArrayList<Me> meList = meService.selectNewMe();
		ArrayList<Place> pList = pService.selectNewPlace();
		ArrayList<We> interest = wService.selectInterestTeam(loginUser.getInterest());
        
        if(loginUser !=null) {
        	mv.addObject("loginUser", loginUser);
        	mv.addObject("list", wList);
        	mv.addObject("meList", meList);
        	mv.addObject("pList",pList);
        	mv.addObject("interest",interest);
        	mv.setViewName("home");
        }else {
        	mv.addObject("msg", "로그인 실패");
        	mv.addObject("common/errorPage");
        }
		return mv;
	}
	
	/**
	 * 아이디찾기화면 
	 * 
	 * @return spring
	 */
	@RequestMapping("findIdView.mo")
	public String findIdView() {
		return "member/findId";
	}

	/**
	 * 아이디 찾기
	 * @param mv
	 * @return mv
	 */
	@RequestMapping(value="findId.mo",method=RequestMethod.POST)
	public ModelAndView findId(ModelAndView mv, String email) {
		Member member = mService.findId(email);
		if(member != null) {
			mv.addObject("member",member);
			mv.setViewName("member/idPrint");
		}else {
			mv.addObject("msg", "아이디 찾기 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	/**
	 * 비밀번호 찾기
	 * @return string
	 */
	@RequestMapping("findPwdView.mo")
	public String findPwdView() {
		return "member/findPwd";
	}
	
	/**
	 * 
	 * @param mv
	 * @param userId
	 * @param email
	 * @return
	 */
	@RequestMapping(value="findPwd.mo",method=RequestMethod.POST)
	public ModelAndView findPwd(ModelAndView mv,Member mem) {
		Member member = mService.findPwd(mem);
		
		if(member != null) {
			mv.addObject("member",member);
			mv.setViewName("member/pwdPrint");
		}else {
			mv.addObject("msg","비밀번호 찾기 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	
	@RequestMapping("logout.mo")
	public String memberLogout(SessionStatus status, Model model) {
		status.setComplete();
		
		model.addAttribute("msg","로그아웃 성공");
		model.addAttribute("url","home.mo");
		return "redirect";
		
	}

	
	
	/**
	 * 회원가입
	 * @param mv
	 * @return
	 */
	@RequestMapping("signUp.mo")
	public ModelAndView signUp(ModelAndView mv) {
		mv.setViewName("member/signUp");
		return mv;
	}
	
	/**
	 * 회원가입
	 * @param mem
	 * @param post
	 * @param address1
	 * @param address2
	 * @param uploadFile
	 * @param request
	 * @param mv
	 * @return
	 */
	@RequestMapping(value = "minsert.mo", method = RequestMethod.POST)
	public ModelAndView insertMember(Member mem, String post, String address1, String address2, Career career, String careerCheck, 
			@RequestParam(name="uploadFile", required=false)MultipartFile uploadFile, HttpServletRequest request,
			ModelAndView mv) {

		// 
		mem.setAddress(post+","+address1+","+address2);
		int result1=mService.insertMember(mem);
		int result2=1;
		
		// 
		if(result1>0) {
			// 
			if(careerCheck.equals("T")) {
				
				if (!uploadFile.getOriginalFilename().equals("")) {
					String filePath = saveFile(uploadFile, request);

					if (filePath != null) {
						career.setcFilePath(filePath);
						career.setcFileName(uploadFile.getOriginalFilename());
					}
				}

				
				result2 = mService.insertCareer(career, uploadFile, request);
			}
		}
		
		
		if(result1>0&&result2>0) {
			mv.addObject("msg","회원가입이 완료 되었습니다!");
			mv.setViewName("member/signUp");
		}else {
			mv.addObject("msg","회원가입이 실패하였습니다.");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
	}

	
	public String saveFile(MultipartFile file, HttpServletRequest request) {

		
		String root = request.getSession().getServletContext().getRealPath("resources");
		System.out.println("root: "+root);
		String savePath = root + "\\muploadFiles";

		
		File folder = new File(savePath);

		
		if (!folder.exists()) {
			folder.mkdir();
		}

		
		String filePath = folder + "\\" + file.getOriginalFilename();

		try {
			
			file.transferTo(new File(filePath));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		return filePath;
	}	

	//아이디중복체크 
	@ResponseBody
	@RequestMapping("dupid.mo")
	public String idDuplicateCheck(String userId) {
	 
		boolean isUsable =mService.checkIdDup(userId) == 0 ? true : false;
		return isUsable + "" ; 
		
		
	}
	
	//경력사항
	@RequestMapping("profile.mo")
	public ModelAndView selectProfile(Member mem, ModelAndView mv) {
		Member member = mService.selectMember(mem);
		Career career = cService.selectOne(mem);
		
		if(member != null) {
			mv.addObject("loginUser",member);
			if(career != null) {
				mv.addObject("career",career);
			}
			mv.setViewName("member/profile");
		}else {
			mv.addObject("msg","경력사항 등록 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	//경력 정보변경
	@RequestMapping("mModifyView.mo")
	public ModelAndView myInfo(Member mem,ModelAndView mv) {
		Member member = mService.selectMember(mem);
		if(member != null) {
			mv.addObject("member",member);
			mv.setViewName("member/profileModify");
		}else {
			mv.addObject("msg","경력정보 변경 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}

	/**
	 * 
	 * 회원정보 수정
	 * @param mem
	 * @param model
	 * @param post
	 * @param address1
	 * @param address2
	 * @param rd
	 * @return
	 */
	@RequestMapping(value = "mModify.mo", method=RequestMethod.POST)
	public ModelAndView memberUpdate(Member mem, Model model, String post, String address1, String address2, ModelAndView mv) {
		mem.setAddress(post + "," + address1 + "," + address2);
		int result = mService.updateMember(mem);
		
		if(result > 0) {
			mv.addObject("msg","정보수정이 완료되었습니다.");
			mv.addObject("loginUser",mem);
			mv.setViewName("home");
		}else {
			mv.addObject("msg","정보수정 실패!");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
	//회원탈퇴
	@RequestMapping("mDeleteView.mo")
	public String memberDeleteView(Member mem, Model model) {
		Member member = mService.selectMember(mem);
		
		if(member != null) {
			return "member/withdrawal";
		}else {
			model.addAttribute("msg","실패");
			return "common/errorPage";
		}
	}
	
	//�쉶�썝�깉�눜 
	@RequestMapping(value="mDelete.mo")
	public ModelAndView memberDelete(Member mem, SessionStatus status, ModelAndView mv) {
		int result = mService.deleteMember(mem);
		
		if(result > 0) {
			status.setComplete();
			mv.addObject("msg","회원탈퇴 성공");
			mv.setViewName("home");
		}else {
			mv.addObject("msg","회원탈퇴 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
	
}
