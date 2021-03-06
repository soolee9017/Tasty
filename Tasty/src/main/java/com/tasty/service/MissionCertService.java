package com.tasty.service;

import java.io.IOException;
import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.tasty.vo.Mission;
import com.tasty.vo.MissionCert;

public interface MissionCertService {
   
   
   List<MissionCert> selectAllMissionCert();
   
   int insertMissionCert(Principal principal, MissionCert missionCert, HttpServletRequest request, List<MultipartFile> upImage) throws IllegalStateException, IOException;
   
   List<MissionCert> selectMissionCertByMissionNum(int missionCertNum);
   
   List<MissionCert> selectMissionCertByMissionNum2(int missionCertNum);
   
   Mission selectMissionByMissionNum(int missionNum);
   
   int updateMissionCertByMissionCertNum(Principal principal, HttpServletRequest request, List<MultipartFile> upImage,
			int missionCertNum, String title, String content, int missionNum) throws Exception;
   
   int deleteMissionCertByMissionCertNum(int missionCertNum);
   
   //MissionCert selectMissionCertByMissionCertNum(int missionCertNum);
   

}