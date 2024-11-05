/***********************************************************************
 * Module:  donation.java
 * Author:  Hind
 * Purpose: Defines the Class donation
 ***********************************************************************/
package entities;
import java.util.*;

/** @pdOid 9ddf3ba8-393b-4b1e-a6d7-5a7020dee070 */
public class donation {
	private Poste poste_cible;
   private int id_donation;
   public float getMontant() {
	return montant;
}

public void setMontant(float montant) {
	this.montant = montant;
}

public Date getDateDonation() {
	return dateDonation;
}

public void setDateDonation(Date dateDonation) {
	this.dateDonation = dateDonation;
}

public Utilisateur getUtilisateurB() {
	return donateur;
}

public void setUtilisateurB(Utilisateur utilisateurB) {
	this.donateur = utilisateurB;
}

private float montant;
   /** @pdOid d31cb7c9-7635-45f8-914a-eff23534be76 */
   private Date dateDonation;
   
   /** @pdOid f149d1c2-ddde-44c1-ba35-10ec5be7a87e */
   protected void finalize() {
      // TODO: implement
   }
   
   public Utilisateur donateur;
   
   /** @pdOid 19a9c5f3-e92b-4a5f-9c30-d1ba087d4588 */
   public donation() {
      
   }

public int getId_donation() {
	return id_donation;
}

public void setId_donation(int id_donation) {
	this.id_donation = id_donation;
}

public Poste getPoste_cible() {
	return poste_cible;
}

public void setPoste_cible(Poste poste_cible) {
	this.poste_cible = poste_cible;
}

}