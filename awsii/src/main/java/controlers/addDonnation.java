package controlers;
import java.io.IOException;
import java.time.LocalDate;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import dao.CredentialsDAO;
import dao.ICredentialsDao;
import entities.*;
import entities.donation;
@WebServlet("/addDonnation")
public class addDonnation  extends HttpServlet{
	private ICredentialsDao dao;
@Override
public void init() throws ServletException {
	dao=new  CredentialsDAO();
}
	private static final long serialVersionUID = 1L;

@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	float fond_user=0;
	int id_util=Integer.parseInt(request.getParameter("id_util"));
	int id_poste=Integer.parseInt(request.getParameter("id_poste"));
	float mantant=Float.parseFloat(request.getParameter("mantant"));
	donation donation=new donation();
	donation.setMontant(mantant);
	Poste pCi=dao.getPosteById(id_poste);
	Utilisateur donateur=dao.getutilById(id_util);
	donation.setPoste_cible(pCi);
	donation.setUtilisateurB(donateur);
	String Bank=request.getParameter("banke");
	Map<Integer, Float> contrubution=dao.SumDonByUtilByPoste(id_poste);
	if(dao.searchKeyInMap(contrubution, id_util)) {
		for(Map.Entry<Integer, Float> entry:contrubution.entrySet()) {
			if(entry.getKey()==id_util) {
				fond_user=entry.getValue();
			}
		}
	}
	Utilisateur user=dao.getutilById(id_util);
	
	 LocalDate currentDate = LocalDate.now();

     // Get the expiration date as a Date object
     Date expirationDate = user.getInformationsPersonnels().getDateExpRib(); // Assuming item.getDateExpiration() returns a java.util.Date object

     // Convert the expiration date to LocalDate using Calendar
     Calendar calendar = Calendar.getInstance();
     calendar.setTime(expirationDate);

     int year = calendar.get(Calendar.YEAR);
     int month = calendar.get(Calendar.MONTH) + 1; // Month starts from 0 in Calendar
     int day = calendar.get(Calendar.DAY_OF_MONTH);

     LocalDate localExpirationDate = LocalDate.of(year, month, day);
     
	if(!localExpirationDate.isAfter(currentDate)) {
		response.sendRedirect("page-404.jsp");
		
	}else {
		
	
	if(mantant>=250000||(fond_user+mantant)>=250000) {
		
		response.sendRedirect("Donnation.jsp?id_poste="+id_poste);
	}else {
		int test=0;
		 test=dao.insertDonation(donation);
		if(test!=0) {
			if(Bank.equals("bank1"))
			response.sendRedirect("https://bank1.com/payment?amount="+mantant);
		}else if(Bank.equals("bank2")) {
			response.sendRedirect("https://bank2.com/payment?amount="+mantant);
		}else {
			response.sendRedirect("https://bank3.com/payment?amount="+mantant);
		}
		
	}

	
	}
	
	}
}
