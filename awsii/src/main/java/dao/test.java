package dao;

import java.util.List;

import entities.Conversation;

public class test {

	public static void main(String[] args) {
		ICredentialsDao dao=new CredentialsDAO();
		int messageBoxId = dao.getMessageBoxId(13);
		List<Conversation> conversations = dao.ConversationsInMesageBox(messageBoxId);
		//System.out.println(messageBoxId);
		System.out.println(conversations.isEmpty());
	for(Conversation conv:conversations) {
		System.out.println(conv.getId_conv());
		
	}
	
	
	
	}

}
