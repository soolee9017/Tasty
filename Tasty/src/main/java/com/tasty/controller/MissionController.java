package com.tasty.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.dao.MemberDAO;
import com.tasty.dao.PhotoDAO;
import com.tasty.service.MissionCertService;
import com.tasty.service.MissionService;
import com.tasty.vo.Mission;
import com.tasty.vo.MissionMember;

@Controller
@RequestMapping("/mission/")
public class MissionController {
	
	@Autowired
	MissionService service;
	
	@Autowired
	MemberDAO memberDao;
	
	
	@Autowired
	MissionCertService mcService;
	
	
	@Autowired
	PhotoDAO photoDao;
	
	
	
	@RequestMapping("getMissonByMissionNum")
	public ModelAndView registerMission(@ModelAttribute Mission mission, HttpServletRequest request){
		return new ModelAndView("mission_register_success.jsp","result",mission.getMissionNum());
	}
	
	@RequestMapping("getAllMission")
	public ModelAndView getAllMission(/*Principal principal*/){
		/*Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member member = (Member)authentication.getPrincipal();
		List<Authority> authority = memberDao.selectAuthorityByEmail(member.getEmail());*/
		List<Mission> list = service.selectAllMissionList();
/*		if((authority.get(0).getAuthority()).equals("ROLE_ADMIN")) {
			return new ModelAndView("admin/mission_all_view.tiles","result",list); 
		}else {
*/			return new ModelAndView("mission/mission_all_view.tiles","result",list);
		
		
	}
	@RequestMapping(value="removeMissionByMissionNum", method=RequestMethod.POST)
	public ModelAndView deleteMissionByMissionNum(Principal principal, 
			HttpServletRequest request,@RequestParam String missionNum) {
		int num = Integer.parseInt(missionNum);
		service.deleteMissionByMissionNum(principal, request, num);
		return new ModelAndView("redirect:/mission/getAllMission.do");//미션 삭제후 원래 모든 미션을 보여주는 목록페이지로 돌아온다.
	}

	
	@RequestMapping(value="modifyMission", method=RequestMethod.POST)
	public ModelAndView updateMissionByMissionNum(Principal principal, 
		HttpServletRequest request,  
		@RequestParam int missionNum,
		@RequestParam String missionName,
		@RequestParam String missionContent,
		@RequestParam int currentPeople,
		@RequestParam int maxPeople,
		@RequestParam String startDate,
		@RequestParam String endDate,
		@RequestParam List<MultipartFile> upImage) throws Exception {
		
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ENGLISH);
		Date sdate = format.parse(startDate);
		Date edate = format.parse(endDate);
		service.updateMissionByMissionNum(principal, request, upImage, missionNum, missionName, missionContent, currentPeople, maxPeople, sdate, edate);
		
		return new ModelAndView("redirect:/missionCert/getMissionCertByMN.do?missionNum="+missionNum);
	}
	
	@RequestMapping("enterMissionMember")
	public ModelAndView enterMissionMember(@ModelAttribute MissionMember missionMember, HttpServletRequest request,
			@RequestParam int missionNum, ModelMap model) {
		int num = service.enterMissionMember(missionMember,missionNum);
		System.out.println(missionMember);
		model.addAttribute("outcome",num);
		return new ModelAndView("redirect:/missionCert/getMissionCertByMN.do","missionNum",missionNum);
	}
	
	@RequestMapping("cancelMissionMember")
	public ModelAndView cancelMissionMember(@ModelAttribute MissionMember missionMember, HttpServletRequest request,@RequestParam int missionNum) {
		int num = service.cancelMissionMember(missionMember, missionNum);
		System.out.println(missionMember);
		request.setAttribute("outcome", num);
		return new ModelAndView("redirect:/missionCert/getMissionCertByMN.do","missionNum",missionNum);
	}
	
	@RequestMapping("moveToRegister")
	public String moveToRegisterMission() {
		return "/mission/register_mission.tiles";
	}
	
	@RequestMapping("insertMission")
	public ModelAndView insertMission(Principal principal, @ModelAttribute Mission mission, HttpServletRequest request , @RequestParam List<MultipartFile> upImage) throws Exception {
		//service.insertMission(mission,request,upImage);
		service.insertMission(principal, mission, request, upImage);
		return new ModelAndView("/mission/register_mission_success.tiles","mission",mission);
	}
	
	@RequestMapping("selectMissionNum2")
	public ModelAndView selectMissionByMissionNum2(@RequestParam int missionNum, ModelMap model) {
		Mission mission = service.selectMissionByMissionNum(missionNum);
		return new ModelAndView("admin/modify_mission.tiles","mission",mission);
	}
	
	@RequestMapping("deleteMissionPhoto")
	public ModelAndView deleteMissionPhoto(@RequestParam int photoNumber, @RequestParam int missionNum) {
		photoDao.deleteMissionPhoto(photoNumber);
		return new ModelAndView("redirect:/missionCert/getMissionCertByMN.do?missionNum="+missionNum);
	}
	
	
	@RequestMapping("getMissionByEmail")
	public ModelAndView getMissioinByEmail(@RequestParam String email, HttpServletRequest request) {
		System.out.println("애니바디히얼?");
		int page = 1;
		  try {
			  page = Integer.parseInt(request.getParameter("page"));
		  }catch(NumberFormatException e) {}
		  Map<String, Object> map = service.selectMissionByEmail(email, page); 

		  request.setAttribute("email", email);
	   return new ModelAndView("member/my_mission_list.tiles","map",map);
		
	}
	
	


	

	
	
	
	
}

