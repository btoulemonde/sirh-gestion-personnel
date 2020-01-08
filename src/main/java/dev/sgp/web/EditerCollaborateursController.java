package dev.sgp.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EditerCollaborateursController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String matricule = req.getParameter("matricule");
		String titre = req.getParameter("titre");
		String nom = req.getParameter("nom");
		String prenom = req.getParameter("prenom");

		List<String> parametres = new ArrayList<>();

		parametres.add(matricule);
		parametres.add(titre);
		parametres.add(nom);
		parametres.add(prenom);

	
			
			if (matricule == null || "".equals(matricule)) {
				resp.setStatus(400);
				resp.getWriter().write("un matricule etait attendu");

			} else {
				resp.setStatus(201);
				resp.getWriter()
						.write("<h1>Edition de collaborateur</h1>" + "<ul><li>matricule : " + matricule
								+ "</li><li>titre : " + titre + "</li><li>nom : " + nom + "</li><li>prenom : " + prenom
								+ "</li></ul>");
			}
		
	}
}
