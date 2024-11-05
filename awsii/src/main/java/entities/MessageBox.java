/***********************************************************************
 * Module:  MessageBox.java
 * Author:  Hind
 * Purpose: Defines the Class MessageBox
 ***********************************************************************/
package entities;
import java.util.*;

/** @pdOid cfb14870-9dbc-402e-a9af-bab294d3dc8a */
public class MessageBox {
    private int id_message_box;
   public List<Conversation> getConversattions() {
		return conversattions;
	}


	public void setConversattions(List<Conversation> conversattions) {
		this.conversattions = conversattions;
	}


	public Utilisateur getUtilisateur() {
		return utilisateur;
	}


	public void setUtilisateur(Utilisateur utilisateur) {
		this.utilisateur = utilisateur;
	}

private List<Conversation> conversattions;
   

   
   
   public Utilisateur utilisateur;
  
   public MessageBox() {
      
   }
   
   
 


public int getId_message_box() {
	return id_message_box;
}


public void setId_message_box(int id_message_box) {
	this.id_message_box = id_message_box;
}

}