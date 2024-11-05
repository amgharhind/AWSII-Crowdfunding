package tools;

import java.util.ArrayList;
import java.util.List;
import entities.*;
public class projetsChercher {
private List<Poste> listeChercher ;

 public projetsChercher(List<Poste> listeChercher) {
	this.listeChercher=new ArrayList<Poste>();
	this.listeChercher.addAll(listeChercher);
}
 public projetsChercher() {
		this.listeChercher=new ArrayList<Poste>();
		
	}
public List<Poste> getListeChercher() {
	return listeChercher;
}
public void setListeChercher(List<Poste> listeChercher) {
	this.listeChercher = listeChercher;
}
 
}
