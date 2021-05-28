package com.wave.withdiary.study;

public class StudyDTO {
	
	private int studyNO;
	private String subject;
	private String content;
	private String writer;
	private String studyTime;
	private String studyDate;
	private String memberCode;
	

	
	public StudyDTO(int studyNO, String subject, String content, String writer, String studyTime, String studyDate,
			String memberCode) {
		super();
		this.studyNO = studyNO;
		this.subject = subject;
		this.content = content;
		this.writer = writer;
		this.studyTime = studyTime;
		this.studyDate = studyDate;
		this.memberCode = memberCode;
	}



	public StudyDTO() {
		// TODO Auto-generated constructor stub
	}



	public int getStudyNO() {
		return studyNO;
	}



	public void setStudyNO(int studyNO) {
		this.studyNO = studyNO;
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



	public String getWriter() {
		return writer;
	}



	public void setWriter(String writer) {
		this.writer = writer;
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



	public String getMemberCode() {
		return memberCode;
	}



	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}



	@Override
	public String toString() {
		return "ScheduleDto [studyNO=" + studyNO + ", subject=" + subject + ", content=" + content + ", writer="
				+ writer + ", studyTime=" + studyTime + ", studyDate=" + studyDate + ", memberCode=" + memberCode + "]";
	}
	

	
	
}	