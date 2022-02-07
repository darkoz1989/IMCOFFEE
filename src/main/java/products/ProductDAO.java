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

	ResultSet rs; //������ ���̽��� ���̺��� ����� ���� �޾� �ڹٿ� ������ �ִ� ��ü
    Connection con;//�����ͺ��̽��� �����Ҽ� �ֵ��� ���� 
    PreparedStatement pstmt;//������ ���̽����� ������ ��������ִ� ��ü   
    
    public static final String SAVEDIRECTORY = 
    		"C:/IT/JSP/WORKSPACE/ItGo/IMCOFFEE/src/main/webapp/resources/upload";
			//"C:/Jsp/eclipse-workspace/myapp/src/main/webapp/shop/data/";
	public static final String ENCODING = "UTF-8";
	public static final int MAXPOSTSIZE = 10*1024*1024;//10mb	
    
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
	
  	
  	// ��ǰ��ȣ�� ��ǰ���� ��ȸ
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
  	
  	
  	// userId�� ��ǰ���� ��ȸ-�ڵ�,����
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
  	
  	
  //Product Update : �̹��� ���� ���� ����.
  	public boolean updateProduct(HttpServletRequest req) {
  		boolean flag = false;
  		String sql;
  		try {
  			getcon();
  			MultipartRequest multi = new MultipartRequest(req, SAVEDIRECTORY,
  					MAXPOSTSIZE, ENCODING, new DefaultFileRenamePolicy());
  			
  			if(multi.getFilesystemName("pFilename")!=null) {//�̹����� ����
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
  				
  			}else {//�̹��� ���� �ƴ�.
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
  	
  	
  //Product Delete : ��ǰ �̹����� �������� ����.
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
  	
  	
 // ���� ��¥�� �����ϴ� �޼���
		public String nowTime() {
			SimpleDateFormat sFormat = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
			String regist_day = sFormat.format(new Date());
			return regist_day;
		}
}
