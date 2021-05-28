package com.wave.withdiary.cash;

public class ChartMoney {
	
	private String month_chdate;
	private int sum_money;

	public String getMonth_chdate() {
		return month_chdate;
	}
	public void setMonth_chdate(String month_chdate) {
		this.month_chdate = month_chdate;
	}
	public int getSum_money() {
		return sum_money;
	}
	public void setSum_money(int sum_money) {
		this.sum_money = sum_money;
	}
	@Override
	public String toString() {
		return "ChartMoney [month_chdate=" + month_chdate + ", sum_money=" + sum_money + "]";
	}

}
