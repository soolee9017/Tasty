package com.tasty.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.service.MissionCertService;
import com.tasty.vo.MissionCert;

@Controller
@RequestMapping("/missionCert/")
public class MissionCertController {

	@Autowired
	MissionCertService service;
	
	
	
	@RequestMapping("getAllMissionCert")
	@ResponseBody
	public List<MissionCert> getAllMissionCert(){
		List<MissionCert> list = service.selectAllMissionCert();
		System.out.println(list);
		return list;
	}
	
	@RequestMapping("getMissionCertByMN")
	@ResponseBody
	public List<MissionCert> getMissionCertByMissionNum(@RequestParam int missionNum,  HttpServletRequest request) {
		List<MissionCert> list = service.selectMissionCertByMissionNum(missionNum);
		return list;
		
	}
	
	
	@RequestMapping("registerMissionCert")
	public int registerMissionCert(@ModelAttribute MissionCert missionCert, HttpServletRequest request) {
		int mCFlag = service.insertMissionCert(missionCert);
		return mCFlag;
	}
	
	

		
	
	
}
