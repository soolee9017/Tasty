package com.tasty.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.service.MissionService;
import com.tasty.vo.Mission;
import com.tasty.vo.MissionMember;

@Controller
@RequestMapping("/mission/")
public class MissionController {
	
	@Autowired
	MissionService service;
	
	
	
	@RequestMapping("getMissonByMissionNum")
	public ModelAndView registerMission(@ModelAttribute Mission mission, HttpServletRequest request){
		//service.insertMission(mission);
		return new ModelAndView("mission_register_success.jsp","result",mission.getMissionNum());
	}
	
	@RequestMapping("getAllMission")
	public ModelAndView getAllMission(){
		List<Mission> list = service.selectAllMissionList();
		return new ModelAndView("mission/mission_all_view.tiles","result",list);
	}
	
	@RequestMapping("removeMissionByMissionNum")
	public ModelAndView deleteMissionByMissionNum(@RequestParam int missionNum) {
		service.deleteMissionByMissionNum(missionNum);
		return new ModelAndView("/mission/remove_mission_success.jsp","result",missionNum);
	}
	
	@RequestMapping("modifyMission")
	public ModelAndView updateMissionByMissionNum(@ModelAttribute Mission mission, HttpServletRequest request) {
		service.updateMissionByMissionNum(mission);
		return new ModelAndView("/mission/mission_update_success.jsp","mission",mission);
	}
	
	@RequestMapping("enterMissionMember")
	public ModelAndView enterMissionMember(@ModelAttribute MissionMember missionMember, HttpServletRequest request,@RequestParam int missionNum) {
		service.enterMissionMember(missionMember,missionNum);
		System.out.println(missionMember);
		return new ModelAndView("/mission/enter_mission_success.jsp");
	}
	
	
	@RequestMapping("moveToRegister")
	public String moveToRegisterMission() {
		return "/mission/register_mission.tiles";
	}
	

	@RequestMapping("insertMission")
	public ModelAndView insertMisson(Principal principal, @ModelAttribute Mission mission, HttpServletRequest request , @RequestParam List<MultipartFile> upImage) throws Exception {
		//service.insertMission(mission,request,upImage);
		service.insertMission(principal, mission, request, upImage);
		
		return new ModelAndView("/mission/register_mission_success.tiles","mission",mission);
	}
	
	

	@RequestMapping("selectMissionName")
	@ResponseBody//return 하는 값을 http응답정보에 넣어서 사용자에게 응답하기위함.
	public List<Mission> selectMissionName(@RequestParam String missionName, HttpServletRequest request){
		List<Mission> missionList = service.selectMissionByMissionName(missionName);
		return missionList;
	}
	
	
	@RequestMapping("selectMissionNum")
	public ModelAndView selectMissionByMissionNum(@RequestParam int missionNum) {
		Mission mission = service.selectMissionByMissionNum(missionNum);
		System.out.println(mission);
		return new ModelAndView("/mission/mission_detail_view.tiles","missions",mission);
	}
	
	@RequestMapping("selectMissionNum2")
	public ModelAndView selectMissionByMissionNum2(@RequestParam int missionNum) {
		Mission mission = service.selectMissionByMissionNum(missionNum);
		System.out.println(mission);
		return new ModelAndView("/mission/modify_mission.jsp","mission",mission);
	}
	
	@RequestMapping("moveToMissionAllView")
	public ModelAndView moveToMissionAllView() {
		return new ModelAndView("mission/getAllMission.do");
	}
	

	
	
	
	
}

