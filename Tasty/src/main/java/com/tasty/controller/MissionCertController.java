package com.tasty.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tasty.service.MissionCertService;
import com.tasty.vo.MissionCert;

@Controller
@RequestMapping("/missionCert/")
public class MissionCertController {

	@Autowired
	MissionCertService service;
	
	
	
	/*@RequestMapping("getAllMissionCert")
	@ResponseBody
	public List<MissionCert> getAllMissionCert(){
		List<MissionCert> list = service.selectAllMissionCert();
		System.out.println(list);
		return list
		
		return service.selectAllMissionCert();
	}*/
	
	@RequestMapping("getMissionCertByMN")
	@ResponseBody
	public List<MissionCert> getMissionCertByMissionNum(@RequestParam int missionNum) {
		List<MissionCert> list = service.selectMissionCertByMissionNum(missionNum);
		System.out.println(list);
		return list;
	}
	
	
	@RequestMapping(value="registerMissionCert")
	@ResponseBody
	public void registerMissionCert(@ModelAttribute MissionCert missionCert
			/*@RequestParam String title, @RequestParam String content, 
			@RequestParam int missionNum*/) {
		System.out.println("insert 하러 컨트롤러 옴.");
		service.insertMissionCert(missionCert);
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
