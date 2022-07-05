package com.cuj.edge.home.vo;

public class Gift {
	private int friNo;
	private int giftCount;
	
	public Gift() {}
	
	public Gift(int friNo, int giftCount) {
		super();
		this.friNo = friNo;
		this.giftCount = giftCount;
	}

	@Override
	public String toString() {
		return "Gift [friNo=" + friNo + ", giftCount=" + giftCount + "]";
	}

	public int getFriNo() {
		return friNo;
	}

	public void setFriNo(int friNo) {
		this.friNo = friNo;
	}

	public int getGiftCount() {
		return giftCount;
	}

	public void setGiftCount(int giftCount) {
		this.giftCount = giftCount;
	}
	
}
