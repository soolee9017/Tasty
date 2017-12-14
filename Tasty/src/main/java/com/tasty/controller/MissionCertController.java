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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.dao.MemberDAO;
import com.tasty.dao.MissionCertDAO;
import com.tasty.dao.MissionDAO;
import com.tasty.dao.PhotoDAO;
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
	
	
	@Autowired
	PhotoDAO photoDao;
	
	
   @RequestMapping("getMissionCertByMN")
   public ModelAndView selectMissionCertByMN(@RequestParam String missionNum, ModelMap model) {
	   Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	   Member member = (Member)authentication.getPrincipal();
	   
	   int num = Integer.parseInt(missionNum);
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
      model.addAttribute("isPeopleFull", mission.getCurrentPeople() >= mission.getMaxPeople());
    
      if((authority.get(0).getAuthority()).equals("ROLE_ADMIN")) {
			return new ModelAndView("admin/mission_detail_view.tiles","result",mission); 
		}else {
			return new ModelAndView("mission/mission_detail_view.tiles","result",mission);
		}
   }
   
   //@RequestMapping(value="registerMissionCert", method = RequestMethod.POST)
   @RequestMapping("registerMissionCert")
   public ModelAndView registerMissionCert(Principal principal, @ModelAttribute MissionCert missionCert, HttpServletRequest request, @RequestParam List<MultipartFile> upImage,
         @RequestParam String missionNum) throws IllegalStateException, IOException {
      service.insertMissionCert(principal, missionCert, request, upImage);
      return new ModelAndView("redirect:/missionCert/getMissionCertByMN.do","missionNum",missionCert.getMissionNum());//redirect방식으로 다시 미션 상세보기페이지를 요청한다. ( 등록된 변경사항을 처리하기위해서.)
   }
   
   @RequestMapping("removeMissionCertByMCN")
   public ModelAndView removeMissionCertByMissionCertNum(@RequestParam int missionCertNum, HttpServletRequest request) {
      service.deleteMissionCertByMissionCertNum(missionCertNum);
	  return new ModelAndView("redirect:/mission/getAllMission.do"); 
   }
   
   @RequestMapping(value="modifyMissionCertByMCN", method=RequestMethod.POST)
   public ModelAndView modifyMisisonCertByMissionCertNum(Principal principal, 
			HttpServletRequest request,  
			@RequestParam List<MultipartFile> upImage, 
			@RequestParam int missionCertNum, 
			@RequestParam String title, 
			@RequestParam String content, 
			@RequestParam int missionNum) throws Exception {
	   service.updateMissionCertByMissionCertNum(principal, request, upImage, missionCertNum, title, content, missionNum);
      return new ModelAndView("redirect:/missionCert/moveToModifyMisCert.do?missionCertNum="+missionCertNum);
   }
   
   
   @RequestMapping("getMissionCertByNum")
   public ModelAndView getMissionCertByNum(@RequestParam int missionCertNum) {
	  MissionCert mc = missionCertDao.selectMissionCertByMCN(missionCertNum);
	  return new ModelAndView("mission/mission_cert_detail.tiles","missionCert",mc);
   }
   
   
   
	@RequestMapping("moveToModifyMisCert")
	public ModelAndView moveToModifyMissionCert(@RequestParam int missionCertNum, ModelMap model) {
		MissionCert mc = missionCertDao.selectMissionCertByMCN(missionCertNum);
		return new ModelAndView("/mission/modify_mission_cert.tiles","missionCert",mc);
	}
	
	
	@RequestMapping("deleteMissionCertPhoto")
	public ModelAndView deleteMissionPhoto(@RequestParam int photoNumber, @RequestParam int missionCertNum) {
		photoDao.deleteMissionCertPhoto(photoNumber);
		return new ModelAndView("redirect:/missionCert/moveToModifyMisCert.do?missionCertNum="+missionCertNum);
	}
	
	
      
   
   
}
