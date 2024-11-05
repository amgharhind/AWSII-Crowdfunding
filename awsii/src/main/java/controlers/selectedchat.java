package controlers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CredentialsDAO;
import dao.ICredentialsDao;


@WebServlet("/selectedchat")
public class selectedchat extends HttpServlet{
ICredentialsDao dao;
	/**
	 * 
	 */
	@Override
	public void init() throws ServletException {
		dao=new CredentialsDAO();
	}
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id_conversation=Integer.parseInt(request.getParameter("id_conversation"));
		
		
		response.sendRedirect("inbox3.jsp?id_conversation="+id_conversation);
		
	}

}
