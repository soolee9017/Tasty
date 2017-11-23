package com.tasty.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.service.MissionService;
import com.tasty.vo.Mission;
import com.tasty.vo.MissionPhoto;
import com.tasty.vo.Review;

@Controller
@RequestMapping("/mission/")
public class MissionController {
	
	@Autowired
	MissionService service;
	
	
	
	/*@RequestMapping("getMissonByMissionNum")
	public ModelAndView getMissionByMissionNum(@RequestParam int missionNum){
		List<Mission> list = service.selectMissionByMissionNum(missionNum);
		return new ModelAndView("mission_all_view.jsp","result",list);
	}*/
	
	@RequestMapping("getAllMission")
	public ModelAndView getAllMission(){
		List<Mission> list = service.selectAllMission();
		return new ModelAndView("mission_all_view.jsp","result",list);
	}
	
	
}
