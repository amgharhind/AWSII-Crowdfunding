/***********************************************************************
 * Module:  Conversation.java
 * Author:  Hind
 * Purpose: Defines the Class Conversation
 ***********************************************************************/
package entities;
import java.util.*;


public class Conversation {
 
   private List<Message> messages;
   private int id_conv;
   
   private Utilisateur participantA;

   private Utilisateur participantB;
 
   private Date dateConv;

   

   public Conversation() {
      // TODO: implement
   }
   
  

   

 
   
  


public int getId_conv() {
	return id_conv;
}


public void setId_conv(int id_conv) {
	this.id_conv = id_conv;
}


public List<Message> getMessages() {
	return messages;
}


public void setMessages(List<Message> messages) {
	this.messages = messages;
}


public Utilisateur getParticipantA() {
	return participantA;
}


public void setParticipantA(Utilisateur participantA) {
	this.participantA = participantA;
}


public Utilisateur getParticipantB() {
	return participantB;
}


public void setParticipantB(Utilisateur participantB) {
	this.participantB = participantB;
}


public Date getDateConv() {
	return dateConv;
}


public void setDateConv(Date dateConv) {
	this.dateConv = dateConv;
}

}