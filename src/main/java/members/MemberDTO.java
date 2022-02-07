package members;

import java.util.Date;

public class MemberDTO {

	private String userId;  
	private String userPw;
	private String userName;
	private int userPhon;
	private String userEmail;
	private String userAddr;
	private String uRegDate; //µÓ∑œ¿œ
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserPhon() {
		return userPhon;
	}
	public void setUserPhon(int userPhon) {
		this.userPhon = userPhon;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getuRegDate() {
		return uRegDate;
	}
	public void setuRegDate(String uRegDate) {
		this.uRegDate = uRegDate;
	}
	
	
}