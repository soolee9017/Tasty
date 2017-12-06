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
		/*List<MissionCert> list = service.selectAllMissionCert();
		System.out.println(list);
		return list*/
		
		return service.selectAllMissionCert();
	}
	
	@RequestMapping("getMissionCertByMN")
	@ResponseBody
	public List<MissionCert> getMissionCertByMissionNum(@RequestParam int missionNum) {
		List<MissionCert> list = service.selectMissionCertByMissionNum(missionNum);
		return list;
	}
	
	
	@RequestMapping("registerMissionCert")
	public void registerMissionCert(@RequestParam String title, @RequestParam String content, 
			@RequestParam int missionNum) {
		service.insertMissionCert(new MissionCert(0,title,content,missionNum));
	}
	
	@RequestMapping("removeMissionCertByMCN")
	@ResponseBody
	public int removeMissionCertByMissionCertNum(@RequestParam int missionCertNum, HttpServletRequest request) {
		return service.deleteMissionCertByMissionCertNum(missionCertNum);
	}
	
	@RequestMapping("modifyMissionCertByMCN")
	@ResponseBody
	public int modifyMisisonCertByMissionCertNum(@RequestParam int missionCertNum, HttpServletRequest request) {
		return service.updateMissionCertByMissionCertNum(missionCertNum);
	}
	
	

		
	
	
}
