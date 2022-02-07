package board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.BoardDAO;
import board.model.BoardDTO;


//DB�� ����Ǿ� �ִ� �Խñ��� ������ �Ҷ� �����ϴ� Ŀ�ǵ� ��ü
public class BViewCommand implements BCommand {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO bDao = BoardDAO.getInstance();
		//������ �ϴ� �Խñ��� ������ �������� �ִ� �ڵ�
		int num = Integer.parseInt(request.getParameter("num"));
		//������ �ϴ� �Խñ��� �ִ� ������ ���� �������� �ִ� �ڵ�
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		
		BoardDTO board = new BoardDTO();
		board = bDao.getBoardByNum(num, pageNum);
		
		request.setAttribute("num", num);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("board", board);		
	}
}
