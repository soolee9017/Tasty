package com.tasty.dao;

import java.util.List;
import java.util.Map;

public interface TasteDAO {
	List selectAllTaste();
	
	int insertAllTaste(Map map);
	
	List selectAllDegree();
	
	int deleteAtByTd(int number);
	
	List<Integer> selectTdByMn(int number);
	
	int deleteMtByMn(int number);
	
	int deleteMenuByMn(int number);
}
