package com.tasty.service.impl;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.tasty.dao.MissionCertDAO;
import com.tasty.dao.PhotoDAO;
import com.tasty.service.MissionCertService;
import com.tasty.vo.Mission;
import com.tasty.vo.MissionCert;

@Service
public class MissionCertServiceImpl implements MissionCertService {

	@Autowired
	private MissionCertDAO missionCertDao;

	@Autowired
	private PhotoDAO photoDao;

	@Override
	public List<MissionCert> selectAllMissionCert() {
		return missionCertDao.selectAllMissionCert();
	}

	@Override
	@Transactional
	public int insertMissionCert(Principal principal, MissionCert missionCert, HttpServletRequest request, List<MultipartFile> upImage)
			throws IllegalStateException, IOException {
		HttpSession session = request.getSession();

		// 로그인한 사람의 정보(닉네임을 저장할 때 필요)
		// Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		//Member member = (Member) authentication.getPrincipal();

		int a = missionCertDao.insertMissionCert(missionCert);
		System.out.println(a);
		File file = new File(request.getServletContext().getRealPath("/photos/missionCert"));

		if (!file.exists()) {
			file.mkdirs();
		}
		List<String> photoList = new ArrayList<>();
		System.out.println("이거는"+upImage);
		for (MultipartFile photo : upImage) {
			if (photo != null && !photo.isEmpty()) {
				String fileName = UUID.randomUUID().toString().replace("-", "") + photo.getOriginalFilename();

				photo.transferTo(new File(request.getServletContext().getRealPath("/photos/missionCert"), fileName));
				//FileCopyUtils.copy(new File(request.getServletContext().getRealPath("/photos/missionCert"), fileName),
					//	new File("C:\\Java\\gitRepository\\Tasty\\Tasty\\src\\main\\webapp\\photos\\missionCert",
						//		fileName));
				photoDao.insertPhoto(fileName);
				photoList.add(fileName);
				System.out.println(fileName);
				request.setAttribute("photos", photoList);
				photoDao.insertMissionCertPhoto();
			}
		}
		return 0;
	}

	@Override
	public List<MissionCert> selectMissionCertByMissionNum(int missionCertNum) {
		return missionCertDao.selectMissionCertByMissionNum(missionCertNum);
	}

	


	@Override
	public List<MissionCert> selectMissionCertByMissionNum2(int missionNum) {
		return missionCertDao.selectAllMissionCert2(missionNum);
	}

	@Override
	public Mission selectMissionByMissionNum(int missionNum) {
		return missionCertDao.selectMissionCertByMissionNum2(missionNum);
	}

	

	@Override
	public int updateMissionCertByMissionCertNum(Principal principal, HttpServletRequest request,
			List<MultipartFile> upImage, int missionCertNum, String title, String content, int missionNum)
			throws Exception {
		
		Map map = new HashMap<>();
		map.put("missionCertNum", missionCertNum);
		map.put("title", title);
		map.put("content", content);
		map.put("missionNum", missionNum);
		System.out.println("-----------");
		System.out.println(map);
		File file = new File(request.getServletContext().getRealPath("/photos/missionCert"));
		if (!file.exists()) {
			file.mkdirs();
		}
		List<String> photoList = new ArrayList<>();
		for (MultipartFile photo : upImage) {
			if (photo != null && !photo.isEmpty()) {
				String fileName = UUID.randomUUID().toString().replace("-", "") + photo.getOriginalFilename();

				photo.transferTo(new File(request.getServletContext().getRealPath("/photos/missionCert"), fileName));
				//FileCopyUtils.copy(new File(request.getServletContext().getRealPath("/photos/missionCert"), fileName),
					//	new File("C:\\Java\\gitRepository\\Tasty\\Tasty\\src\\main\\webapp\\photos\\missionCert",
						//		fileName));

				photoDao.insertPhoto(fileName);
				photoList.add(fileName);
				request.setAttribute("photos", photoList);
				photoDao.insertMissionCertPhoto(missionCertNum);
			}
		}
		missionCertDao.updateMissionCertByMissionCertNum(map);
		return 0;
	}

	@Override
	public int deleteMissionCertByMissionCertNum(int missionCertNum) {
		return missionCertDao.deleteMissionCertByMissionNum(missionCertNum);
	}

	/*@Override
	public MissionCert selectMissionCertByMissionCertNum(int missionCertNum) {
		return missionCertDao.selectMissionCertByMissionCertNum(missionCertNum);
	}*/
	
	
	

}