package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {

	ResultSet rs; //데이터 베이스의 테이블의 결과를 리턴 받아 자바에 저장해 주는 객체
    Connection con;//데이터베이스에 접근할수 있도록 설정 
    PreparedStatement pstmt;//데이터 베이스에서 쿼리를 실행시켜주는 객체 
	    
    
    //커넥션 풀을 이용한 데이터 베이스 연결
    public void getcon(){
		
		/////////////////////////커넥션 풀을 이용하여 데이터 베이스에 접근 
		try{
		   	//외부에서 데이터를 읽어 드려야 하기에 
			 Context initctx = new InitialContext();
			 //톰캣 서버에 정보를 담아 놓은 곳 으로 이동 
			 Context envctx = (Context)initctx.lookup("java:comp/env");
			 //데이터 베이스 객체를 선언 
			 DataSource ds =  (DataSource)envctx.lookup("jdbc/pool");
			 //데이터 소스를 기준으로 커넥션을 연결해 주시오
			 con =ds.getConnection();		   		
		 }catch(Exception e){
		    e.printStackTrace();
		 }
    }
    
    
    //하나의 새로운 게시글(공지사항)이 넘어와서 저장되는 메소드
  	public void insertBoard(BoardDTO bdto){
  		getcon();
  		//빈 클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 합니다.
  		int bref = 0;// 글 그룹을 의미 = 쿼리를 실행시켜 가장큰 ref 값을 가져온후 +1을 더해주면 된다 
  		int bre_step = 1;//새글이기에 = 부모 글이기에
  		int bre_level = 1;
  		try {
  			//가장큰 ref값을 읽어오는 쿼리 준비 
  			String refSQL = "SELECT max(bref) FROM BOARD";
  			//쿼리실행 객체 
  			pstmt = con.prepareStatement(refSQL);
  			//쿼리를 실행후 결과를 리턴
  			 rs = pstmt.executeQuery();	
  			if(rs.next()){//결과 값이 있다면
  				bref = rs.getInt(1)+1;//최대 값에 +1을 더해서 글 그룹을 설정	
  			}
  			//실제로 게시글 전체값을 테이블에 저장 
  			String SQL = "INSERT INTO BOARD(BNUM, BTITLE, BCONTENT, BREGDATE ,USERID, BREF, BRE_STEP, BRE_LEVEL) VALUES(board_seq.NEXTVAL,?,?,sysdate,?,?,?,?)";  						
  			pstmt = con.prepareStatement(SQL);
  			//?의 값을 맵핑
  			pstmt.setString(1, bdto.getbTitle());
  			pstmt.setString(2, bdto.getbContent());
  			pstmt.setString(3, bdto.getUserId());  		
  			pstmt.setInt(4, bref);
  			pstmt.setInt(5, bre_step);
  			pstmt.setInt(6, bre_level);
  			//쿼리를 실행하시오
  			pstmt.executeUpdate();	
  			//자원 반납
  			con.close();
  			}catch(Exception e) {
  				e.printStackTrace();	
  			}	
  	}
  	
  	
  	public int getAllCount(){
		getcon();
		
		//게시글 전체수를 저장하는 변수 
		int count = 0;
		
		try {		
			//쿼리 준비 
			String sql = "select count(*) from board";
			
			//쿼리 실행할 객체 선언
			pstmt = con.prepareStatement(sql);
			
			//쿼리 실행후 결과를 리턴 
			rs = pstmt.executeQuery();
			if(rs.next()){
				count = rs.getInt(1);
			}
			
			//자원 반납
			con.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}
  	
  	
  //모든 게시글(공지사항)을 리턴해 주는 리소스
  	public Vector<BoardDTO> getAllBoard(int startRow, int endRow){
  		//리턴할 객체 선언 
  		Vector<BoardDTO> v = new Vector<>();
  		getcon();
  		try {
  			//쿼리 준비 
  			//String SQL = "select * from board order by bref desc, bre_step asc";
  			String SQL = "select * from (select A.* ,Rownum Rnum from (select *from board order by bref desc ,bre_step asc)A)"
					+ "where Rnum >= ? and Rnum <= ?";
  			
  			//쿼리실행 객체 
  			pstmt = con.prepareStatement(SQL);
  			pstmt.setInt(1,startRow);
  			pstmt.setInt(2,endRow);
  			
  			//쿼리를 실행후 결과를 저장
  			rs = pstmt.executeQuery();	
  			
  			//데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터를 추출 
  			while(rs.next()){
  				 //데이터를 패키징(가방 = Boardbean클래스를 이용)해줌
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
  				 
  				 //패키징한 데이터를 벡터에 저장 
  				 v.add(bdto);
  			 }
  			
  			con.close();
  			
  			}catch(Exception e) {
  				e.printStackTrace();	
  			}	
  		
  			return v;
  	}
  	
  	
  //BoardInfo 하나의 게시글 리턴하는 메소드
  	public BoardDTO getOneBoard(int bnum){	
  		//리턴 타입 선언
  		BoardDTO bdto = new BoardDTO();
  		getcon();
  		try {
  			//조회수 증가 쿼리 
  			String readsql = "update board set breadcount = breadcount+1 where bnum=?";
  			pstmt = con.prepareStatement(readsql);
  			pstmt.setInt(1,bnum);
  			pstmt.executeUpdate();	
  			
  			//쿼리준비
  			String SQL = "select * from board where bnum=?";
  			//쿼리실행객체 
  			//쿼리실행 객체 
  			pstmt = con.prepareStatement(SQL);
  			pstmt.setInt(1,bnum);
  			//쿼리 실행후 결과를 리턴
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
  	
  	
  //답변글이 저장되는 메소드 
  	public void reWriteBoard(BoardDTO bdto){
  		//부모글 그룹과 글레벨 글 스템을 읽어드림 
  		int bref =bdto.getBref();
  		int bre_step = bdto.getBre_Step();
  		int bre_level = bdto.getBre_Level();
  		
  		getcon();
  		
  		try {
  			/////////////////////핵심 코드 //////////////////////// 
  				//부모글 보다 큰 re_level의 값을 전부 1씩 증가시켜줌 
  				String  levelsql = "update board set bre_level = bre_level+1 where bref=? and bre_level > ?";
  				//쿼리 삽입 객체 선언 
  				pstmt = con.prepareStatement(levelsql);
  				pstmt.setInt(1 , bref);
  				pstmt.setInt(2 , bre_level);
  				//쿼리 실행 
  				pstmt.executeUpdate();
  				//답변글 데이터를 저장
  				String sql ="insert into board values(board_seq.NEXTVAL,?,?,sysdate,?,?,?,0,?)";
  				pstmt = con.prepareStatement(sql);
  				//?에 값을 대입
  				pstmt.setString(1, bdto.getbTitle());
  				pstmt.setString(2, bdto.getbContent());  				
  				pstmt.setInt(3, bref);//부모의 ref 값을 넣어줌 
  				pstmt.setInt(4, bre_step+1);//답글이기에 부모글 re_stop에 1을 넣어줌 
  				pstmt.setInt(5, bre_level + 1);
  				pstmt.setString(6, bdto.getUserId());
  				
  				//쿼리를 실행하시오
  				pstmt.executeUpdate();	
  				con.close();
  				
  		}catch(Exception e){
  			e.printStackTrace();
  		}
  	}
  	
  	
  //Boardupdate용 Delete시 하나의 게시글을 리턴
  	public BoardDTO getOneUpdateBoard(int bnum){	
  		//리턴 타입 선언
  		BoardDTO bdto = new BoardDTO();
  		getcon();
  		try {
  			//쿼리준비
  			String SQL = "select * from board where bnum=?";
  			//쿼리실행객체 
  			//쿼리실행 객체 
  			pstmt = con.prepareStatement(SQL);
  			pstmt.setInt(1,bnum);
  			//쿼리 실행후 결과를 리턴
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
  	
  	
  //하나의 게시글을 수정하는 메소드
  	public void updateBoard(BoardDTO bdto){
  		getcon();
  		
  		try {		
  			//쿼리 준비 
  			String sql = "update board set btitle=? , bcontent= ? where bnum = ?";
  			
  			//쿼리 실행할 객체 선언
  			pstmt = con.prepareStatement(sql);
  			
  			pstmt.setString(1,bdto.getbTitle());
  			pstmt.setString(2,bdto.getbContent());
  			pstmt.setInt(3,bdto.getbNum());
  				
  			//쿼리 실행후 결과를 리턴
  			pstmt.executeUpdate();
  			
  			//자원 반납
  			con.close();
  				
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  	}
  	
  	
  //하나의 게시글을 삭제하는 매소드
  	public void deleteBoard(int bnum) {
  		getcon();
  		
  		try {		
  			//쿼리 준비 
  			String sql = "delete from board where bnum=?";
  			
  			//쿼리 실행할 객체 선언
  			pstmt = con.prepareStatement(sql);
  			//?
  			pstmt.setInt(1,bnum);
  			
  			//쿼리 실행
  			pstmt.executeUpdate();
  			
  			//자원 반납
  			con.close();
  				
  		}catch(Exception e) {
  			e.printStackTrace();
  			
  		}
  	}

  	
  	
  	
	
}
