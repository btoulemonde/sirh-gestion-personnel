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

		Map<String,String> parametres = new HashMap<String,String>();

		parametres.put("matricule",matricule);
		parametres.put("titre",titre);
		parametres.put("nom",nom);
		parametres.put("prenom",prenom);

		boolean parmExist = true;
		List<String> paramMissed = new ArrayList<>();
			for(String param:parametres.keySet()){
				if (parametres.get(param) == null || "".equals(parametres.get(param))) {
				resp.setContentType("text/html");
				resp.setStatus(400);
				parmExist = false;
				paramMissed.add(param);
				} 
			}
			
			if (parmExist == false){
				resp.getWriter().write("<p>Les paramètres suivants sont incorrects :</p>"+paramMissed.toString());
			}else {
				resp.setStatus(201);
				resp.getWriter()
						.write("<h1>Edition de collaborateur</h1>" + "<ul><li>matricule : " + matricule
								+ "</li><li>titre : " + titre + "</li><li>nom : " + nom + "</li><li>prenom : " + prenom
								+ "</li></ul>");
			}
	}
}
