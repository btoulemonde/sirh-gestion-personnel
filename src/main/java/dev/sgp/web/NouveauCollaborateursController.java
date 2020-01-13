package dev.sgp.web;

import java.io.IOException;
import java.time.LocalDate;
import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dev.sgp.entite.Collaborateur;
import dev.sgp.service.CollaborateurService;
import dev.sgp.util.Constantes;

public class NouveauCollaborateursController extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CollaborateurService collabService = Constantes.COLLAB_SERVICE;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/collab/nouveauCollaborateurs.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String nom = req.getParameter("nom");
		String prenom = req.getParameter("prenom");
		String dateNaissance= req.getParameter("dateNaissance");
		String adresse = req.getParameter("adresse");
		String numeroSecu = req.getParameter("numeroSecu");
		
		boolean valid = true;
		
		
			if("".equals(nom)|| nom==null){
				req.setAttribute("erreurNom", true);
				valid=false;
			}
			if("".equals(prenom)|| prenom==null){
				req.setAttribute("erreurPrenom", true);
				valid=false;
			}
			if("".equals(dateNaissance)|| dateNaissance==null){
				req.setAttribute("erreurDateNaissance", true);
				valid=false;
			}if("".equals(adresse)|| adresse==null){
				req.setAttribute("erreurAdresse", true);
				valid=false;
			}
			if("".equals(numeroSecu)|| numeroSecu==null ||numeroSecu.length()!=15 ){
				req.setAttribute("erreurNumeroSecu", true);
				valid=false;
			}
			
			
		if(valid==true){
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate dateN = LocalDate.parse(dateNaissance, formatter) ;
			int mat = collabService.listerCollaborateurs().size() + 1;
			ResourceBundle data = ResourceBundle.getBundle("application");				
			String suffixe = data.getString("email");
			
			Collaborateur collab = new Collaborateur();
			collab.setNom(nom);
			collab.setPrenom(prenom);
			collab.setDateNaissance(dateN);
			collab.setAdresse(adresse);
			collab.setNumeroSecu(numeroSecu);
			collab.setMatricule("M"+mat);
			collab.setEmailPro(prenom.toLowerCase()+"."+nom.toLowerCase()+"@"+suffixe);
			collab.setPhoto(req.getContextPath()+"/image/avatar.jpg");
			collab.setActif(true);
			collab.setDateHeureCreation(ZonedDateTime.now());

			collabService.sauvegarderCollaborateur(collab);			
			
			resp.setContentType("text/html");	
			req.setAttribute("collaborateurs", collabService.listerCollaborateurs());
			resp.sendRedirect(req.getContextPath()+"/collaborateurs/lister");
		}else{
		
			
			req.getRequestDispatcher("/WEB-INF/views/collab/nouveauCollaborateurs.jsp").forward(req, resp);
			resp.setStatus(400);
		}
		
	}
}
