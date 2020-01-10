package dev.sgp.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.entite.Departement;
import dev.sgp.service.CollaborateurService;
import dev.sgp.service.DepartementService;
import dev.sgp.util.Constantes;

public class EditerCollaborateursController extends HttpServlet {

	private CollaborateurService collabService = Constantes.COLLAB_SERVICE;
	private DepartementService depService = Constantes.DEPART_SERVICE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String matricule = req.getParameter("matricule");
		List<Collaborateur> listeCollaborateurs = collabService.listerCollaborateurs();
		Optional<Collaborateur> collab = listeCollaborateurs.stream().filter(c -> c.getMatricule().equals(matricule))
				.findFirst();

		if (collab.isPresent()) {

			req.setAttribute("collaborateur", collab.get());
		}

		req.getRequestDispatcher("/WEB-INF/views/collab/editerCollaborateurs.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Optional<Collaborateur> collab = collabService.listerCollaborateurs().stream()
				.filter(co -> co.getMatricule()==req.getParameter("matricule")).findFirst();
		if (collab.isPresent()) {

			Collaborateur collaborateur = collab.get();

			collaborateur.setAdresse(req.getParameter("adresse"));

			collaborateur.setIban(req.getParameter("iban"));
			collaborateur.setBic(req.getParameter("bic"));
			collaborateur.setIntitulePoste(req.getParameter("poste"));

			if (req.getParameter("desactiver") == null) {
				collaborateur.setActif(true);
			} else {
				collaborateur.setActif(false);
			}
			List<Departement> listeDepartements = depService.listerDepartements();
			Optional<Departement> dep = listeDepartements.stream()
					.filter(d -> d.getNom().equals(req.getParameter("departement"))).findFirst();
			if (dep.isPresent()) {
				collaborateur.setDepartement(dep.get());
			}
			
			
			List<Collaborateur> collaborateurs = collabService.listerCollaborateurs().stream().filter(coll -> coll.isActif()).collect(Collectors.toList());
			
			req.setAttribute("listeNoms", collaborateurs);
			
			
			req.getRequestDispatcher("/WEB-INF/views/collab/Lister_Collaborateurs.jsp").forward(req, resp);
			resp.sendRedirect(req.getContextPath()+"/collaborateurs/lister");

		}
	}

}
