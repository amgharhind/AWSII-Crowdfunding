package controlers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import dao.CredentialsDAO;
import dao.ICredentialsDao;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import entities.*;
import tools.submitted;

@MultipartConfig
@WebServlet("/signup")
public class signup extends HttpServlet {
	/**
	 * 
	 */
	
	
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		 ICredentialsDao dao=new CredentialsDAO();
		Utilisateur u=new Utilisateur();
         Part filepart=request.getPart("profile-pic");
         String pic=submitted.getSubmittedFileName(filepart);
        
 	   Localisation adresse=new Localisation();
       String contry=request.getParameter("countrySelect");
       String region=request.getParameter("regionSelect");
       String city=request.getParameter("citySelect");
    
       
		adresse.setPaye(contry);
		adresse.setRegion(region);
		adresse.setVille(city);
		
		
		
		
	    InformationsPersonnels ip=new InformationsPersonnels();
	     
	    
	    ip.setMailUrl(request.getParameter("gmail"));
	    ip.setLinkedinUrl(request.getParameter("linkdin"));
	    ip.setTel(request.getParameter("tel"));
	    ip.setRib(request.getParameter("rib"));
	    ip.setAge(Integer.parseInt(request.getParameter("age")));
	    ip.setTypeCreditCard(request.getParameter("cardTypeSelect"));
	    ip.setPin(Integer.parseInt(request.getParameter("pin")));
	    
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	   
		try {
			

		    ip.setDateExpRib(format.parse(request.getParameter("dateExp")));
		 
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	    ip.setAdresse(adresse);
	    
	    
	    dao.insertInformationsPersonnels(ip,adresse);
	
	    u.setImageProfile(pic);
        u.setFilereq(filepart);
        u.setNom(request.getParameter("name"));
		u.setPrenom(request.getParameter("prenom"));
	    u.setLogin(request.getParameter("username"));
	    u.setPassword(request.getParameter("password"));
	    u.setInformationsPersonnels(ip);
		 dao.insertUtilisateur(u);
		 int test3=dao.affectMessageBoxToUser();
		 
		 
		 if(test3!=0) {
		    	response.sendRedirect("home_principale.jsp");
		    }
 
	}

}
