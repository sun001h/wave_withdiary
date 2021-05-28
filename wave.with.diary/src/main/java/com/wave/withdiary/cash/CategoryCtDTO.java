package com.wave.withdiary.cash;

public class CategoryCtDTO {
	
	private String consumption_typename;
	private String consumption_typecode;
	private String consumption_typeref;
	
	public String getConsumption_typename() {
		return consumption_typename;
	}
	public void setConsumption_typename(String consumption_typename) {
		this.consumption_typename = consumption_typename;
	}
	public String getConsumption_typecode() {
		return consumption_typecode;
	}
	public void setConsumption_typecode(String consumption_typecode) {
		this.consumption_typecode = consumption_typecode;
	}
	public String getConsumption_typeref() {
		return consumption_typeref;
	}
	public void setConsumption_typeref(String consumption_typeref) {
		this.consumption_typeref = consumption_typeref;
	}
	
	@Override
	public String toString() {
		return "CategoryCtDTO [consumption_typename=" + consumption_typename + ", consumption_typecode="
				+ consumption_typecode + ", consumption_typeref=" + consumption_typeref + "]";
	}
	

}
