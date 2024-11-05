/***********************************************************************
 * Module:  InformationsPersonnels.java
 * Author:  Hind
 * Purpose: Defines the Class InformationsPersonnels
 ***********************************************************************/
package entities;
import java.util.*;

/** @pdOid ed493c84-1197-455a-aade-68fda137d780 */
public class InformationsPersonnels {
   private int id_info_perso;
   public String getRib() {
	return rib;
}

public void setRib(String rib) {
	this.rib = rib;
}

public Date getDateExpRib() {
	return dateExpRib;
}

public void setDateExpRib(Date dateExpRib) {
	this.dateExpRib = dateExpRib;
}

public String getTypeCreditCard() {
	return typeCreditCard;
}

public void setTypeCreditCard(String typeCreditCard) {
	this.typeCreditCard = typeCreditCard;
}
private  int pin;
  private int age;
   private Localisation adresse;
  
   private String linkedinUrl;
  
   private String mailUrl;
   
   private String tel;

   private String rib;
  
   private Date dateExpRib;
   /** @pdOid 022b39b8-3307-42d4-a086-db28d7f486ac */
   private String typeCreditCard;
   
   /** @pdOid b3ce5d12-6c65-4e20-8333-60b6cd7b3f5a */
   protected void finalize() {
      // TODO: implement
   }
   
 
   
   
   /** @pdOid 44b0af98-840f-43dd-a8b3-057024522e7d */
   public Localisation getAdresse() {
      return adresse;
   }
   
   /** @param newAdresse
    * @pdOid a3bd5b2f-15fe-43cc-aa39-1df2264b4fee */
   public void setAdresse(Localisation newAdresse) {
      adresse = newAdresse;
   }
   
   /** @pdOid 3eddb34b-aa6a-4755-acd6-7e5f2884cd95 */
   public InformationsPersonnels() {
      // TODO: implement
   }
   
   /** @pdOid fc757908-ab9d-4425-955c-0737afe51675 */
   public String getLinkedinUrl() {
      return linkedinUrl;
   }
   
   /** @param newLinkedinUrl
    * @pdOid e4a3d018-8c21-4e08-a685-82198087db96 */
   public void setLinkedinUrl(String newLinkedinUrl) {
      linkedinUrl = newLinkedinUrl;
   }
   
   /** @pdOid e784552c-9c72-432b-81cb-4eb48ecc6038 */
   public String getMailUrl() {
      return mailUrl;
   }
   
   /** @param newMailUrl
    * @pdOid 1d2981d9-3dd0-489e-8ff8-a6cb4a7ef5df */
   public void setMailUrl(String newMailUrl) {
      mailUrl = newMailUrl;
   }
   
   /** @pdOid 44542081-a4a0-46a9-b531-ef987cd5f269 */
   public String getTel() {
      return tel;
   }
   
   /** @param newTel
    * @pdOid 5c355437-4385-455a-b272-8caab18feeeb */
   public void setTel(String newTel) {
      tel = newTel;
   }

public int getId_info_perso() {
	return id_info_perso;
}

public void setId_info_perso(int id_info_perso) {
	this.id_info_perso = id_info_perso;
}

public int getAge() {
	return age;
}

public void setAge(int age) {
	this.age = age;
}

public int getPin() {
	return pin;
}

public void setPin(int pin) {
	this.pin = pin;
}

}