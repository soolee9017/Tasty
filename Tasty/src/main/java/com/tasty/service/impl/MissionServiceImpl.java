package com.tasty.service.impl;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.tasty.dao.MissionDAO;
import com.tasty.dao.PhotoDAO;
import com.tasty.service.MissionService;
import com.tasty.util.PagingBean;
import com.tasty.vo.Member;
import com.tasty.vo.Mission;
import com.tasty.vo.MissionMember;

@Service
public class MissionServiceImpl implements MissionService {

	@Autowired
	private MissionDAO missionDao;

	@Autowired
	private PhotoDAO photoDao;

	@Override
	public List<Mission> selectAllMission() {
		return missionDao.selectAllMission();
	}

	@Override
	public int updateMissionByMissionNum(Principal principal, HttpServletRequest request, List<MultipartFile> upImage,
			int missionNum, String missionName, String missionContent, int currentPeople, int maxPeople, Date startDate,
			Date endDate) throws Exception {

		Map map = new HashMap<>();
		map.put("missionNum", missionNum);
		map.put("missionName", missionName);
		map.put("currentPeople", currentPeople);
		map.put("maxPeople", maxPeople);
		map.put("missionContent", missionContent);
		map.put("startDate", startDate);
		map.put("endDate", endDate);

		File file = new File(request.getServletContext().getRealPath("/photos/mission"));
		if (!file.exists()) {
			file.mkdirs();
		}
		List<String> photoList = new ArrayList<>();
		for (MultipartFile photo : upImage) {
			if (photo != null && !photo.isEmpty()) {
				String fileName = UUID.randomUUID().toString().replace("-", "") + photo.getOriginalFilename();

				photo.transferTo(new File(request.getServletContext().getRealPath("/photos/mission"), fileName));
				FileCopyUtils.copy(new File(request.getServletContext().getRealPath("/photos/mission"), fileName),
						new File("C:\\Java\\gitRepository\\Tasty\\Tasty\\src\\main\\webapp\\photos\\mission",
								fileName));

				photoDao.insertPhoto(fileName);
				photoList.add(fileName);
				request.setAttribute("photos", photoList);
				photoDao.insertMissionPhoto(missionNum);
			}
		}
		missionDao.updateMissionByMissionNum(map);
		return 0;
	}

	@Override
	public int deleteMissionByMissionNum(Principal principal, HttpServletRequest request,int missionNum) {
		return missionDao.deleteMissionByMissionNum(missionNum);
	}

	@Override
	@Transactional
	public int insertMission(Principal principal, Mission mission, HttpServletRequest request,
			List<MultipartFile> upImage) throws Exception {
		HttpSession session = request.getSession();

		// 로그인한 사람의 정보
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Member member = (Member) authentication.getPrincipal();

		int a = missionDao.insertMission(mission);
		System.out.println(a);
		File file = new File(request.getServletContext().getRealPath("/photos/mission"));

		if (!file.exists()) {
			file.mkdirs();
		}
		List<String> photoList = new ArrayList<>();
		System.out.println(mission);
		for (MultipartFile photo : upImage) {
			if (photo != null && !photo.isEmpty()) {
				String fileName = UUID.randomUUID().toString().replace("-", "") + photo.getOriginalFilename();

				photo.transferTo(new File(request.getServletContext().getRealPath("/photos/mission"), fileName));
				// FileCopyUtils.copy(new
				// File(request.getServletContext().getRealPath("/photos/mission"),fileName),
				// new
				// File("C:\\Java\\gitRepository\\Tasty\\Tasty\\src\\main\\webapp\\photos\\mission",fileName));

				photoDao.insertPhoto(fileName);
				photoList.add(fileName);
				request.setAttribute("photos", photoList);
				photoDao.insertMissionPhoto();
			}
		}
		return 0;
	}

	@Override
	public int enterMissionMember(MissionMember missionMember, int missionNum) {
		boolean isMissionMember = missionDao.selectMissionMemberByMissionMember(missionMember);
		if (isMissionMember == false) {
			missionDao.insertMissionMember(missionMember);
			missionDao.plusMissionCurrentPeoplePlus(missionNum);
			return 1;// 1이면 미션 참가 성공
		} else {
			System.err.println("이미 참가한 미션입니다.");
			return 0;// 0이면 미션 참가안됨
		}
	}

	@Override
	public int cancelMissionMember(MissionMember missionMember, int missionNum) {
		boolean isMissionMember = missionDao.selectMissionMemberByMissionMember(missionMember);
		System.out.println("여기봐봐" + isMissionMember);
		if (isMissionMember == true) {
			missionDao.deleteMissionMember(missionMember);
			missionDao.minusMissionCurrentPeoplePlus(missionNum);
			return 1;// 1이면 미션참여 취소 성공
		} else {
			return 0;// 0이면 미션참여취소 실패
		}
	}

	@Override
	public Mission selectMissionByMissionNum(int missionNum) {
		return missionDao.selectMissionByMissionNum(missionNum);
	}

	@Override
	public List<Mission> selectAllMissionList() {
		return missionDao.selectAllMissionList();
	}

	@Override
	public Map<String, Object> selectMissionByEmail(String email, int page) {
		HashMap<String, Object> map = new HashMap<>();
		PagingBean pb = new PagingBean(missionDao.selectCountMission(email),page);
		map.put("pageBean", pb);
		List<Mission> list = missionDao.selectMissionByEmail(email, pb.getBeginItemInPage(), pb.getBeginItemInPage());
		map.put("list",list);
		return map;
	}

	
	
	
	

}
