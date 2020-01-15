package dev.sgp.service;

import java.util.ArrayList;
import java.util.List;

import dev.sgp.entite.VisiteWeb;

public class VisiteWebService {
	
	List<VisiteWeb> listeVisites = new ArrayList<>();
	
	public List<VisiteWeb> listerVisiteWeb(){
		
		return listeVisites;
	}
	
	public void sauvegarderVisiteWeb(VisiteWeb visite){
		
		listeVisites.add(visite);
		
	}

}
