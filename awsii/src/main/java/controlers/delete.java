package controlers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import dao.CredentialsDAO;
import dao.ICredentialsDao;
@WebServlet("/delete")

public class delete extends HttpServlet{

	/**
	 * 
	 */
	private ICredentialsDao dao;
	@Override
	public void init() throws ServletException {
		dao=new CredentialsDAO();
	}
	
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id_user=Integer.parseInt(request.getParameter("id_util"));
		int test=dao.deleteUtilisateur(id_user);
		if(test!=0) {
			request.getRequestDispatcher("adminUsers.jsp").forward(request, response);
		}
	}
	

}
