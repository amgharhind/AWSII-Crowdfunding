package controlers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/disconnect")
public class disconnectServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Retrieve the current session
	    HttpSession session = request.getSession(false);
	    
	    if (session != null) {
	        // Perform logout/disconnect actions
	        session.invalidate(); // Invalidate the session
	        // Additional cleanup code if needed
	    }

	    // Redirect the user to the desired page (e.g., login page)
	    response.sendRedirect("sign-in.jsp");
	}

	

}

