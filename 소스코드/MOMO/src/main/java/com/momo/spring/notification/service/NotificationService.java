package com.momo.spring.notification.service;

import java.util.ArrayList;

import com.momo.spring.notification.domain.Notification;

public interface NotificationService {

	public abstract ArrayList<Notification> selectNotiList();
	
	public Notification insertNoti();
	
	public int deleteNoti();
}
