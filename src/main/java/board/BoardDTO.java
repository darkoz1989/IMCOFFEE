package board;

import java.util.Date;

public class BoardDTO {

	private int bNum;
	private String bTitle;
	private String bContent;
	private Date bregDate;
	private int bref;
	private int bre_Step;
	private int bre_Level;
	private int bReadcount;
	private String userId;
	
	public int getbNum() {
		return bNum;
	}
	public void setbNum(int bNum) {
		this.bNum = bNum;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public Date getBregDate() {
		return bregDate;
	}
	public void setBregDate(Date bregDate) {
		this.bregDate = bregDate;
	}
	public int getBref() {
		return bref;
	}
	public void setBref(int bref) {
		this.bref = bref;
	}
	public int getBre_Step() {
		return bre_Step;
	}
	public void setBre_Step(int bre_Step) {
		this.bre_Step = bre_Step;
	}
	public int getBre_Level() {
		return bre_Level;
	}
	public void setBre_Level(int bre_Level) {
		this.bre_Level = bre_Level;
	}
	public int getbReadcount() {
		return bReadcount;
	}
	public void setbReadcount(int bReadcount) {
		this.bReadcount = bReadcount;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}	
}
