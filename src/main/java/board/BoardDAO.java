package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	ResultSet rs; //������ ���̽��� ���̺��� ����� ���� �޾� �ڹٿ� ������ �ִ� ��ü
    Connection con;//�����ͺ��̽��� �����Ҽ� �ֵ��� ���� 
    PreparedStatement pstmt;//������ ���̽����� ������ ��������ִ� ��ü 
	    
    
    //Ŀ�ؼ� Ǯ�� �̿��� ������ ���̽� ����
    public void getcon(){
		
		/////////////////////////Ŀ�ؼ� Ǯ�� �̿��Ͽ� ������ ���̽��� ���� 
		try{
		   	//�ܺο��� �����͸� �о� ����� �ϱ⿡ 
			 Context initctx = new InitialContext();
			 //��Ĺ ������ ������ ��� ���� �� ���� �̵� 
			 Context envctx = (Context)initctx.lookup("java:comp/env");
			 //������ ���̽� ��ü�� ���� 
			 DataSource ds =  (DataSource)envctx.lookup("jdbc/pool");
			 //������ �ҽ��� �������� Ŀ�ؼ��� ������ �ֽÿ�
			 con =ds.getConnection();		   		
		 }catch(Exception e){
		    e.printStackTrace();
		 }
    }
    
    
    //�ϳ��� ���ο� �Խñ�(��������)�� �Ѿ�ͼ� ����Ǵ� �޼ҵ�
  	public void insertBoard(BoardDTO bdto){
  		getcon();
  		//�� Ŭ������ �Ѿ���� �ʾҴ� �����͵��� �ʱ�ȭ ���־�� �մϴ�.
  		int bref = 0;// �� �׷��� �ǹ� = ������ ������� ����ū ref ���� �������� +1�� �����ָ� �ȴ� 
  		int bre_step = 1;//�����̱⿡ = �θ� ���̱⿡
  		int bre_level = 1;
  		try {
  			//����ū ref���� �о���� ���� �غ� 
  			String refSQL = "SELECT max(bref) FROM BOARD";
  			//�������� ��ü 
  			pstmt = con.prepareStatement(refSQL);
  			//������ ������ ����� ����
  			 rs = pstmt.executeQuery();	
  			if(rs.next()){//��� ���� �ִٸ�
  				bref = rs.getInt(1)+1;//�ִ� ���� +1�� ���ؼ� �� �׷��� ����	
  			}
  			//������ �Խñ� ��ü���� ���̺� ���� 
  			String SQL = "INSERT INTO BOARD(BNUM, BTITLE, BCONTENT, BREGDATE ,USERID, BREF, BRE_STEP, BRE_LEVEL) VALUES(board_seq.NEXTVAL,?,?,sysdate,?,?,?,?)";  						
  			pstmt = con.prepareStatement(SQL);
  			//?�� ���� ����
  			pstmt.setString(1, bdto.getbTitle());
  			pstmt.setString(2, bdto.getbContent());
  			pstmt.setString(3, bdto.getUserId());  		
  			pstmt.setInt(4, bref);
  			pstmt.setInt(5, bre_step);
  			pstmt.setInt(6, bre_level);
  			//������ �����Ͻÿ�
  			pstmt.executeUpdate();	
  			//�ڿ� �ݳ�
  			con.close();
  			}catch(Exception e) {
  				e.printStackTrace();	
  			}	
  	}
  	
  	
  	public int getAllCount(){
		getcon();
		
		//�Խñ� ��ü���� �����ϴ� ���� 
		int count = 0;
		
		try {		
			//���� �غ� 
			String sql = "select count(*) from board";
			
			//���� ������ ��ü ����
			pstmt = con.prepareStatement(sql);
			
			//���� ������ ����� ���� 
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
			
			//�ڿ� �ݳ�
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
  	
  	
  //��� �Խñ�(��������)�� ������ �ִ� ���ҽ�
  	public Vector<BoardDTO> getAllBoard(int startRow, int endRow){
  		//������ ��ü ���� 
  		Vector<BoardDTO> v = new Vector<>();
  		getcon();
  		try {
  			//���� �غ� 
  			//String SQL = "select * from board order by bref desc, bre_step asc";
  			String SQL = "select * from (select A.* ,Rownum Rnum from (select *from board order by bref desc ,bre_step asc)A)"
					+ "where Rnum >= ? and Rnum <= ?";
  			
  			//�������� ��ü 
  			pstmt = con.prepareStatement(SQL);
  			pstmt.setInt(1,startRow);
  			pstmt.setInt(2,endRow);
  			
  			//������ ������ ����� ����
  			rs = pstmt.executeQuery();	
  			
  			//������ ������ ����� �𸣱⿡ �ݺ����� �̿��Ͽ� �����͸� ���� 
  			while(rs.next()){
  				 //�����͸� ��Ű¡(���� = BoardbeanŬ������ �̿�)����
  				 BoardDTO bdto = new BoardDTO();
  				 bdto.setbNum(rs.getInt(1));
  				 bdto.setbTitle(rs.getString(2));
  				 bdto.setbContent(rs.getString(3));
  				 bdto.setBregDate(rs.getDate(4));
  				 bdto.setBref(rs.getInt(5));
  				 bdto.setBre_Step(rs.getInt(6));
  				 bdto.setBre_Level(rs.getInt(7));
  				 bdto.setbReadcount(rs.getInt(8));
  				 bdto.setUserId(rs.getString(9));  				 
  				 
  				 //��Ű¡�� �����͸� ���Ϳ� ���� 
  				 v.add(bdto);
  			 }
  			
  			con.close();
  			
  			}catch(Exception e) {
  				e.printStackTrace();	
  			}	
  		
  			return v;
  	}
  	
  	
  //BoardInfo �ϳ��� �Խñ� �����ϴ� �޼ҵ�
  	public BoardDTO getOneBoard(int bnum){	
  		//���� Ÿ�� ����
  		BoardDTO bdto = new BoardDTO();
  		getcon();
  		try {
  			//��ȸ�� ���� ���� 
  			String readsql = "update board set breadcount = breadcount+1 where bnum=?";
  			pstmt = con.prepareStatement(readsql);
  			pstmt.setInt(1,bnum);
  			pstmt.executeUpdate();	
  			
  			//�����غ�
  			String SQL = "select * from board where bnum=?";
  			//�������ఴü 
  			//�������� ��ü 
  			pstmt = con.prepareStatement(SQL);
  			pstmt.setInt(1,bnum);
  			//���� ������ ����� ����
  			rs= pstmt.executeQuery();
  			
  			if(rs.next()) {
  				 bdto.setbNum(rs.getInt(1));
  				 bdto.setbTitle(rs.getString(2));
  				 bdto.setbContent(rs.getNString(3));
  				 bdto.setBregDate(rs.getDate(4));
  				 bdto.setBref(rs.getInt(5));
  				 bdto.setBre_Step(rs.getInt(6));
  				 bdto.setBre_Level(rs.getInt(7));
  				 bdto.setbReadcount(rs.getInt(8));
  				 bdto.setUserId(rs.getString(9)); 			  				
  			}  			
  			con.close();
  		}catch(Exception e) {
  			e.printStackTrace();
  			
  		}
  		return bdto;
  	}
  	
  	
  //�亯���� ����Ǵ� �޼ҵ� 
  	public void reWriteBoard(BoardDTO bdto){
  		//�θ�� �׷�� �۷��� �� ������ �о�帲 
  		int bref =bdto.getBref();
  		int bre_step = bdto.getBre_Step();
  		int bre_level = bdto.getBre_Level();
  		
  		getcon();
  		
  		try {
  			/////////////////////�ٽ� �ڵ� //////////////////////// 
  				//�θ�� ���� ū re_level�� ���� ���� 1�� ���������� 
  				String  levelsql = "update board set bre_level = bre_level+1 where bref=? and bre_level > ?";
  				//���� ���� ��ü ���� 
  				pstmt = con.prepareStatement(levelsql);
  				pstmt.setInt(1 , bref);
  				pstmt.setInt(2 , bre_level);
  				//���� ���� 
  				pstmt.executeUpdate();
  				//�亯�� �����͸� ����
  				String sql ="insert into board values(board_seq.NEXTVAL,?,?,sysdate,?,?,?,0,?)";
  				pstmt = con.prepareStatement(sql);
  				//?�� ���� ����
  				pstmt.setString(1, bdto.getbTitle());
  				pstmt.setString(2, bdto.getbContent());  				
  				pstmt.setInt(3, bref);//�θ��� ref ���� �־��� 
  				pstmt.setInt(4, bre_step+1);//����̱⿡ �θ�� re_stop�� 1�� �־��� 
  				pstmt.setInt(5, bre_level + 1);
  				pstmt.setString(6, bdto.getUserId());
  				
  				//������ �����Ͻÿ�
  				pstmt.executeUpdate();	
  				con.close();
  				
  		}catch(Exception e){
  			e.printStackTrace();
  		}
  	}
  	
  	
  //Boardupdate�� Delete�� �ϳ��� �Խñ��� ����
  	public BoardDTO getOneUpdateBoard(int bnum){	
  		//���� Ÿ�� ����
  		BoardDTO bdto = new BoardDTO();
  		getcon();
  		try {
  			//�����غ�
  			String SQL = "select * from board where bnum=?";
  			//�������ఴü 
  			//�������� ��ü 
  			pstmt = con.prepareStatement(SQL);
  			pstmt.setInt(1,bnum);
  			//���� ������ ����� ����
  			rs= pstmt.executeQuery();
  			
  			if(rs.next()) {
  				 bdto.setbNum(rs.getInt(1));
  				 bdto.setbTitle(rs.getString(2));
  				 bdto.setbContent(rs.getNString(3));
  				 bdto.setBregDate(rs.getDate(4));
  				 bdto.setBref(rs.getInt(5));
  				 bdto.setBre_Step(rs.getInt(6));
  				 bdto.setBre_Level(rs.getInt(7));
  				 bdto.setbReadcount(rs.getInt(8));
  				 bdto.setUserId(rs.getString(9));
  			}
  			
  			con.close();
  		}catch(Exception e) {
  			e.printStackTrace();
  			
  		}
  		return bdto;
  	}
  	
  	
  //�ϳ��� �Խñ��� �����ϴ� �޼ҵ�
  	public void updateBoard(BoardDTO bdto){
  		getcon();
  		
  		try {		
  			//���� �غ� 
  			String sql = "update board set btitle=? , bcontent= ? where bnum = ?";
  			
  			//���� ������ ��ü ����
  			pstmt = con.prepareStatement(sql);
  			
  			pstmt.setString(1,bdto.getbTitle());
  			pstmt.setString(2,bdto.getbContent());
  			pstmt.setInt(3,bdto.getbNum());
  				
  			//���� ������ ����� ����
  			pstmt.executeUpdate();
  			
  			//�ڿ� �ݳ�
  			con.close();
  				
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  	}
  	
  	
  //�ϳ��� �Խñ��� �����ϴ� �żҵ�
  	public void deleteBoard(int bnum) {
  		getcon();
  		
  		try {		
  			//���� �غ� 
  			String sql = "delete from board where bnum=?";
  			
  			//���� ������ ��ü ����
  			pstmt = con.prepareStatement(sql);
  			//?
  			pstmt.setInt(1,bnum);
  			
  			//���� ����
  			pstmt.executeUpdate();
  			
  			//�ڿ� �ݳ�
  			con.close();
  				
  		}catch(Exception e) {
  			e.printStackTrace();
  			
  		}
  	}

  	
  	
  	
	
}
