package com.tasty.dao;

import java.util.List;
import java.util.Map;

import com.tasty.vo.Mission;
import com.tasty.vo.MissionCert;

public interface MissionCertDAO {
   
   int insertMissionCert(MissionCert missionCert);
   
   List<MissionCert> selectAllMissionCert();
   
   List<MissionCert> selectAllMissionCert2(int missionNum);
   
   List<MissionCert> selectMissionCertByMissionNum(int missionNum);
   
   Mission selectMissionCertByMissionNum2(int missionNum);
   
   int updateMissionCertByMissionCertNum(Map map);
   
   int deleteMissionCertByMissionNum(int missionCertNum);
   
   MissionCert selectMissionCertByMCN(int number);
   
}
