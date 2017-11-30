package com.tasty.vo;

import java.io.Serializable;
import java.util.List;

public class MissionCertPhoto implements Serializable {
   private int photoNum;
   private int missionCertNum;
   
   private MissionCert missionCert;
   private List<Photo> photoList;
   private List<MissionCertPhoto> missionCertPhotoList;
}