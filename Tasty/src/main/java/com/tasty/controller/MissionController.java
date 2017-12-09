package com.tasty.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.dao.MemberDAO;
import com.tasty.service.MissionCertService;
import com.tasty.service.MissionService;
import com.tasty.vo.Authority;
import com.tasty.vo.Member;
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
	
	
	
	@RequestMapping("getMissonByMissionNum")
	public ModelAndView registerMission(@ModelAttribute Mission mission, HttpServletRequest request){
		//service.insertMission(mission);
		return new ModelAndView("mission_register_success.jsp","result",mission.getMissionNum());
	}
	
	@RequestMapping("getAllMission")
	public ModelAndView getAllMission(Principal principal){
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member member = (Member)authentication.getPrincipal();
		List<Authority> authority = memberDao.selectAuthorityByEmail(member.getEmail());
		List<Mission> list = service.selectAllMissionList();
		if((authority.get(0).getAuthority()).equals("ROLE_ADMIN")) {
			return new ModelAndView("admin/mission_all_view.tiles","result",list); 
		}else {
			return new ModelAndView("mission/mission_all_view.tiles","result",list);
		}
		
	}
	
	@RequestMapping("removeMissionByMissionNum")
	public ModelAndView deleteMissionByMissionNum(@RequestParam int missionNum) {
		service.deleteMissionByMissionNum(missionNum);
		return new ModelAndView("redirect:/mission/getAllMission.do");//미션 삭제후 원래 모든 미션을 보여주는 목록페이지로 돌아온다.
	}
	
	@RequestMapping("modifyMission")
	public ModelAndView updateMissionByMissionNum(@ModelAttribute Mission mission, HttpServletRequest request) {
		service.updateMissionByMissionNum(mission);
		return new ModelAndView("redirect:/mission/getAllMission.do");
	}
	
	@RequestMapping("enterMissionMember")
	public ModelAndView enterMissionMember(@ModelAttribute MissionMember missionMember, HttpServletRequest request,
			@RequestParam int missionNum, ModelMap model) {
		int num = service.enterMissionMember(missionMember,missionNum);
		System.out.println(missionMember);
		System.out.println("참여결과"+num);
		
		model.addAttribute("outcome",num);
		//0이면 실패, 1이면 성공 --> alert창으로 뿌려주기(이미 참여한 미션입니다~~)
		return new ModelAndView("redirect:/missionCert/getMissionCertByMN.do","missionNum",missionNum);
	}
	
	@RequestMapping("cancelMissionMember")
	public ModelAndView cancelMissionMember(@ModelAttribute MissionMember missionMember, HttpServletRequest request,@RequestParam int missionNum) {
		int num = service.cancelMissionMember(missionMember, missionNum);
		System.out.println(missionMember);
		System.out.println("취소결과 : "+num);
		request.setAttribute("outcome", num);
		return new ModelAndView("redirect:/missionCert/getMissionCertByMN.do","missionNum",missionNum);
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
	
	
	
	
	
	/*@RequestMapping("selectMissionNum")
	public ModelAndView selectMissionByMissionNum(@RequestParam int missionNum) {
		Mission mission = service.selectMissionByMissionNum(missionNum);
		System.out.println(mission);
		return new ModelAndView("/mission/mission_detail_view.tiles","missions",mission);
	}*/
	
	@RequestMapping("selectMissionNum2")
	public ModelAndView selectMissionByMissionNum2(@RequestParam int missionNum, ModelMap model) {
		Mission mission = service.selectMissionByMissionNum(missionNum);
		System.out.println(mission);
		return new ModelAndView("admin/modify_mission.tiles","mission",mission);
	}
	

	

	
	
	
	
}

