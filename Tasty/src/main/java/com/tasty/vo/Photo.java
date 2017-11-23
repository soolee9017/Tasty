package com.tasty.vo;

import java.io.Serializable;

public class Photo implements Serializable {

	private int photoNum;
	private String photoPath;
	
	private ReviewPhoto reviewPhoto;
	
	//private MissionCertPhoto
	private MissionCertPhoto missionCertPhoto;
	
	//private MissionPhoto 해야함 
	private MissionPhoto missionPhoto;
	
}
