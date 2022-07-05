package com.cuj.edge.home.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.cuj.edge.home.vo.FriendVO;
import com.cuj.edge.home.vo.Gift;

@Mapper
public interface IFriendDao {
	public List<FriendVO> getFriendList();
	public FriendVO getFriend(int friNo);
	public int increaseLove(Gift gift);
}
