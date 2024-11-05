package controlers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.CredentialsDAO;
import dao.ICredentialsDao;
import entities.Utilisateur;

@WebServlet("/signin")

public class signin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		ICredentialsDao dao=new CredentialsDAO();
		Utilisateur u=dao.estAuthentifiee(username, password);
		HttpSession session=request.getSession();
		session.setMaxInactiveInterval(-1);
		if(u==null) {
			request.getRequestDispatcher("sign-in.jsp").forward(request,response) ;
			
		}
		else {
		     response.sendRedirect("home_principale.jsp ");
		     session.setAttribute("moi",u);
		}
		
	}

}
