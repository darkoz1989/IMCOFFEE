package board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.BoardDAO;


//�Խ����� �Խñ��� �ۼ��� ���ؼ� ����� ���� �������� Ŀ�ǵ� ��ü�̴�.
public class BWriteFormCommand implements BCommand {
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		System.out.println("BWriteFormCommandŬ��������");
		board.model.BoardDAO bDao = BoardDAO.getInstance();
		String id = request.getParameter("id");
		
		String name = bDao.getLoginName(id);
		request.setAttribute("name", name);		
		System.out.println("BWriteFormCommandŬ���������� ����");
		
	}
}
