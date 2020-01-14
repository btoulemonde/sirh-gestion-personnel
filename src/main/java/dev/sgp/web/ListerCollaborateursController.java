package dev.sgp.web;

import java.io.IOException;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.entite.Departement;
import dev.sgp.service.CollaborateurService;
import dev.sgp.service.DepartementService;
import dev.sgp.util.Constantes;

public class ListerCollaborateursController extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	private DepartementService depService = Constantes.DEPART_SERVICE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Collaborateur> collaborateurs = collabService.listerCollaborateurs();
		List<Departement> departements = depService.listerDepartements();
		req.setAttribute("collaborateurs", collaborateurs);
		req.setAttribute("departements", departements);
		req.getRequestDispatcher("/WEB-INF/views/collab/listerCollaborateurs.jsp").forward(req, resp);
	}

	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		List<Departement> departements = depService.listerDepartements();
		Optional<Departement> dep= departements.stream().filter(d -> d.getNom().equals(req.getParameter("departement"))).findFirst();
		List<Collaborateur> listCollab = collabService.listerCollaborateurs();
		
		if(dep.isPresent()){
			listCollab = listCollab.stream().filter(c->c.getDepartement().equals(dep.get())).collect(Collectors.toList());	
		}
		
		
		if(req.getParameter("afficherDesactiver")==null){
		listCollab = listCollab.stream().filter(c -> c.isActif()).collect(Collectors.toList());
		}
		
		
		req.setAttribute("collaborateurs", listCollab);
		req.setAttribute("afficherDesactiver", req.getParameter("afficherDesactiver"));
		req.setAttribute("departement", req.getParameter("departement"));
		req.getRequestDispatcher("/WEB-INF/views/collaborateurs/Lister_Collaborateurs.jsp").forward(req, resp);
		
		
		
		
		
		
		
	}
	
	
}
