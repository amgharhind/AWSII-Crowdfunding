package controlers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import entities.*;

import dao.CredentialsDAO;
import dao.ICredentialsDao;
@WebServlet("/chercher")
public class listeProjet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String category=request.getParameter("category");
	String city=request.getParameter("ville");
	String namePoste=request.getParameter("posteName");
	ICredentialsDao dao =new CredentialsDAO();
	List<Poste>  listeposteschercher= dao.search(city, namePoste, category);
	
	// Set the filteredPostes list as a request attribute to be accessed in the JSP
    request.setAttribute("filteredPostes", listeposteschercher);

    // Forward the request to the JSP for rendering the filtered results
    request.getRequestDispatcher("liste-projets.jsp").forward(request, response);
	
	
	
	}

}
