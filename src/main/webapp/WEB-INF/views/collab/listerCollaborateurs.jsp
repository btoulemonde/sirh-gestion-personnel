<%@page import="dev.sgp.entite.Collaborateur"%>
<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>SGP - App</title>
		<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap-4.4.1/dist/css/bootstrap.css">
	</head>
	<body>
		<h1>Les collaborateurs</h1>
		<ul>
			<%
			List<Collaborateur> listeCollaborateurs = (List<Collaborateur>) request.getAttribute("listeNoms");
            for (Collaborateur collab : listeCollaborateurs) {
			%>
			<li><%=collab.getNom().toUpperCase()%></li>
			<li><%=collab.getPrenom()%></li>
			<li><%=collab.getAdresse()%></li>
			<li><%=collab.getNumeroSecu()%></li>
			<li><%=collab.getDateNaissance()%></li>
			<li><%=collab.getEmailPro()%></li>
			<li><%=collab.getDateHeureCreation()%></li>
			
			<%
				}
			%>
		</ul>
	</body>
	</html>