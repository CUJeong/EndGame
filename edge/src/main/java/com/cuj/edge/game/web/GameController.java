package com.cuj.edge.game.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GameController {
	
	@RequestMapping(value = "/game", method = RequestMethod.POST)
	public String game(Model model) {
		return "game/game";
	}
	
}
