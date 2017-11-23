package com.tasty.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.service.TasteService;

@Controller
@RequestMapping("/review/")
public class TasteController {

	@Autowired
	TasteService service;
	

	@RequestMapping("getAllTaste")
	public ModelAndView getAllTaste() {
		List tasteList = service.selectAllTaste();
		return new ModelAndView("review/writeReview.jsp","tasteList",tasteList);
	}
	
	@RequestMapping("getAllDegree")
	public ModelAndView getAllDegree(@RequestParam String taste) {
		List<Integer> degreeList = new ArrayList<>();
		degreeList.add(1);
		degreeList.add(2);
		degreeList.add(3);
		
		List<String> tasteList = service.selectAllTaste();
		if(taste.equals(tasteList.get(7))) {
			List<String> errorMessage = new ArrayList<>();
			errorMessage.add("선택불가");
			System.out.println(errorMessage);
			return new ModelAndView("review/writeReview.jsp","degreeList",errorMessage);
		}else {
			System.out.println(degreeList);
			return new ModelAndView("review/writeReview.jsp","degreeList", degreeList);
	
		}
		
		
	}
}
