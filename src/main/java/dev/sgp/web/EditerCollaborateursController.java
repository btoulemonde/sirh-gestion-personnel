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

public class EditerCollaborateursController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
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
		String matricule = req.getParameter("matricule");
		List<Collaborateur> listeCollaborateurs = collabService.listerCollaborateurs();
		Optional<Collaborateur> collab = listeCollaborateurs.stream().filter(c -> c.getMatricule().equals(matricule))
				.findFirst();
		

			Collaborateur collaborateur = collab.get();

			collaborateur.setAdresse(req.getParameter("adresse"));
			collaborateur.setIban(req.getParameter("iban"));
			collaborateur.setBic(req.getParameter("bic"));
			collaborateur.setIntitulePoste(req.getParameter("poste"));
			

			
			
			List<Departement> listeDepartements = depService.listerDepartements();
			Optional<Departement> dep = listeDepartements.stream()
					.filter(d -> d.getNom().equals(req.getParameter("departement"))).findFirst();
			if (dep.isPresent()) {
				
				collaborateur.setDepartement(dep.get()); 
			}
			
			
			
			if (req.getParameter("desactiver") == null) {
				collaborateur.setActif(true);
			} else {
				collaborateur.setActif(false);
			}
			
			
			
			req.setAttribute("collaborateurs", collabService.listerCollaborateurs().stream().filter(c2 -> c2.isActif()).collect(Collectors.toList()));
			resp.sendRedirect(req.getContextPath()+"/collaborateurs/lister");
			
			
			

		
	}

}
