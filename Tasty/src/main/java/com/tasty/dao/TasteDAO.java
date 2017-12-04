package com.tasty.dao;

import java.util.List;
import java.util.Map;

public interface TasteDAO {
	List selectAllTaste();
	
	int insertAllTaste(Map map);
	
	List selectAllDegree();
}
