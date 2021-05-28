package com.wave.withdiary.cash;

public class ChartCT {
	
	private String consumption_typename;
	private int count;

	public ChartCT(String consumption_typename, int count) {
		super();
		this.consumption_typename = consumption_typename;
		this.count = count;
	}
	public String getConsumption_typename() {
		return consumption_typename;
	}
	public void setConsumption_typename(String consumption_typename) {
		this.consumption_typename = consumption_typename;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "ChartCT [consumption_typename=" + consumption_typename + ", count=" + count + "]";
	}

}
