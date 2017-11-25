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
		return new ModelAndView("/content/util/map_eatery.jsp","keyward",keyward);
	}
}
