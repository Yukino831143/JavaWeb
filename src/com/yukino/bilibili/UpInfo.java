package com.yukino.bilibili;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class UpInfo {
	private String name;
	private String uid;
	private String sign;
	private String level;
	private String follower;
	private String following;
	private String face;
	private String certification;
	private String view;
	private String liveStatus;
	private String liveUrl;
	private Map latestAvDic;

	public UpInfo(String name, String uid, String sign, String level, String follower, String following, String face,
			String certification, String view, String liveStatus, String liveUrl, Map latestAvDic) {
		super();
		this.name = name;
		this.uid = uid;
		this.sign = sign;
		this.level = level;
		this.follower = follower;
		this.following = following;
		this.face = face;
		this.certification = certification;
		this.view = view;
		this.liveStatus = liveStatus;
		this.liveUrl = liveUrl;
		this.latestAvDic = latestAvDic;
	}
	

	public UpInfo() {
		super();
	}


	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getFollower() {
		return follower;
	}

	public void setFollower(String follower) {
		this.follower = follower;
	}

	public String getFollowing() {
		return following;
	}

	public void setFollowing(String following) {
		this.following = following;
	}

	public String getFace() {
		return face;
	}

	public void setFace(String face) {
		this.face = face;
	}

	public String getCertification() {
		return certification;
	}

	public void setCertification(String certification) {
		this.certification = certification;
	}

	public String getView() {
		return view;
	}

	public void setView(String view) {
		this.view = view;
	}

	public String getLiveStatus() {
		return liveStatus;
	}

	public void setLiveStatus(String liveStatus) {
		this.liveStatus = liveStatus;
	}

	public String getLiveUrl() {
		return liveUrl;
	}

	public void setLiveUrl(String liveUrl) {
		this.liveUrl = liveUrl;
	}

	public Map getLatestAvDic() {
		return latestAvDic;
	}

	public void setLatestAvDic(Map latestAvDic) {
		this.latestAvDic = latestAvDic;
	}
	
	@Override
	public String toString() {
		return "UpInfo [name=" + name + ", uid=" + uid + ", sign=" + sign + ", level=" + level + ", follower="
				+ follower + ", following=" + following + ", face=" + face + ", certification=" + certification
				+ ", view=" + view + ", liveStatus=" + liveStatus + ", liveUrl=" + liveUrl + ", latestAvDic="
				+ latestAvDic + "]";
	}


	public String spiderData(String keyword) {
	       	String[] args1 = new String[] { "python","E:\\private\\python\\bilibili\\searchUser.py", keyword }; 
	        Process pr;
	        String lines="";
	        try {
	            pr = Runtime.getRuntime().exec(args1); //最核心的函数
	            BufferedReader in = new BufferedReader(new InputStreamReader(pr.getInputStream(), "gbk"));
	            String line;
	            
	            while ((line = in.readLine()) != null) {
	                lines +=line;           
	            }	            
	            in.close();
	            pr.waitFor();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return lines;
		}
	
}
