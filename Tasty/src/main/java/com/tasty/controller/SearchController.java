package com.tasty.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/search/")
public class SearchController {
	
	@RequestMapping("mapEatery")
	public ModelAndView searchEatery(@RequestParam String keyward) {
		return new ModelAndView("/map_eatery.do","keyward",keyward);
	}
}
