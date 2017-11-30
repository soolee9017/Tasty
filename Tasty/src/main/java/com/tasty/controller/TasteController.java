package com.tasty.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	int index = 0;
	@Autowired
	TasteService service;
	
	@RequestMapping("insertAllTaste")
	public String insertAllTaste() {
		Map map = new HashMap<>();
		map.put("tasteNum", 4);
		map.put("degreeNum",1);
		service.insertAllTaste(map);
		
		System.out.println("완성됨");
		return "review/writeReview.jsp";
	}
	
	
	@RequestMapping("getAllTaste") //리뷰페이지로 넘어감
	public ModelAndView getAllTaste() {
		List tasteList = service.selectAllTaste();
		return new ModelAndView("review/writeReview.jsp","tasteList",tasteList);
	}
	
	@RequestMapping("getAllTaste2") //회원가입페이지로 넘어감
	public ModelAndView getAllTaste2() {
		List tasteList = service.selectAllTaste();
		System.out.println("taste가지러옴");
		tasteList.remove(tasteList.size()-1);
		return new ModelAndView("member/join_member_form.tiles","tasteList", tasteList);
	}
	
	@RequestMapping("getAllTaste3") //회원수정페이지로 넘어감
	public ModelAndView getAllTaste3() {
		List tasteList = service.selectAllTaste();
		System.out.println("무슨일이야");
		tasteList.remove(tasteList.size()-1);
		return new ModelAndView("member/update_profile_form.tiles","tasteList", tasteList);
	}
	
	@RequestMapping("getAllDegree")
	public @ResponseBody List getAllDegree(@RequestParam String taste) {
		List<Integer> degreeList = new ArrayList<>();
		degreeList.add(1);
		degreeList.add(2);
		degreeList.add(3);
		
		return degreeList;
		
	}
}
