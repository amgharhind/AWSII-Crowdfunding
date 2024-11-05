
package entities;
public class Message {
      
	private int id_message;
	
   public String getContenue() {
		return contenue;
	}

	public void setContenue(String contenue) {
		this.contenue = contenue;
	}

private String dateEnvoi;
  
   private Utilisateur proprietaire;
   private Utilisateur expediteur;
  
   public Utilisateur getExpediteur() {
	return expediteur;
}

public void setExpediteur(Utilisateur expediteur) {
	this.expediteur = expediteur;
}

private String contenue;
  
   
   /** @pdOid f568d417-689b-443a-9f34-1553f3d15eb2 */
   public String getDateEnvoi() {
      return dateEnvoi;
   }
   
   /** @param formattedDate
    * @pdOid 65086000-602c-4c5b-a1b3-e1d6f7d97683 */
   public void setDateEnvoi(String formattedDate) {
      dateEnvoi = formattedDate;
   }
   
 
   
 

   
   /** @pdOid 7dfcf8b7-9c34-4056-9d87-91b8d10c6a01 */
   public Utilisateur getProprietaire() {
      return proprietaire;
   }
   
   /** @param newProprietaire
    * @pdOid 7c0d1832-5188-4795-8b94-b3b71374ed6e */
   public void setProprietaire(Utilisateur newProprietaire) {
      proprietaire = newProprietaire;
   }
   
   /** @pdOid 3eb683d5-9309-4a85-92c4-b6ffbc56b908 */
   public Message() {
      // TODO: implement
   }

public int getId_message() {
	return id_message;
}

public void setId_message(int id_message) {
	this.id_message = id_message;
}

}