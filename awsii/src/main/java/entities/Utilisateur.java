/***********************************************************************
 * Module:  Utilisateur.java
 * Author:  Hind
 * Purpose: Defines the Class Utilisateur
 ***********************************************************************/
package entities;


import java.util.*;

import javax.servlet.http.Part;

/** @pdOid e5358137-7b8f-4d4f-890a-09ac65e75f07 */
public class Utilisateur {
   @Override
	public String toString() {
		return "Utilisateur [id_util=" + id_util + ", imageProfile=" + imageProfile + ", mesProjets=" + mesProjets
				+ ", mesDonations=" + mesDonations + ", messageBox=" + messageBox + ", role=" + role + ", login="
				+ login + ", password=" + password + ", nom=" + nom + ", prenom=" + prenom + ", dateInscription="
				+ dateInscription + ", filereq=" + filereq + ", informationsPersonnels=" + informationsPersonnels + "]";
	}

private int id_util;
 
   public int getId_util() {
	return id_util;
}

public void setId_util(int id_util) {
	this.id_util = id_util;
}

public List<donation> getMesDonations() {
	return mesDonations;
}

public void setMesDonations(List<donation> mesDonations) {
	this.mesDonations = mesDonations;
}

public MessageBox getMessageBox() {
	return messageBox;
}

public void setMessageBox(MessageBox messageBox) {
	this.messageBox = messageBox;
}

public String getRole() {
	return role;
}

public void setRole(String role) {
	this.role = role;
}

public String getLogin() {
	return login;
}

public void setLogin(String login) {
	this.login = login;
}

public InformationsPersonnels getInformationsPersonnels() {
	return informationsPersonnels;
}

public void setInformationsPersonnels(InformationsPersonnels informationsPersonnels) {
	this.informationsPersonnels = informationsPersonnels;
}

private String imageProfile;
 
   private List<Poste> mesProjets;

   private List<donation> mesDonations;
 
   private MessageBox messageBox;

   private String role;
  
   private String login;
  
   private String password;
  
   private String nom;
  
   private String prenom;
  
   private Date dateInscription;
   private Part filereq;
   
   public InformationsPersonnels informationsPersonnels;
  
   
   
   
   public String getImageProfile() {
      return imageProfile;
   }
  
   public void setImageProfile(String pic) {
      imageProfile = pic;
   }
  
   public List<Poste> getMesProjets() {
      return mesProjets;
   }
   
   
   public void setMesProjets(List<Poste> newMesProjets) {
      mesProjets = newMesProjets;
   }
   
   
   public Utilisateur() {
      
   }
   
  
   public String getPassword() {
      return password;
   }
   
   
   public void setPassword(String newPassword) {
      password = newPassword;
   }
   
   
   public String getNom() {
      return nom;
   }
  
   public void setNom(String newNom) {
      nom = newNom;
   }
   
  
   public String getPrenom() {
      return prenom;
   }
  
   public void setPrenom(String newPrenom) {
      prenom = newPrenom;
   }
   
  
   public Date getDateInscription() {
      return dateInscription;
   }
   
  
   public void setDateInscription(Date newDateInscription) {
      dateInscription = newDateInscription;
   }

public Part getFilereq() {
	return filereq;
}

public void setFilereq(Part filereq) {
	this.filereq = filereq;
}
   
   
  
}