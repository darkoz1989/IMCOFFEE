package orders;

import java.util.Date;

public class orderDTO {

	private int oNum;//�ֹ���ȣ
	private String oProductNo;//�ֹ��� ��ǰ��ȣ
	private int oQuantity;//�ֹ�����
	private String oDate;//�ֹ���¥
	private String oState;//�ֹ�����(�Ա�Ȯ����,�����,��ۿϷ�)
	private String oId;//�ֹ���
	
	
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
