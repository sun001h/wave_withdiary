package com.wave.withdiary.board;

import java.util.Date;

public class BoardVO {
	
	private int d_articlenumber;
	private String title;
	private String content;
	private Date dateCreated;
	private String imgFileName;
	private String scheduleDate;
	private String map;
	private int viewcnt;
	private String membercode;
	public int getd_articlenumber() {
		return d_articlenumber;
	}
	public void setd_articlenumber(int d_articlenumber) {
		this.d_articlenumber = d_articlenumber;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	public String getImgFileName() {
		return imgFileName;
	}
	public void setImgFileName(String imgFileName) {
		this.imgFileName = imgFileName;
	}
	public String getScheduleDate() {
		return scheduleDate;
	}
	public void setScheduleDate(String scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public String getMembercode() {
		return membercode;
	}
	public void setMembercode(String membercode) {
		this.membercode = membercode;
	}
	@Override
	public String toString() {
		return "BoardVO [d_articlenumber=" + d_articlenumber + ", title=" + title + ", content=" + content
				+ ", dateCreated=" + dateCreated + ", imgFileName=" + imgFileName + ", scheduleDate=" + scheduleDate
				+ ", map=" + map + ", viewcnt=" + viewcnt + ", membercode=" + membercode + "]";
	}
	
	
	
}
