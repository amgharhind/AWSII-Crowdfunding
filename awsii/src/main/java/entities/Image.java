/***********************************************************************
 * Module:  Image.java
 * Author:  Hind
 * Purpose: Defines the Class Image
 ***********************************************************************/
package entities;

import java.util.Objects;

import javax.servlet.http.Part;

public class Image {
  
   private String imageData;
   
   private int id_img;
   private Part part;
   public int getId_img() {
	return id_img;
}
   @Override
   public boolean equals(Object o) {
       if (this == o) return true;
       if (o == null || getClass() != o.getClass()) return false;
       Image image = (Image) o;
       return Objects.equals(imageData, image.getImageData());
   }

   @Override
   public int hashCode() {
       return Objects.hash(imageData);
   }
@Override
public String toString() {
	return "Image [imageData=" + imageData + ", id_img=" + id_img + ", part=" + part + "]";
}

public void setId_img(int id_img) {
	this.id_img = id_img;
}


public Image() {
      id_img=0;
   }


   
   /** @pdOid da488e3f-75bb-4f47-b274-75958faa8069 */
   public String getImageData() {
      return imageData;
   }
   
   /** @param newImageData
    * @pdOid 95eecdef-70fc-470e-aa0c-30cf72924a6d */
   public void setImageData(String newImageData) {
      imageData = newImageData;
   }

public Part getPart() {
	return part;
}

public void setPart(Part part) {
	this.part = part;
}

}