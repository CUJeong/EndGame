package com.cuj.edge.home.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.cuj.edge.home.dao.IFriendDao;
import com.cuj.edge.home.vo.FriendVO;
import com.cuj.edge.home.vo.Gift;

@Service
public class FriendService {
	
	@Inject
	IFriendDao dao;
	
	public List<FriendVO> getFriendList(){
		return dao.getFriendList();
	}
	
	public FriendVO getFriend(int friNo) {
		return dao.getFriend(friNo);
	}
	
	public int increaseLove(Gift gift) {
		return dao.increaseLove(gift);
	}
	
}
