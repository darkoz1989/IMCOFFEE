package products;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class ProductDAO {

	ResultSet rs; //데이터 베이스의 테이블의 결과를 리턴 받아 자바에 저장해 주는 객체
    Connection con;//데이터베이스에 접근할수 있도록 설정 
    PreparedStatement pstmt;//데이터 베이스에서 쿼리를 실행시켜주는 객체   
    
    public static final String SAVEDIRECTORY = 
    		"C:/IT/JSP/WORKSPACE/ItGo/IMCOFFEE/src/main/webapp/resources/upload";
			//"C:/Jsp/eclipse-workspace/myapp/src/main/webapp/shop/data/";
	public static final String ENCODING = "UTF-8";
	public static final int MAXPOSTSIZE = 10*1024*1024;//10mb	
    
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
    
    
    //Product List
  	public Vector<ProductDTO> getProductList(){  		
  		String sql = null;
  		Vector<ProductDTO> vlist = new Vector<ProductDTO>();
  		try {
  			getcon();
  			sql = "select * from product order by pnum desc";
  			pstmt = con.prepareStatement(sql);
  			rs = pstmt.executeQuery();
  			while(rs.next()) {
  				ProductDTO pdto = new ProductDTO();
  				pdto.setpNum(rs.getInt(1));
  				pdto.setpCode(rs.getString(2));
  				pdto.setpName(rs.getString(3));
  				pdto.setpPrice(rs.getInt(4));
  				pdto.setpDescription(rs.getString(5));
  				pdto.setpManufacturer(rs.getString(6));
  				pdto.setpCategory(rs.getString(7));
  				pdto.setpStock(rs.getInt(8));
  				pdto.setpCondition(rs.getString(9));
  				pdto.setpFilename(rs.getString(10));
  				pdto.setpRegdate(rs.getString(11));   				
  				vlist.addElement(pdto);  				
  			}
  			con.close();
  		} catch (Exception e) {
  			e.printStackTrace();
  		} 
  		return vlist;
  	}
	
  	
  	// 제품번호로 제품정보 조회
  	public ProductDTO getProductBypCode(String pCode) {
		String sql = null;
		ProductDTO pdto = new ProductDTO();
		try {
			getcon();
			sql = "select * from product where pCode=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pCode);
			rs = pstmt.executeQuery();
			if(rs.next()) {				
				pdto.setpNum(rs.getInt(1));
  				pdto.setpCode(rs.getString(2));
  				pdto.setpName(rs.getString(3));
  				pdto.setpPrice(rs.getInt(4));
  				pdto.setpDescription(rs.getString(5));
  				pdto.setpManufacturer(rs.getString(6));
  				pdto.setpCategory(rs.getString(7));
  				pdto.setpStock(rs.getInt(8));
  				pdto.setpCondition(rs.getString(9));
  				pdto.setpFilename(rs.getString(10));
  				pdto.setpRegdate(rs.getString(11));   				
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return pdto;
	}
  	
  	
  	// userId로 제품정보 조회-코드,가격
  	public Vector<ProductDTO> getProductByuserId(String userId) {
		String sql = null;
		Vector<ProductDTO> vlist = new Vector<ProductDTO>();
		
		try {
			getcon();
			sql = "select pCode, pPrice from product where userId=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {				
				ProductDTO pdto = new ProductDTO();				
  				pdto.setpCode(rs.getString(1));  				
  				pdto.setpPrice(rs.getInt(2));  				
  				vlist.addElement(pdto);
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vlist;
	}
  	
  	
  	public boolean insertProduct(HttpServletRequest req) {
		boolean flag = false;		
		
		try {
			getcon();						
		
			MultipartRequest multi = new MultipartRequest(req, SAVEDIRECTORY,
					MAXPOSTSIZE, ENCODING, new DefaultFileRenamePolicy());			
			String sql = "insert into PRODUCT(pCode, pName, pPrice, pDescription, pManufacturer, pCategory, pStock, pCondition, pFilename, pRegDate)" 
					+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, multi.getParameter("pCode"));
			pstmt.setString(2, multi.getParameter("pName"));
			pstmt.setInt(3, Integer.parseInt(multi.getParameter("pPrice")));
			pstmt.setString(4, multi.getParameter("pDescription"));
			pstmt.setString(5, multi.getParameter("pManufacturer"));
			pstmt.setString(6, multi.getParameter("pCategory"));
			pstmt.setInt(7, Integer.parseInt(multi.getParameter("pStock")));
			pstmt.setString(8, multi.getParameter("pCondition"));
			pstmt.setString(9, multi.getFilesystemName("pFilename"));
			pstmt.setString(10, nowTime());
			
			if(pstmt.executeUpdate()==1) flag = true;
			
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
  	
  	
  //Product Update : 이미지 파일 수정 유무.
  	public boolean updateProduct(HttpServletRequest req) {
  		boolean flag = false;
  		String sql;
  		try {
  			getcon();
  			MultipartRequest multi = new MultipartRequest(req, SAVEDIRECTORY,
  					MAXPOSTSIZE, ENCODING, new DefaultFileRenamePolicy());
  			
  			if(multi.getFilesystemName("pFilename")!=null) {//이미지도 수정
  				sql = "update Product set pName=?, pDescription=?, pManufacturer=?,"
  						+ "pCategory=?, pStock=?, pPrice=?, pFilename=? where pCode=?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setString(1, multi.getParameter("pName"));
  				pstmt.setString(2, multi.getParameter("pDescription"));
  				pstmt.setString(3, multi.getParameter("pManufacturer"));
  				pstmt.setString(4, multi.getParameter("pCategory"));  				
  				pstmt.setInt(5, Integer.parseInt(multi.getParameter("pStock")));
  				pstmt.setInt(6, Integer.parseInt(multi.getParameter("pPrice")));  				
  				pstmt.setString(7, multi.getFilesystemName("pFilename"));
  				pstmt.setString(8, multi.getParameter("pCode"));
  				
  			}else {//이미지 수정 아님.
  				sql = "update Product set pName=?, pDescription=?, pManufacturer=?,"
  						+ "pCategory=?, pStock=?, pPrice=? where pCode=?";
  				pstmt = con.prepareStatement(sql);
  				pstmt.setString(1, multi.getParameter("pName"));
  				pstmt.setString(2, multi.getParameter("pDescription"));
  				pstmt.setString(3, multi.getParameter("pManufacturer"));
  				pstmt.setString(4, multi.getParameter("pCategory"));
  				pstmt.setInt(5, Integer.parseInt(multi.getParameter("pStock")));
  				pstmt.setInt(6, Integer.parseInt(multi.getParameter("pPrice")));				
  				pstmt.setString(7, multi.getParameter("pCode"));
  				  				
  			}
  			if(pstmt.executeUpdate()==1) flag = true;
  			con.close();
  		} catch (Exception e) {
  			e.printStackTrace();
  		} 
  		return flag;
  	}
  	
  	
  //Product Delete : 상품 이미지는 삭제하지 않음.
  	public boolean deleteProduct(String pCode) {  		
  		String sql = null;
  		boolean flag = false;
  		try {
  			getcon();
  			sql = "delete from Product where pCode=?";
  			pstmt = con.prepareStatement(sql);
  			pstmt.setString(1, pCode);
  			if(pstmt.executeUpdate()==1) 
  				flag = true;
  			con.close();
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
