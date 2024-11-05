
package entities;
public class Localisation {
   private int id_loc;
   public int getId_loc() {
	return id_loc;
}

public void setId_loc(int id_loc) {
	this.id_loc = id_loc;
}

private String paye;
  
   private String ville;
  
   private String region;
   
   /** @pdRoleInfo migr=no name=InformationsPersonnels assc=association1 coll=java.util.Collection impl=java.util.HashSet mult=0..* */
   
   /** @pdOid 114da153-63aa-4d5a-bb67-7fa13a43d249 */
   public Localisation() {
      // TODO: implement
   }
   
   /** @pdOid 5cb435e3-6a56-45b2-867a-4e3941565bb0 */
   public String getPaye() {
      return paye;
   }
   
   /** @param newPaye
    * @pdOid bba73e02-8487-47b5-b37d-3933033a4f7a */
   public void setPaye(String newPaye) {
      paye = newPaye;
   }
   
   /** @pdOid 11bc395c-2908-411f-9045-419cf931807d */
   public String getVille() {
      return ville;
   }
   
   /** @param newVille
    * @pdOid c206d042-e595-488d-93c9-8c1e67b0e394 */
   public void setVille(String newVille) {
      ville = newVille;
   }
   
   /** @pdOid 8344bcb2-2922-46e0-a2fd-f39ee790ffd8 */
   public String getRegion() {
      return region;
   }
   
   /** @param newRegion
    * @pdOid 1cb774c7-6afa-42b6-8930-86e8821c867f */
   public void setRegion(String newRegion) {
      region = newRegion;
   }
   
   
   
   
   
  
   
   

}