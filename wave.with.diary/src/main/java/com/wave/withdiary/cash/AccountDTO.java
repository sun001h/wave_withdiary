package com.wave.withdiary.cash;

public class AccountDTO {
	
	private int num;
	private String memberCode;
	private String history;
	private String chdate;
	private int money;
	private String classificationCode;
	private String memo;
	private String consumption_typecode;
	
	private CategoryDTO dto;
	private CategoryCtDTO ctdto;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
	}
	public String getChdate() {
		return chdate;
	}
	public void setChdate(String chdate) {
		this.chdate = chdate;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public String getClassificationCode() {
		return classificationCode;
	}
	public void setClassificationCode(String classificationCode) {
		this.classificationCode = classificationCode;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getConsumption_typecode() {
		return consumption_typecode;
	}
	public void setConsumption_typecode(String consumption_typecode) {
		this.consumption_typecode = consumption_typecode;
	}
	
	public CategoryDTO getDto() {
		return dto;
	}
	public void setDto(CategoryDTO dto) {
		this.dto = dto;
	}
	public CategoryCtDTO getCtdto() {
		return ctdto;
	}
	public void setCtdto(CategoryCtDTO ctdto) {
		this.ctdto = ctdto;
	}
	
	public AccountDTO(CategoryDTO dto) {
		super();
		this.dto = dto;
	}
	
	public AccountDTO(CategoryCtDTO ctdto) {
		super();
		this.ctdto = ctdto;
	}
	public AccountDTO() {
		// TODO Auto-generated constructor stub
	}
	
	
	public AccountDTO(int num, String memberCode, String history, String chdate, int money, String classificationCode,
			String memo, String consumption_typecode) {
		super();
		this.num = num;
		this.memberCode = memberCode;
		this.history = history;
		this.chdate = chdate;
		this.money = money;
		this.classificationCode = classificationCode;
		this.memo = memo;
		this.consumption_typecode = consumption_typecode;
	}
	
	@Override
	public String toString() {
		return "AccountDTO [num=" + num + ", memberCode=" + memberCode + ", history=" + history + ", chdate=" + chdate
				+ ", money=" + money + ", classificationCode=" + classificationCode + ", memo=" + memo
				+ ", consumption_typecode=" + consumption_typecode + "]";
	}

}
