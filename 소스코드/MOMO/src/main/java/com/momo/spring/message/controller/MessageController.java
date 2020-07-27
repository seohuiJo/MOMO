package com.momo.spring.message.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.momo.spring.message.domain.Message;
import com.momo.spring.message.service.MessageService;

@Controller
public class MessageController {

	@Autowired
	private MessageService msgService;
	
	//받은 메시지 리스트
	@RequestMapping("msgList.mo")
	public ModelAndView messageList(ModelAndView mv, String toId) {

		ArrayList<Message> list = msgService.selectMessageList(toId);
		mv.addObject("list", list);
		mv.setViewName("message/letterList");
		return mv;
	}
	
	//보낸 메시지리스트
	@RequestMapping("msgSendList.mo")
	public ModelAndView messageSendList(ModelAndView mv, String fromId) {
		
		ArrayList<Message> list = msgService.selectSendMessageList(fromId);
		mv.addObject("list",list);
		mv.setViewName("message/letterSendList");
		return mv;
	}

	// 받은메시지 상세
	@RequestMapping("msgDetail.mo")
	public String msgDetail(Model model, int msId) {
		Message message = msgService.selectMessageOne(msId);
		if (message != null) {
			model.addAttribute("message", message);
			return "message/letterDetail";
		} else {
			model.addAttribute("msg", "쪽지 상세조회실패");
			return "message/letterList";
		}
	}

	/**
	 * Send Message View
	 * 
	 * @return
	 */
	
	//메시지작성화면
	@RequestMapping("sendMessageView.mo")
	public String messageInserView() {
		return "message/letterSend";
	}

	/**
	 * Send Message
	 * 
	 * @param message
	 * @param model
	 * @return
	 */
	
	//메시지작성
	@RequestMapping(value = "sendMessage.mo", method = RequestMethod.POST)
	public String messageInsert(Message message, Model model) {
		int result = msgService.messageInsert(message);

		if (result > 0) {
			model.addAttribute("msg", "쪽지 보내기 성공!");
			return "message/letterList";
		} else {
			model.addAttribute("msg", "쪽지 보내기 실패!");
			return "common/errorPage";
		}
	}

	/**
	 * replyMessageView
	 * 
	 * @param msId
	 * @param mv
	 * @return
	 */

	//답장
	@RequestMapping("replyMessageView.mo")
	public ModelAndView replyMessageView(int msId, ModelAndView mv) {
		Message message = msgService.selectMessageOne(msId);

		if (message != null) {
			mv.setViewName("message/letterReply");
			mv.addObject("message", message);
		} else {
			mv.setViewName("common/errorPage");
			mv.addObject("msg", "답장하기 실패");
		}
		return mv;
	}

	//답장보내기 
	@RequestMapping("replyMessage.mo")
	public ModelAndView replyMessage(ModelAndView mv, Message message) {
		int result = msgService.messageInsert(message);

		if (result > 0) {
			mv.setViewName("message/letterList");
			mv.addObject("msg", "답장 보내기 성공!");
		} else {
			mv.addObject("msg", "답장 보내기 실패");
			mv.setViewName("common/errorPage");
		}
		return mv;
	}
		
	// 보낸쪽지 상세
		@RequestMapping("msgSendDetail.mo")
		public String msgSendDetail(Model model, int msId) {
			Message message = msgService.selectMessageOne(msId);
			if (message != null) {
				model.addAttribute("message", message);
				return "message/letterSendDetail";
			} else {
				model.addAttribute("msg", "보낸쪽지 상세조회실패");
				return "message/letterList";
			}
		}


		//받은쪽지삭제
		@RequestMapping("msgDel.mo")
		public ModelAndView messagedelete(int msId, ModelAndView mv) {
					
			int result = msgService.messagedelete(msId);
			if(result > 0) {
	            mv.setViewName("message/letterList");
	            mv.addObject("msg", "메시지 삭제성공!");
				
			}else {
				mv.addObject("msg", "메시지 삭제실패!");
				mv.setViewName("common/errorPage");
			}
				
		     return mv;
		}
		
		//보낸쪽지삭제
			@RequestMapping("msgsendDel.mo")
			public ModelAndView messageSendDelete(int msId, ModelAndView mv) {
						
				int result = msgService.messagedelete(msId);
				if(result > 0) {
		            mv.setViewName("message/letterSendList");
		            mv.addObject("msg", "메시지 삭제성공!");
					
				}else {
					mv.addObject("msg", "메시지 삭제실패!");
					mv.setViewName("common/errorPage");
				}
					
			     return mv;
			}



}
