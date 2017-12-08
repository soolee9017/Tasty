package com.tasty.controller;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tasty.dao.MissionCertDAO;
import com.tasty.service.MissionCertService;
import com.tasty.vo.Mission;
import com.tasty.vo.MissionCert;

@Controller
@RequestMapping("/missionCert/")
public class MissionCertController {

   @Autowired
   MissionCertService service;
   
   @Autowired
   MissionCertDAO dao;
   
   /*@RequestMapping("getAllMissionCert")
   @ResponseBody
   public List<MissionCert> getAllMissionCert(){
      List<MissionCert> list = service.selectAllMissionCert();
      System.out.println(list);
      return list
      
      return service.selectAllMissionCert();
   }*/
   
/*   @RequestMapping("getMissionCertByMN2")
   @ResponseBody
   public List<MissionCert> getMissionCertByMissionNum2(@RequestParam int missionNum) {
      List<MissionCert> list = service.selectMissionCertByMissionNum(missionNum);
      System.out.println(list);
      return list;
   }*/
   
   @RequestMapping("getMissionCertByMN")
   public ModelAndView selectMissionCertByMN(@RequestParam String missionNum, ModelMap model) {
      int num = Integer.parseInt(missionNum);
      
      Mission mission = service.selectMissionByMissionNum(num);
      List<MissionCert> list = service.selectMissionCertByMissionNum2(num);
      
      model.addAttribute("result", mission);
      model.addAttribute("certList",list);
//      List<MissionCert> missionCert = service.selectMissionCertByMissionNum(num);
    
      return new ModelAndView("mission/mission_detail_view.tiles");
   }
   
   
   
   
   @RequestMapping(value="registerMissionCert", method = RequestMethod.POST)
   public ModelAndView registerMissionCert(Principal principal, @ModelAttribute MissionCert missionCert, HttpServletRequest request, @RequestParam List<MultipartFile> upImage,
         @RequestParam String missionNum) throws IllegalStateException, IOException {
      System.out.println("insert 하러 컨트롤러 옴.");
      System.out.println(missionCert);
      service.insertMissionCert(principal, missionCert, request, upImage);
      return new ModelAndView("redirect:/missionCert/getMissionCertByMN.do","missionNum",missionCert.getMissionNum());//redirect방식으로 다시 미션 상세보기페이지를 요청한다. ( 등록된 변경사항을 처리하기위해서.)
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
   
   
   @RequestMapping("getMissionCertByNum")
   public ModelAndView getMissionCertByNum(@RequestParam int missionCertNum) {
	  MissionCert mc = dao.selectMissionCertByMCN(missionCertNum);
	  System.out.println(mc);
	  return new ModelAndView("mission/mission_cert_detail.tiles","missionCert",mc);
   }
      
   
   
}