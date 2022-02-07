package board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//DB�� ����Ǿ� �ִ� �Խñ��� ������ �����ϴ� Ŀ�ǵ� ��ü
public class BDeleteCommand implements BCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//�����ϰ��� �ϴ� �Խñ��� ������ �������� �ִ� �ڵ�
		int num = Integer.parseInt(request.getParameter("num"));
		board.model.BoardDAO bDao = board.model.BoardDAO.getInstance();
		request.setAttribute("cnt", num);
		bDao.deleteBoard(num);
		
	}	
}
