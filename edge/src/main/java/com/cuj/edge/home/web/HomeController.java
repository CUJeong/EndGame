package com.cuj.edge.home.web;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cuj.edge.home.service.FriendService;
import com.cuj.edge.home.vo.FriendVO;
import com.cuj.edge.home.vo.Gift;

@Controller
public class HomeController {
	
	@Inject
	FriendService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<FriendVO> friendList = service.getFriendList();
		
		for(FriendVO friend : friendList) {
			friend.setFriImage(friend.getFriImage().replace(".jpg", ".png"));
		}
		
		model.addAttribute("friendList", friendList);
		return "home";
	}
	
	@PostMapping(value = "/gift", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> gift(Model model, @RequestParam(required = true, name = "friNo") int friNo
			, @RequestParam(required = true, name = "giftCount") int giftCount) {
		Gift gift = new Gift(friNo, giftCount);
		int rst = service.increaseLove(gift);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(rst > 0) {
			map.put("state", "good");
		}else {
			map.put("state", "bad");
		}
		
		return map;
	}
	
	@PostMapping(value = "/friend", produces = "application/json;charset=UTF-8")
	@ResponseBody
	public Map<String, Object> friend(Model model, @RequestParam(required = true, name = "friNo") int friNo) {
		FriendVO friendVO = service.getFriend(friNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(friendVO != null) {
			map.put("friend", friendVO);
		}else {
			map.put("friend", null);
		}
		
		return map;
	}
	
}
