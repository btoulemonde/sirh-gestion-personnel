<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SGP - nouveau creer collaborateur</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/bootstrap-4.4.1/dist/css/bootstrap.css">
</head>
<body>

	<div class="countainer">
		<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
			class="navbar-brand" href="#"> <img
			src="<%=request.getContextPath()%>/image/logo.jpg" width="30"
			height="30" alt="">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="index.html">Collaborateurs <span class="sr-only">(current)</span></a>
				</li>
				<li class="nav-item"><a class="nav-link" href="stats.html">Statistiques</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="activites.html">Activités</a>
				</li>
			</ul>
		</div>
		</nav>
	</div>

	<div class="countainer px-5">
		<div class="row">
			<div class="col-4 ">
				<h1>Nouveau Collaborateur</h1>
			</div>
		</div>
	</div>

	<div class="coutainer px-5">
		<form class="form-group" method="post" action="">
			<div class="row">
				<div class="col-8 col-sm-2 offset-2 ">
					<label for="nom">Nom</label>
				</div>
				<div class="  col-8 col-sm-4 form-group">
					<input type="text" name="nom" id="nom" class="form-control">
					<%
						if (request.getAttribute("erreurNom") != null) {
					%>

					<div class="text-danger">Le nom est obligatoire</div>


					<%
						}
					%>
				</div>
			</div>
			<div class="row">
				<div class="col-8 col-sm-2 offset-2">
					<label for="prenom">Prenom</label>
				</div>
				<div class=" col-8 col-sm-4 form-group">
					<input type="text" name="prenom" id="prenom" class="form-control">
					<%
						if (request.getAttribute("erreurPrenom") != null) {
					%>

					<div class="text-danger">Le prenom est obligatoire</div>


					<%
						}
					%>
				</div>
			</div>
			<div class="row">
				<div class="col-8 col-sm-2 offset-2">
					<label for="dateNaissance">Date de naissance</label>
				</div>
				<div class=" col-8 col-sm-4 form-group">
					<input type="date" name="dateNaissance" id="dateNaissance"
						class="form-control">
					<%
						if (request.getAttribute("erreurDateNaissance") != null) {
					%>

					<div class="text-danger">La date de naissance est obligatoire</div>


					<%
						}
					%>
				</div>
			</div>
			<div class="row">
				<div class="col-8 col-sm-2 offset-2">
					<label for="adresse">Adresse</label>
				</div>
				<div class="  col-8 col-sm-4 form-group">
					<input name="adresse" class="form-control" placeholder="Adresse"
						type="textarea" id="Adresse">
					<%
						if (request.getAttribute("erreurAdresse") != null) {
					%>

					<div class="text-danger">L'adresse est obligatoire</div>


					<%
						}
					%>
				</div>
			</div>
			<div class="row">
				<div class="col-8 col-sm-2 offset-2">
					<label for="numeroSecu">Numéro de sécurité sociale</label>
				</div>
				<div class=" col-8 col-sm-4 form-group">
					<input type="number" name="numeroSecu" id="numeroSecu"
						class="form-control" placeholder="x-xx-xx-xxx-xxx-xx">
					<%
						if (request.getAttribute("erreurNumeroSecu") != null) {
					%>

					<div class="text-danger">Le numéro de sécurité sociale est
						obligatoire</div>


					<%
						} else {
					%>
					<div class="text-danger">Le numéro de sécurité sociale doit
						comporter 15 chiffres</div>
					<%
						}
					%>
				</div>
			</div>
			<div class="row">
				<div class="col-2 offset-7">
					<button type="submit" class="btn btn-primary">Confirmer</button>
				</div>
			</div>
		</form>




		<!-- Optional JavaScript -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
			integrity="sha384-
J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
			crossorigin="anonymous"></script>
		<script
			src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
			integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
			crossorigin="anonymous"></script>
		<script
			src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
			integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
			crossorigin="anonymous"></script>
</body>
</html>