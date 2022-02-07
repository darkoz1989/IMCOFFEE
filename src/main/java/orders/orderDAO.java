package orders;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class orderDAO {

	ResultSet rs=null;; //������ ���̽��� ���̺��� ����� ���� �޾� �ڹٿ� ������ �ִ� ��ü
    Connection con=null;;//�����ͺ��̽��� �����Ҽ� �ֵ��� ���� 
    PreparedStatement pstmt=null;//������ ���̽����� ������ ��������ִ� ��ü    
    
    //Ŀ�ؼ� Ǯ�� �̿��� ������ ���̽� ����
    public void getcon(){
		/////////////////////////Ŀ�ؼ� Ǯ�� �̿��Ͽ� ������ ���̽��� ���� 		
		String url = "jdbc:mysql://localhost:3306/IMCOFFEE";
		String user = "root";
		String password = "1234";
		
		try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, user, password);
		System.out.println("�����ͺ��̽��� ����Ǿ����ϴ�.");
		} catch (Exception e) {
		System.out.println("�����ͺ��̽��� ������ ���� �ʾҽ��ϴ�.");
		e.printStackTrace();
		}
    }
    
    //Order Insert
  	public void insertOrder(orderDTO order) {  		
  		String sql = null;
  		try {
  			getcon();
  			sql = "insert pOrder(oId,oProductNo,oQuantity,oDate,oState)"
  					+ "values(?,?,?,?,?)";
  			pstmt = con.prepareStatement(sql);
  			pstmt.setString(1, order.getoId());
  			pstmt.setString(2, order.getoProductNo());
  			pstmt.setInt(3, order.getoQuantity());
  			pstmt.setString(4, nowTime());
  			//������(1),����(2),�Ա�Ȯ��(3),����غ�(4),�����(5),�Ϸ�(6)
  			pstmt.setString(5, "1");
  			pstmt.executeUpdate();
  			
  		} catch (Exception e) {
  			e.printStackTrace();
  		} finally {  			
  		}
  	}
    
    
  //Order List
  	//select * from tblOrder where id=? order by no desc
  	public Vector<orderDTO> getOrderList(int oNum){
  		String sql = null;
  		Vector<orderDTO> vlist = new Vector<orderDTO>();
  		try {
  			getcon();
  			sql = "select * from pOrder where oNum=? order by oNum desc";
  			pstmt = con.prepareStatement(sql);
  			pstmt.setInt(1, oNum);
  			rs = pstmt.executeQuery();
  			while(rs.next()) {
  				orderDTO order = new orderDTO();
  				order.setoNum(rs.getInt("oNum"));//�ֹ���ȣ
  				order.setoId(rs.getString("oId"));//�ֹ��� ���
  				order.setoProductNo(rs.getString("oProductNo"));//�ֹ���ǰ��ȣ
  				order.setoQuantity(rs.getInt("oQuantity"));//�ֹ�����
  				order.setoDate(rs.getString("date"));//�ֹ���¥
  				order.setoState(rs.getString("state"));//�ֹ�����
  				vlist.addElement(order);
  			}
  			con.close();
  			pstmt.close();
  			rs.close();
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		return vlist;
  	}
  	
  	//Order List
  	public Vector<orderDTO> getOrderList(String oId){
  		String sql = null;
  		Vector<orderDTO> vlist = new Vector<orderDTO>();
  		try {
  			getcon();
  			sql = "select * from pOrder where oid=? order by oNum desc";
  			pstmt = con.prepareStatement(sql);
  			pstmt.setString(1, oId);
  			rs = pstmt.executeQuery();
  			while(rs.next()) {
  				orderDTO order = new orderDTO();
  				order.setoNum(rs.getInt("oNum"));//�ֹ���ȣ
  				order.setoId(rs.getString("oId"));//�ֹ��� ���
  				order.setoProductNo(rs.getString("oProductNo"));//�ֹ���ǰ��ȣ
  				order.setoQuantity(rs.getInt("oQuantity"));//�ֹ�����
  				order.setoDate(rs.getString("oDate"));//�ֹ���¥
  				order.setoState(rs.getString("oState"));//�ֹ�����
  				vlist.addElement(order);
  			}
  			con.close();
  			pstmt.close();
  			rs.close();
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		return vlist;
  	}
  	
  	
  //Order All List : ��� ���� �ֹ� ����Ʈ
  	public Vector<orderDTO> getOrderList(){
  		String sql = null;
  		Vector<orderDTO> vlist = new Vector<orderDTO>();
  		try {
  			getcon();
  			sql = "select * from pOrder order by oNum desc";
  			pstmt = con.prepareStatement(sql);
  			rs = pstmt.executeQuery();
  			while(rs.next()) {
  				orderDTO order = new orderDTO();
  				order.setoNum(rs.getInt("oNum"));//�ֹ���ȣ
  				order.setoId(rs.getString("oId"));//�ֹ��� ���
  				order.setoProductNo(rs.getString("oProductNo"));//�ֹ���ǰ��ȣ
  				order.setoQuantity(rs.getInt("oQuantity"));//�ֹ�����
  				order.setoDate(rs.getString("oDate"));//�ֹ���¥
  				order.setoState(rs.getString("oState"));//�ֹ�����
  				vlist.addElement(order);
  			}
  			con.close();
  			pstmt.close();
  			rs.close();
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		return vlist;
  	}
  	
  	
  //Order Detail
  	public orderDTO getOrderDetail(String oId/*�ֹ���ȣ*/) {  		
  		String sql = null;
  		orderDTO order = new orderDTO();
  		try {
  			getcon();
  			sql = "select * from pOrder where oId=?";
  			pstmt = con.prepareStatement(sql);
  			pstmt.setString(1, oId);
  			rs = pstmt.executeQuery();
  			if(rs.next()) {
  				order.setoNum(rs.getInt("oNum"));//�ֹ���ȣ
  				order.setoId(rs.getString("oId"));//�ֹ��� ���
  				order.setoProductNo(rs.getString("oProductNo"));//�ֹ���ǰ��ȣ
  				order.setoQuantity(rs.getInt("oQuantity"));//�ֹ�����
  				order.setoDate(rs.getString("date"));//�ֹ���¥
  				order.setoState(rs.getString("state"));//�ֹ�����
  			}
  			con.close();
  			pstmt.close();
  			rs.close();
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		return order;
  	}
  	
  	
  	//Order Update(�ֹ�����)
  	public boolean updateOrder(int oNum/*�ֹ���ȣ*/, String oState/*�ֹ�����*/) {  		
  		String sql = null;
  		boolean flag = false;
  		try {
  			getcon();
  			sql = "update pOrder set oState=? where oNum=?";
  			pstmt = con.prepareStatement(sql);
  			pstmt.setString(1, oState);
  			pstmt.setInt(2, oNum);
  			if(pstmt.executeUpdate()==1) flag = true;
  			
  			con.close();
  			pstmt.close();
  			rs.close();
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		return flag;
  	}  	
  	
  	//Order Delete
  	public boolean deleteOrder(int oNum) {  		
  		String sql = null;
  		boolean flag = false;
  		try {
  			getcon();
  			sql = "delete from pOrder where oNum=?";
  			pstmt = con.prepareStatement(sql);
  			pstmt.setInt(1, oNum);
  			if(pstmt.executeUpdate()==1) flag = true;
  			
  			con.close();
  			pstmt.close();
  			rs.close();
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		return flag;
  	}	
    
  	// ���� ��¥�� �����ϴ� �޼���
	public String nowTime() {
		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = sFormat.format(new Date());
		return regist_day;
	}
}
