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
	
	
	
	@RequestMapping("getMissonByMissionNum")
	public ModelAndView registerMission(@ModelAttribute Mission mission, HttpServletRequest request){
		service.insertMission(mission);
		return new ModelAndView("mission_register_success.jsp","result",mission.getMissionNum());
	}
	
	@RequestMapping("getAllMission")
	public ModelAndView getAllMission(){
		List<Mission> list = service.selectAllMission();
		System.out.println(list);
		return new ModelAndView("/mission/mission_all_view.jsp","result",list);
	}
	
	@RequestMapping("removeMissionByMissionNum")
	public ModelAndView deleteMissionByMissionNum(@RequestParam int missionNum) {
		service.deleteMissionByMissonNum(missionNum);
		return new ModelAndView("remove_mission_success.jsp","result",missionNum);
	}
	
	@RequestMapping("updateMission")
	public ModelAndView updateMissionByMissionNum(@ModelAttribute Mission mission, HttpServletRequest request) {
		service.updateMissionByMissionNum(mission);
		return new ModelAndView("mission_update_success.jsp","mission",mission);
	}
	
	@RequestMapping("insertMission")
	public ModelAndView insertMisson(@ModelAttribute Mission mission, HttpServletRequest request) {
		service.insertMission(mission);
		return new ModelAndView("register_mission_success.jsp","mission",mission);
	}
	
	
	
	
}

