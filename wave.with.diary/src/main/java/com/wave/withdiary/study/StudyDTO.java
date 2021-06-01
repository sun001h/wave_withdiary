package com.wave.withdiary.study;

public class StudyDTO {
	
	private int studyNO;
	private String memberCode;
	private String subject;
	private String content;
	private String studyTime;
	private String studyDate;
	public int getStudyNO() {
		return studyNO;
	}
	public void setStudyNO(int studyNO) {
		this.studyNO = studyNO;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getStudyTime() {
		return studyTime;
	}
	public void setStudyTime(String studyTime) {
		this.studyTime = studyTime;
	}
	public String getStudyDate() {
		return studyDate;
	}
	public void setStudyDate(String studyDate) {
		this.studyDate = studyDate;
	}
	@Override
	public String toString() {
		return "StudyDTO [studyNO=" + studyNO + ", memberCode=" + memberCode + ", subject=" + subject + ", content="
				+ content + ", studyTime=" + studyTime + ", studyDate=" + studyDate + "]";
	}
	
}