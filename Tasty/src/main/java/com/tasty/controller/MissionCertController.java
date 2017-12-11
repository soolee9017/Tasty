package com.tasty.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.dao.MemberDAO;
import com.tasty.dao.MissionCertDAO;
import com.tasty.dao.MissionDAO;
import com.tasty.service.MissionCertService;
import com.tasty.vo.Authority;
import com.tasty.vo.Member;
import com.tasty.vo.Mission;
import com.tasty.vo.MissionCert;
import com.tasty.vo.MissionMember;

@Controller
@RequestMapping("/missionCert/")
public class MissionCertController {

	@Autowired
	MissionCertService service;
	
	
	@Autowired
	MemberDAO memberDao;
	
	
	@Autowired
	MissionCertDAO missionCertDao;
	
	
	@Autowired
	MissionDAO missionDao;
	
	
	
	/*@RequestMapping("getAllMissionCert")
	@ResponseBody
	public List<MissionCert> getAllMissionCert(){
		List<MissionCert> list = service.selectAllMissionCert();
		System.out.println(list);
		return list
		
		return service.selectAllMissionCert();
	}*/
	
/*	@RequestMapping("getMissionCertByMN2")
	@ResponseBody
	public List<MissionCert> getMissionCertByMissionNum2(@RequestParam int missionNum) {
		List<MissionCert> list = service.selectMissionCertByMissionNum(missionNum);
		System.out.println(list);
		return list;
	}*/
	
	/*@RequestMapping("getMissionCertByMN")
	public ModelAndView selectMissionCertByMN(Principal principal, @RequestParam String missionNum) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member member = (Member)authentication.getPrincipal();
		int num = Integer.parseInt(missionNum);
		List<Authority> authority = memberDao.selectAuthorityByEmail(member.getEmail());
		List<MissionCert> missionCert = service.selectMissionCertByMissionNum(num);
		System.out.println(missionCert);
		if((authority.get(0).getAuthority()).equals("ROLE_ADMIN")) {",missionCer
			return new ModelAndView("admin/mission_detail_view.tiles","resultt); 
		}else {
			return new ModelAndView("/mission/mission_detail_view.tiles","result",missionCert);
		}
	}*/
	
	
	/*@RequestMapping("getMissionCertByMN")
	public ModelAndView selectMissionCertByMN(@RequestParam String missionNum) {
		int num = Integer.parseInt(missionNum);
		List<MissionCert> missionCert = service.selectMissionCertByMissionNum(num);
		System.out.println(missionCert);
		return new ModelAndView("mission/mission_detail_view.tiles","result",missionCert );
	}*/
	
   @RequestMapping("getMissionCertByMN")
   public ModelAndView selectMissionCertByMN(@RequestParam String missionNum, ModelMap model) {
      int num = Integer.parseInt(missionNum);
      
      Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
      Member member = (Member)authentication.getPrincipal();
      
      Mission mission = service.selectMissionByMissionNum(num);
      List<MissionCert> list = service.selectMissionCertByMissionNum2(num);
      
      List<Authority> authority = memberDao.selectAuthorityByEmail(member.getEmail());
      List<MissionCert> missionCert = service.selectMissionCertByMissionNum(num);
      MissionMember missionMember = new MissionMember();
      missionMember.setEmail(member.getEmail());
      missionMember.setMissionNum(num);
      boolean isMissionMember = missionDao.selectMissionMemberByMissionMember(missionMember);
      
      
      model.addAttribute("result", mission);
      model.addAttribute("certList",list);
      model.addAttribute("isMissionMember",isMissionMember);
    
      if((authority.get(0).getAuthority()).equals("ROLE_ADMIN")) {
			return new ModelAndView("admin/mission_detail_view.tiles","result",mission); 
		}else {
			return new ModelAndView("/mission/mission_detail_view.tiles","result",mission);
		}
   }
   
   //@RequestMapping(value="registerMissionCert", method = RequestMethod.POST)
   @RequestMapping("registerMissionCert")
   public ModelAndView registerMissionCert(Principal principal, @ModelAttribute MissionCert missionCert, HttpServletRequest request, @RequestParam List<MultipartFile> upImage,
         @RequestParam String missionNum) throws IllegalStateException, IOException {
      System.out.println("insert 하러 컨트롤러 옴.");
      System.out.println(missionCert);
      service.insertMissionCert(principal, missionCert, request, upImage);
      return new ModelAndView("redirect:/missionCert/getMissionCertByMN.do","missionNum",missionCert.getMissionNum());//redirect방식으로 다시 미션 상세보기페이지를 요청한다. ( 등록된 변경사항을 처리하기위해서.)
   }
   
   @RequestMapping("removeMissionCertByMCN")
   public ModelAndView removeMissionCertByMissionCertNum(@RequestParam int missionCertNum, HttpServletRequest request) {
      System.out.println("delete하러옴");
      service.deleteMissionCertByMissionCertNum(missionCertNum);
	  return new ModelAndView("redirect:/mission/getAllMission.do"); 
   }
   
/*   @RequestMapping("modifyMissionCertByMCN")
   public ModelAndView modifyMisisonCertByMissionCertNum(@RequestParam int missionCertNum, HttpServletRequest request) {
	   service.updateMissionCertByMissionCertNum(missionCertNum);
      return new ModelAndView
   }*/
   
   
   @RequestMapping("getMissionCertByNum")
   public ModelAndView getMissionCertByNum(@RequestParam int missionCertNum) {
	  MissionCert mc = missionCertDao.selectMissionCertByMCN(missionCertNum);
	  System.out.println(mc);
	  return new ModelAndView("mission/mission_cert_detail.tiles","missionCert",mc);
   }
   
   
   
	@RequestMapping("moveToModifyMisCert")
	public ModelAndView moveToModifyMissionCert(@RequestParam int missionCertNum, ModelMap model) {
		MissionCert mc = missionCertDao.selectMissionCertByMCN(missionCertNum);
		  System.out.println(mc);
		return new ModelAndView("/mission/modify_mission_cert.tiles","missionCert",mc);
	}
	
      
   
   
}
