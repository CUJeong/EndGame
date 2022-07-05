package com.cuj.edge.home.vo;

public class FriendVO {
	private int friNo;
	private String friName;
	private String friImage;
	private String friThanks;
	private int friLove;
	private String friGender;
	
	public FriendVO() {}
	
	public FriendVO(int friNo, String friName, String friImage, String friThanks, int friLove, String friGender) {
		super();
		this.friNo = friNo;
		this.friName = friName;
		this.friImage = friImage;
		this.friThanks = friThanks;
		this.friLove = friLove;
		this.friGender = friGender;
	}
	
	@Override
	public String toString() {
		return "FriendVO [friNo=" + friNo + ", friName=" + friName + ", friImage=" + friImage + ", friThanks="
				+ friThanks + ", friLove=" + friLove + ", friGender=" + friGender + "]";
	}

	public int getFriNo() {
		return friNo;
	}

	public void setFriNo(int friNo) {
		this.friNo = friNo;
	}

	public String getFriName() {
		return friName;
	}

	public void setFriName(String friName) {
		this.friName = friName;
	}

	public String getFriImage() {
		return friImage;
	}

	public void setFriImage(String friImage) {
		this.friImage = friImage;
	}

	public String getFriThanks() {
		return friThanks;
	}

	public void setFriThanks(String friThanks) {
		this.friThanks = friThanks;
	}

	public int getFriLove() {
		return friLove;
	}

	public void setFriLove(int friLove) {
		this.friLove = friLove;
	}

	public String getFriGender() {
		return friGender;
	}

	public void setFriGender(String friGender) {
		this.friGender = friGender;
	}
	
}
