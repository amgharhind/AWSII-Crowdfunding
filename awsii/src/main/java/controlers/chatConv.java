package controlers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CredentialsDAO;
import dao.ICredentialsDao;
import entities.Conversation;
import entities.Message;
@WebServlet("/chatConv")
public class chatConv extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	ICredentialsDao dao=null;
	@Override
	public void init() throws ServletException {
		dao=new CredentialsDAO();
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String contenu=request.getParameter("message");
		int id_sender=Integer.parseInt(request.getParameter("sender"));
		int id_receiver=Integer.parseInt(request.getParameter("receiver"));
		
		Message message=new Message();
		message.setContenue(contenu);
		message.setProprietaire(dao.getutilById(id_sender));
		message.setExpediteur(dao.getutilById(id_receiver));
		int id_messageBoxReceiver=dao.getMessageBoxId(id_receiver);
		int id_messageBoxSender=dao.getMessageBoxId(id_sender);
		int id_convSender=dao.checkOrCreateConversation(id_sender, id_receiver, id_messageBoxSender);
		int id_convReceiver=dao.checkOrCreateConversation(id_receiver, id_sender, id_messageBoxReceiver);
		Conversation convSender=dao.getconvById(id_convSender);
		Conversation convReceiver=dao.getconvById(id_convReceiver);
		int testS=dao.insertMessage(message, convSender);
		int testR=dao.insertMessage(message, convReceiver);
		if(testS!=0&&testR!=0) {
			
			response.sendRedirect("inbox3.jsp?id_conversation="+id_convSender);
		}
		
		
	}

}
