package com.tasty.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public @ResponseBody List getAllDegree(@RequestParam String taste) {
		List<Integer> degreeList = new ArrayList<>();
		degreeList.add(1);
		degreeList.add(2);
		degreeList.add(3);
		
		System.out.println(taste);
		
		List tasteList = service.selectAllTaste();
		
		System.out.println(tasteList);
		
		
		
		if(taste.equals(tasteList.get(7))) {
			List<String> errorMessage = new ArrayList<>();
			errorMessage.add("선택불가");
			System.out.println(errorMessage);
			return errorMessage;
			
		}else {
			System.out.println(degreeList);
			return degreeList;
	
		}
		
		
	}
}