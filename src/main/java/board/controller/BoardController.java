package board.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.command.BCommand;
import board.command.BDeleteCommand;
import board.command.BListCommand;
import board.command.BUpdateCommand;
import board.command.BViewCommand;
import board.command.BWriteCommand;
import board.command.BWriteFormCommand;



public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardController() {
        super();      
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		actionDo(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		actionDo(request, response);
	}


	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo");
		
		BCommand com = null;
		String viewPage = null;
		
		//getRequestURI()�� ��û�� ��ü uri�� �����´�.
		String uri = request.getRequestURI();
		System.out.println("URI : " + uri);
		
		//getContextPath()�� ������Ʈ���� ���ϵȴ�.
		String contextPath = request.getContextPath();
		System.out.println("contextPath : " + contextPath);
		
		//���� ����Ǿ���� ������ �̸��� ���� ���̴�.
		String command = uri.substring(contextPath.length());
		System.out.println("command : " + command);
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("UTF-8");
		
		//command���Ͽ� ���� �б⸦ �ϴ� �ڵ�
		if(command.equals("/BoardListAction.do")) {    //DB�� ����Ǿ� �ִ� ��� �Խñ��� ����ϴ� �κ�
			System.out.println("------------------------------");
			System.out.println("/BoardListAction.do������ ȣ��");
			System.out.println("------------------------------");
			com = new BListCommand();
			com.execute(request, response);
			System.out.println("BoardListAction�� execute()���� �Ϸ�");
			viewPage = "welcome.jsp?center=./board/list.jsp";			
			
		}	
		else if(command.equals("/mBoardListAction.do")){			
			  System.out.println("------------------------------");
			  System.out.println("/BoardListAction.do������ ȣ��");
			  System.out.println("------------------------------"); com = new
			  BListCommand(); com.execute(request, response);
			  System.out.println("BoardListAction�� execute()���� �Ϸ�");			 
			  viewPage = "./admin/managerMain.jsp?center=./boardManager/mList.jsp"; 
			
		}
		else if(command.equals("/BoardWriteForm.do")) {    //ȸ���� �α��� ������ �������� �κ�
			System.out.println("------------------------------");
			System.out.println("/BoardWriteForm.do������ ȣ��");
			System.out.println("------------------------------");
			com = new BWriteFormCommand();
			com.execute(request, response);
			System.out.println("BoardWriteForm�� execute()���� �Ϸ�");
			viewPage = "./admin/managerMain.jsp?center=./boardManager/mWriteForm.jsp";
		} 
		else if(command.equals("/BoardWriteAction.do")) {    //�Խñ��� ���� DB�� �����ϴ� �κ�
			System.out.println("------------------------------");
			System.out.println("/BoardWriteAction.do������ ȣ��");
			System.out.println("------------------------------");
			com = new BWriteCommand();
			com.execute(request, response);
			System.out.println("BoardWriteAction�� execute()���� �Ϸ�");
			viewPage = "/mBoardListAction.do";
		}
		else if(command.equals("/BoardViewAction.do")) {    //�Խ��ǿ� �ִ� �Խñ��� ������ Ŭ���ϸ� �� ������ ���� �ڵ�
			System.out.println("------------------------------");
			System.out.println("/BoardViewAction.do������ ȣ��");
			System.out.println("------------------------------");
			com = new BViewCommand();
			com.execute(request, response);
			System.out.println("BoardViewAction�� execute()���� �Ϸ�");
			viewPage = "welcome.jsp?center=./board/view.jsp";
		}
		else if(command.equals("/mBoardViewAction.do")) {    //�Խ��ǿ� �ִ� �Խñ��� ������ Ŭ���ϸ� �� ������ ���� �ڵ�
			System.out.println("------------------------------");
			System.out.println("/BoardViewAction.do������ ȣ��");
			System.out.println("------------------------------");
			com = new BViewCommand();
			com.execute(request, response);
			System.out.println("BoardViewAction�� execute()���� �Ϸ�");
			viewPage = "./admin/managerMain.jsp?center=./boardManager/mView.jsp";
		}	
		else if(command.equals("/BoardUpdateAction.do")) {    //�Խñ��� �����ϴ� �ڵ�
			System.out.println("------------------------------");
			System.out.println("/BoardUpdateAction.do������ ȣ��");
			System.out.println("------------------------------");
			com = new BUpdateCommand();
			com.execute(request, response);
			System.out.println("BoardUpdateAction�� execute()���� �Ϸ�");
			viewPage = "/mBoardListAction.do";
		} 
		else if(command.equals("/BoardDeleteAction.do")) {    //�Խñ��� �����ϴ� �ڵ�
			System.out.println("------------------------------");
			System.out.println("/BoardDeleteAction.do������ ȣ��");
			System.out.println("------------------------------");
			com = new BDeleteCommand();
			com.execute(request, response);
			System.out.println("BoardDeleteAction�� execute()���� �Ϸ�");
			viewPage = "/mBoardListAction.do";
		}
		
		
		//���� �б⹮���� ������ ��(.jsp)������ ������ ������ �̵��� �ϴ� �ڵ�
		RequestDispatcher rd = request.getRequestDispatcher(viewPage);
		rd.forward(request, response);	
	}
}
