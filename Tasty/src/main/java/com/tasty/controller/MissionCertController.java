package com.tasty.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.service.MissionCertService;
import com.tasty.vo.MissionCert;

@Controller
@RequestMapping("/missionCert/")
public class MissionCertController {

	@Autowired
	MissionCertService service;
	
	
	
	@RequestMapping("getAllMissionCert")
	public List<MissionCert> getAllMissionCert(){
		List<MissionCert> list = service.selectAllMissionCert();
		System.out.println(list);
		return list;
	}
	
}
