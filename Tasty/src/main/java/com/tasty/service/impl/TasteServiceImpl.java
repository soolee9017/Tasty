package com.tasty.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tasty.dao.TasteDAO;
import com.tasty.service.TasteService;

@Service
public class TasteServiceImpl implements TasteService{

	@Autowired
	private TasteDAO tasteDao;
	
	@Override
	public List selectAllTaste() {
		return tasteDao.selectAllTaste();
	}
}
