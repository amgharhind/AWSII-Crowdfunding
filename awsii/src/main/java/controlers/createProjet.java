package controlers;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import entities.*;
import tools.submitted;
import dao.CredentialsDAO;
import dao.ICredentialsDao;
import java.util.*;
@MultipartConfig
@WebServlet("/addProject")
public class createProjet extends HttpServlet {
	private ICredentialsDao dao=null;
	@Override
	public void init(ServletConfig config) throws ServletException {
		dao=new CredentialsDAO();
	}

	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       response.sendRedirect("sign-in.jsp");
	
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Poste poste=new Poste();
		
		Part pic1= request.getPart("poste-pic1") ;
		Part pic2= request.getPart("poste-pic2") ;
		Part pic3= request.getPart("poste-pic3") ;
		 
		 Part[] images= {pic1,pic2,pic3};
		 
		  Set<Image> itemSet = new LinkedHashSet<>();
		for(Part img:images) {
			if(img!=null) {
				
				 String pic=submitted.getSubmittedFileName(img);
				
				 Image image=new Image();
				 image.setImageData(pic);
				 image.setPart(img);
				 itemSet.add(image);
			}
		}
		 
	    // poste.setCreateur(createur);
		 String id_createur=request.getParameter("id_util");
		 String title=request.getParameter("title");
		 String city=request.getParameter("city");
		 float price = Float.parseFloat(request.getParameter("price"));
		 String categorie=request.getParameter("categorie");
         String description=request.getParameter("description"); 
         poste.setCategorie(categorie);
         poste.setDescription(description);
         poste.setObjectifDuFond(price);
         poste.setNomProjet(title);
         poste.setVilleCiblee(city);
         poste.setImages(itemSet);
         Utilisateur createur=dao.getutilById(Integer.parseInt(id_createur));
         poste.setCreateur(createur);
         SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
         try {
			Date date= format.parse(request.getParameter("dateExp"));
			poste.setDateExpiration(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
         HttpSession session=request.getSession(false);
       int id_poste=dao.insertPoste(poste, createur);
       poste.setId_poste(id_poste);
       if(id_poste!=-1) {
    	   for(Image im:poste.getImages()) {
    	      	 dao.insertImagesforPoste(im,id_poste );
    	         }
    	 if(session!=null) {
    		 session.setAttribute("poste", poste);
    	 }
    	   
    	   response.sendRedirect("un-seule-projet.jsp");
       }
       
    
         
	}

}
