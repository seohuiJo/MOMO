package com.momo.spring.notification.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;

import com.momo.spring.notification.domain.Notification;
import com.momo.spring.notification.service.NotificationService;

public class NotificationController {
	
	@Autowired
	private NotificationService notiService;
	
	public ModelAndView selectNotiList() {
		return null;
	}
	
	
	public Notification insertNoti() {
		return null;
	}
	
	public int deleteNoti() {
		return 0;
		
	}

}
