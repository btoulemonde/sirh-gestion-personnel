package dev.sgp.service;

import java.util.ArrayList;
import java.util.List;

import dev.sgp.entite.Departement;

public class DepartementService {
	private List<Departement> departements = new ArrayList<>();

	public List<Departement> listerDepartements() {
		return departements;
	}


	public void sauvegarderDepartement(Departement departement) {
		departements.add(departement);
	}

	public DepartementService() {
		departements.add(new Departement(1,"Comptabilite"));
		departements.add(new Departement(2,"Ressources humaines"));
		departements.add(new Departement(3,"Informatique"));
		departements.add(new Departement(4,"Administratif"));
	}

}
