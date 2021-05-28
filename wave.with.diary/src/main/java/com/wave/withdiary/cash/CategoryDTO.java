package com.wave.withdiary.cash;

public class CategoryDTO {

	private String classificationName;
	private String classificationCode;
	private String classificationRef;
	
	public String getClassificationName() {
		return classificationName;
	}
	public void setClassificationName(String classificationName) {
		this.classificationName = classificationName;
	}
	public String getClassificationCode() {
		return classificationCode;
	}
	public void setClassificationCode(String classificationCode) {
		this.classificationCode = classificationCode;
	}
	public String getClassificationRef() {
		return classificationRef;
	}
	public void setClassificationRef(String classificationRef) {
		this.classificationRef = classificationRef;
	}
	
	public CategoryDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	@Override
	public String toString() {
		return "CategoryDTO [classificationName=" + classificationName + ", classificationCode=" + classificationCode
				+ ", classificationRef=" + classificationRef + "]";
	}
	
}
