package orders;

import java.util.Date;

public class orderDTO {

	private int oNum;//주문번호
	private String oProductNo;//주문한 상품번호
	private int oQuantity;//주문수량
	private String oDate;//주문날짜
	private String oState;//주문상태(입금확인중,배송중,배송완료)
	private String oId;//주문자
	
	
	public int getoNum() {
		return oNum;
	}
	public void setoNum(int oNum) {
		this.oNum = oNum;
	}	
	public String getoProductNo() {
		return oProductNo;
	}
	public void setoProductNo(String oProductNo) {
		this.oProductNo = oProductNo;
	}
	public int getoQuantity() {
		return oQuantity;
	}
	public void setoQuantity(int oQuantity) {
		this.oQuantity = oQuantity;
	}
	public String getoDate() {
		return oDate;
	}
	public void setoDate(String oDate) {
		this.oDate = oDate;
	}
	public String getoState() {
		return oState;
	}
	public void setoState(String oState) {
		this.oState = oState;
	}
	public String getoId() {
		return oId;
	}
	public void setoId(String oId) {
		this.oId = oId;
	}
	
	
	
}
