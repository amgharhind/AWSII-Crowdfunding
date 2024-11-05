/***********************************************************************
 * Module:  Poste.java
 * Author:  Hind
 * Purpose: Defines the Class Poste
 ***********************************************************************/
package entities;
import java.util.*;

/** @pdOid 7e507d7d-8305-467e-8003-c57da2624989 */
public class Poste {
  private  int id_poste;
  
   public int getId_poste() {
	return id_poste;
}

public void setId_poste(int id_poste) {
	this.id_poste = id_poste;
}

public String getVilleCiblee() {
	return villeCiblee;
}

public void setVilleCiblee(String villeCiblee) {
	this.villeCiblee = villeCiblee;
}





private String description;

public String getDescription() {
	return description;
}

public void setDescription(String description) {
	this.description = description;
}





private Utilisateur createur;
   /** @pdOid e24cb3aa-a4fc-408b-a785-751c1f86c5a9 */
   private Date dateDeCreation;
   /** @pdOid 6a758ef4-36ff-4136-b098-54e31c72ae55 */
   private float objectifDuFond;
   /** @pdOid f6697002-cd1c-4202-aa02-c3f2c0ac12ac */
   private Date dateExpiration;
   /** @pdOid 54e7438a-9510-40a5-ab8b-1ae5f00b0353 */
   private String categorie;
   /** @pdOid 06e0b858-f0f9-4545-9917-e4b6c1d383ad */
   private List<Utilisateur> contributeurs;
   /** @pdOid 5d675d04-755b-4345-a720-2d5eb38c2981 */
   private float fonds;
   /** @pdOid f0ccd16a-fe9e-4b86-ac0a-f996d71f7745 */
   private String villeCiblee;
   /** @pdOid 0f99f54a-9778-43f8-b169-4822b9ba86d4 */
   private List<donation>  Donations;
   /** @pdOid 981ab9f4-af7c-4f51-b0f0-c66d052ffdd0 */
   private String nomProjet;
   
  

 
  
   public Set<Image> getImages() {
	return images;
}

public void setImages(Set<Image> image) {
	this.images = image;
}

private Set<Image> images;
   
   /** @pdOid 80f2faa9-c986-41f6-a4dc-46dcdbab1164 */
   public Utilisateur getCreateur() {
      return createur;
   }
   
   /** @param newCreateur
    * @pdOid bdd2be7e-131a-48cf-9921-c0ec176cd064 */
   public void setCreateur(Utilisateur newCreateur) {
      createur = newCreateur;
   }
   
   /** @pdOid 5f57739e-00b0-4812-a830-03cef5b5b17f */
   public Date getDateDeCreation() {
      return dateDeCreation;
   }
   
   /** @param newDateDeCreation
    * @pdOid bead382b-eefc-4fbf-b8a1-ba6536eb37c8 */
   public void setDateDeCreation(Date newDateDeCreation) {
      dateDeCreation = newDateDeCreation;
   }
   
   /** @pdOid 3b6bc7f0-77be-4ba8-a3ff-fcef0d5c21c0 */
   public float getObjectifDuFond() {
      return objectifDuFond;
   }
   
   /** @param newObjectifDuFond
    * @pdOid 7015e330-c080-4c29-acb3-f90571661312 */
   public void setObjectifDuFond(float newObjectifDuFond) {
      objectifDuFond = newObjectifDuFond;
   }
   
   /** @pdOid fc570ff1-5faf-4c4e-9215-a43797f50159 */
   public Date getDateExpiration() {
      return dateExpiration;
   }

   public void setDateExpiration(Date newDateExpiration) {
      dateExpiration = newDateExpiration;
   }
   
   
   public String getCategorie() {
      return categorie;
   }
  
   public void setCategorie(String newCategorie) {
      categorie = newCategorie;
   }
   
  
   public List<Utilisateur> getContributeurs() {
      return contributeurs;
   }
   
   /** @param newContributeurs
    * @pdOid bb96eaf9-b980-4429-bed2-be65f5e6d513 */
   public void setContributeurs(List<Utilisateur> newContributeurs) {
      contributeurs = newContributeurs;
   }
   
   /** @pdOid 286bc0fd-57db-46f1-9285-bf25d4dd1064 */
   public float getFonds() {
      return fonds;
   }
   
   /** @param newFonds
    * @pdOid fa0045ab-82c1-449d-a1bd-663aca2a6e1c */
   public void setFonds(float newFonds) {
      fonds = newFonds;
   }
   
   /** @pdOid 62876d85-48eb-49cd-a02c-1cb6f84c831f */
   public String getNomProjet() {
      return nomProjet;
   }
   
   /** @param newNomProjet
    * @pdOid fc7164ea-8e81-4829-95c5-c5973b1d19aa */
   public void setNomProjet(String newNomProjet) {
      nomProjet = newNomProjet;
   }
   
   @Override
public String toString() {
	return "Poste [id_poste=" + id_poste + ", description=" + description + ", createur=" + createur
			+ ", dateDeCreation=" + dateDeCreation + ", objectifDuFond=" + objectifDuFond + ", dateExpiration="
			+ dateExpiration + ", categorie=" + categorie + ", contributeurs=" + contributeurs + ", fonds=" + fonds
			+ ", villeCiblee=" + villeCiblee + ", Donations=" + Donations + ", nomProjet=" + nomProjet + ", images="
			+ images + "]";
}

/** @pdOid 134e4773-269d-4739-9308-6137f1548175 */
   public Poste() {
      this.fonds=0;
      Donations=new ArrayList<>();
      contributeurs=new ArrayList<>();
       images=new LinkedHashSet<Image>();
       dateDeCreation=new Date();
      
   }

public List<donation> getDonations() {
	return Donations;
}

public void setDonations(List<donation> donations) {
	Donations = donations;
}
   
   
  
  
   
   
  

}