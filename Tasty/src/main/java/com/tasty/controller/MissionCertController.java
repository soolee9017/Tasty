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
	public List<MissionCert> getMissionCertByMissionNum(@RequestParam int missionNum,  HttpServletRequest request) {
		/*List<MissionCert> list = service.selectMissionCertByMissionNum(missionNum);
		return list*/
		return service.selectMissionCertByMissionNum(missionNum);
		
	}
	
	
	@RequestMapping("registerMissionCert")
	@ResponseBody
	public int registerMissionCert(Principal principal,HttpServletRequest request,@ModelAttribute MissionCert missionCert) {
		return service.insertMissionCert(principal, request, missionCert);//mCFlag가 1이면 입력성공--> 미션인증글등록 성공 페이지로 가지 않고 ajax처리할 예정
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
