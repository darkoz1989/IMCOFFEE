package members;

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

	public class MemberDAO {
	ResultSet rs; //데이터 베이스의 테이블의 결과를 리턴 받아 자바에 저장해 주는 객체
    Connection con;//데이터베이스에 접근할수 있도록 설정 
    PreparedStatement pstmt;//데이터 베이스에서 쿼리를 실행시켜주는 객체 
	    
    
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
            
  //데이터 베이스에 한사람의 회원 정보를 저장해주는 매소드
  	public void insertMember(MemberDTO mbean){
  		try {
  		getcon();
  		String SQL = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?)";
  		//쿼리를 사용하도록 설정 
  			pstmt = con.prepareStatement(SQL);
  			//?에 맞게 데이터를 맵핑
  			pstmt.setString(1,mbean.getUserId());
  			pstmt.setString(2,mbean.getUserPw());
  			pstmt.setString(3,mbean.getUserName());
  			pstmt.setInt(4,mbean.getUserPhon());
  			pstmt.setString(5,mbean.getUserEmail());
  			pstmt.setString(6,mbean.getUserAddr());
  			pstmt.setString(7,nowTime());
  			
  			//4.오라클에서 퀴리를 실행 하시오 
  			pstmt.executeUpdate();//insert,update,delete 시 사용하는 메소드 
  			//5.자원 반납 
  			con.close();
  		}catch(Exception e) {
  			e.printStackTrace();
  		}
  	}
  	
  	
  	
  	//id 중복확인 : 중복일때 true 리턴
  	public boolean idCheck(String userId) {  		
  		String sql = null;
  		boolean flag = false;
  		try {
  			getcon();
  			sql = "select userId from member where userId=?";
  			pstmt = con.prepareStatement(sql);
  			pstmt.setString(1, userId);
  			rs = pstmt.executeQuery();
  			flag = rs.next();//조건에 맞는 id가 있다면 true리턴.
  			con.close();
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		return flag;
  	}
  	
  	
  	
  	 //로그인 : 성공 - true, 실패 - false
  	public boolean loginMember(String id, String pwd) {
  		
  		boolean flag = false;
  		String sql;
  		
  		try {
  			getcon();  			
  			sql = "select count(userId) from MEMBER where userId=? and userPw=?";
  			pstmt = con.prepareStatement(sql);
  			pstmt.setString(1, id);
  			pstmt.setString(2, pwd);
  			rs = pstmt.executeQuery();
  			if(rs.next()&&rs.getInt(1)==1) 
  				flag = true; 
  			con.close();
  		} catch (Exception e) {
  			e.printStackTrace();
  		}
  		return flag;
  	}
  	
  	
  	
  //모든 회원의 정보를 리턴해 주는 매소드 호출 
  	public Vector<MemberDTO> allSelectMember(){
  		//가변길이로 데이터를 저장
  		Vector<MemberDTO> v = new Vector<>();
  		
  		//무조건 데이터 베이스는 예외 처리를 반드시 해야 합니다.
  		 try{
  			 //커넥션 연결 
  			 getcon();
  			 
  			 //쿼리 준비 
  			 String SQL = "SELECT * FROM MEMBER";
  			 
  			 //쿼리를 실행 시켜주는 객체 선언 
  			 pstmt = con.prepareStatement(SQL);
  			 
  			 //메소드 다 외우기
  			 //쿼리를 실행 시킨 결과를 리턴해서 받아줌(오라클의 테이블의 검색된 결과를 자바 객체에 저장) 
  			 rs = pstmt.executeQuery();
  			 
  			 //반복문을 사용해서 rs에 저장된 데이터를 추출해 놓아야합니다
  			 while(rs.next()){//저장된 데이터 만큼까지 반복문을 돌리겠다는 뜻 입니다. 
  				MemberDTO mdto = new MemberDTO(); //컬럼으로 나뉘어진 데이터를 빈 클래스에 저장 
  				mdto.setUserId(rs.getString(1));
  				mdto.setUserPw(rs.getString(2));
  				mdto.setUserName(rs.getString(3));
  				mdto.setUserPhon(rs.getInt(4));
  				mdto.setUserEmail(rs.getString(5));
  				mdto.setUserAddr(rs.getString(6));

  				
  				 //패키징된 memberbean클래스를 백터에 저장 
  				 //v.add(bean);//0번지 부터 순서대로 데이터가 저장
  				v.add(mdto);
  			 }
  			 //자원 반납
  			 con.close();
  			 
  		    }catch(Exception e){
  		    	e.printStackTrace();
  		   	}
  		 
  		 	//다 저장된 백터를 리턴
  		 	return v;	
  	}
  	
  	
  //한 회원의 정보를 수정하는 매소드 
  	public void updateMember(MemberDTO mdto){
  		getcon();
  		try {
  		 //쿼리 준비 
  		 String SQL = "UPDATE MEMBER SET userPw=?, userName=?, userPhon=?, userEmail=?, userAddr=? WHERE userId=?";
  		 //쿼리를 실행 시켜주는 객체 선언 
  		 pstmt = con.prepareStatement(SQL);		 
  		 //?의 값을 맵핑 
  		 pstmt.setString(1,mdto.getUserPw());
  		 pstmt.setString(2,mdto.getUserName());
  		 pstmt.setInt(3,mdto.getUserPhon());
  		 pstmt.setString(4,mdto.getUserEmail());
  		 pstmt.setString(5,mdto.getUserEmail());
  		 pstmt.setString(6,mdto.getUserId());
  		 //쿼리 실행 
  		 pstmt.executeUpdate();
  		 //자원 반납
  		 con.close();
  	    }catch(Exception e){
  	    	e.printStackTrace();
  	   	}
  	}
  	
  	  
  	public MemberDTO oneSelectMember(String id){
		//한사람에 대한 정보만 리턴하기에 빈클래스 객체 생성
		MemberDTO mdto = new MemberDTO();
		//무조건 데이터 베이스는 예외 처리를 반드시 해야 합니다.
		 try{
			 //커넥션 연결 
			 getcon();	
			 //쿼리 준비 
			 String SQL = "SELECT * FROM MEMBER WHERE userid= ?";
			 //쿼리를 실행 시켜주는 객체 선언 
			 pstmt = con.prepareStatement(SQL);
			 //?의 값을 맵핑 
			 pstmt.setString(1,id);
			 //쿼리 실행 
			 rs = pstmt.executeQuery();
			 if(rs.next()){//레코드가 있다면 
				 mdto.setUserId(rs.getString(1));
				 mdto.setUserPw(rs.getString(2));
				 mdto.setUserName(rs.getString(3));
				 mdto.setUserPhon(rs.getInt(4));
				 mdto.setUserEmail(rs.getString(5));
				 mdto.setUserAddr(rs.getString(6));
				 mdto.setuRegDate(rs.getString(7));
			 }
			 //자원 반납
			 con.close();
			 
		    }catch(Exception e){
		    	e.printStackTrace();
		   	}	
		 //리턴 
		return mdto;	
	}
  	
  	
  	//한회원을 삭제하는 메소드 작성 
  		public void deleteMember(String userId) {  			

  			try {
  			 getcon();
  			 //쿼리 준비 
  			 String SQL = "DELETE FROM MEMBER WHERE userId=?";
  			 //쿼리를 실행 시켜주는 객체 선언 
  			 pstmt = con.prepareStatement(SQL);		 
  			 //?의 값을 맵핑 
  			 pstmt.setString(1,userId);
  			 //쿼리 실행 
  			 pstmt.executeUpdate();
  			 //자원 반납
  			 con.close();
  		    }catch(Exception e){
  		    	e.printStackTrace();
  		   	}	
  		}
  		
  		// 현재 날짜를 제공하는 메서드
  		public String nowTime() {
  			SimpleDateFormat sFormat = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
  			String regist_day = sFormat.format(new Date());
  			return regist_day;
  		}
  	
}