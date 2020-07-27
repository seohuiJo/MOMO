package com.momo.spring.notification.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.momo.spring.notice.store.NoticeStoreLogic;
import com.momo.spring.notification.domain.Notification;
import com.momo.spring.notification.store.NotificationStoreLogic;

public class NotificationServiceImpl implements NotificationService {

	@Autowired
	private NotificationStoreLogic nofiStore;
	
	@Override
	public ArrayList<Notification> selectNotiList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Notification insertNoti() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int deleteNoti() {
		// TODO Auto-generated method stub
		return 0;
	}

}
