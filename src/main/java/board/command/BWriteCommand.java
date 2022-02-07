package board.command;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.BoardDAO;
import board.model.BoardDTO;


//�Խñ��� �ۼ��ϰ� �ƿ﷯ �� �Խñ��� DB�� ������ ���ִ� Ŀ�ǵ� ��ü
public class BWriteCommand implements BCommand {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("BWriteCommandŬ���� ����");
		BoardDAO bDao = BoardDAO.getInstance();
		System.out.println("id" + request.getParameter("id"));
		BoardDTO board = new BoardDTO();
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));
				
		SimpleDateFormat sFormat = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = sFormat.format(new Date());
		board.setRegist_day(regist_day);
		board.setHit(0);
		board.setIp(request.getRemoteAddr());
				
		bDao.insertBoard(board);  //DB�����ϴ� �޼��带 ȣ��
		
		
		
		System.out.println("BWriteCommandŬ���� ���� �� ����");
		
	}

}
