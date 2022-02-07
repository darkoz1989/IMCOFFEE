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

	ResultSet rs=null;; //데이터 베이스의 테이블의 결과를 리턴 받아 자바에 저장해 주는 객체
    Connection con=null;;//데이터베이스에 접근할수 있도록 설정 
    PreparedStatement pstmt=null;//데이터 베이스에서 쿼리를 실행시켜주는 객체    
    
    //커넥션 풀을 이용한 데이터 베이스 연결
    public void getcon(){
		/////////////////////////커넥션 풀을 이용하여 데이터 베이스에 접근 		
		String url = "jdbc:mysql://localhost:3306/IMCOFFEE";
		String user = "root";
		String password = "1234";
		
		try {
		Class.forName("com.mysql.jdbc.Driver");
		con = DriverManager.getConnection(url, user, password);
		System.out.println("데이터베이스에 연결되었습니다.");
		} catch (Exception e) {
		System.out.println("데이터베이스에 연결이 되지 않았습니다.");
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
  			//접수중(1),접수(2),입금확인(3),배송준비(4),배송중(5),완료(6)
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
  				order.setoNum(rs.getInt("oNum"));//주문번호
  				order.setoId(rs.getString("oId"));//주문한 사람
  				order.setoProductNo(rs.getString("oProductNo"));//주문상품번호
  				order.setoQuantity(rs.getInt("oQuantity"));//주문수량
  				order.setoDate(rs.getString("date"));//주문날짜
  				order.setoState(rs.getString("state"));//주문상태
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
  				order.setoNum(rs.getInt("oNum"));//주문번호
  				order.setoId(rs.getString("oId"));//주문한 사람
  				order.setoProductNo(rs.getString("oProductNo"));//주문상품번호
  				order.setoQuantity(rs.getInt("oQuantity"));//주문수량
  				order.setoDate(rs.getString("oDate"));//주문날짜
  				order.setoState(rs.getString("oState"));//주문상태
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
  	
  	
  //Order All List : 모든 고객의 주문 리스트
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
  				order.setoNum(rs.getInt("oNum"));//주문번호
  				order.setoId(rs.getString("oId"));//주문한 사람
  				order.setoProductNo(rs.getString("oProductNo"));//주문상품번호
  				order.setoQuantity(rs.getInt("oQuantity"));//주문수량
  				order.setoDate(rs.getString("oDate"));//주문날짜
  				order.setoState(rs.getString("oState"));//주문상태
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
  	public orderDTO getOrderDetail(String oId/*주문번호*/) {  		
  		String sql = null;
  		orderDTO order = new orderDTO();
  		try {
  			getcon();
  			sql = "select * from pOrder where oId=?";
  			pstmt = con.prepareStatement(sql);
  			pstmt.setString(1, oId);
  			rs = pstmt.executeQuery();
  			if(rs.next()) {
  				order.setoNum(rs.getInt("oNum"));//주문번호
  				order.setoId(rs.getString("oId"));//주문한 사람
  				order.setoProductNo(rs.getString("oProductNo"));//주문상품번호
  				order.setoQuantity(rs.getInt("oQuantity"));//주문수량
  				order.setoDate(rs.getString("date"));//주문날짜
  				order.setoState(rs.getString("state"));//주문상태
  			}
  			con.close();
  			pstmt.close();
  			rs.close();
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		return order;
  	}
  	
  	
  	//Order Update(주문상태)
  	public boolean updateOrder(int oNum/*주문번호*/, String oState/*주문상태*/) {  		
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
    
  	// 현재 날짜를 제공하는 메서드
	public String nowTime() {
		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = sFormat.format(new Date());
		return regist_day;
	}
}
