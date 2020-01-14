<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SGP - nouveau creer collaborateur</title>
<link rel="stylesheet" href="<c:url value="/bootstrap-4.4.1/dist/css/bootstrap.css"/>">
</head>
<body>

	<div class="countainer">
		<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
			class="navbar-brand" href="#"> <img
			src="<c:url value="/image/logo.jpg"/>" width="30"
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
					href="<c:url value="lister"/>">Collaborateurs
						<span class="sr-only">(current)</span>
				</a></li>
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
					<c:choose>
						<c:when test="${erreurNom != null }">
							<input type="text" class="form-control is-invalid" id="nom"
								name="nom" aria-describedby="inputGroupPrepend3" required>
							<div class="invalid-feedback">le nom est obligatoire</div>
						</c:when>
						<c:otherwise>
							<input type="text" name="nom" id="nom" class="form-control"
								<c:if test="${nom != null }">
						value="<c:out value="${nom }"/>"
						</c:if>>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row">
				<div class="col-8 col-sm-2 offset-2">
					<label for="prenom">Prenom</label>
				</div>
				<div class=" col-8 col-sm-4 form-group">
					<c:choose>
						<c:when test="${erreurPrenom != null }">
							<input type="text" class="form-control is-invalid" id="prenom"
								name="prenom" aria-describedby="inputGroupPrepend3" required>
							<div class="invalid-feedback">le prenom est obligatoire</div>
						</c:when>
						<c:otherwise>
							<input type="text" name="prenom" id="prenom" class="form-control"
								<c:if test="${prenom != null }">
						value="<c:out value="${prenom }"/>"
						</c:if>>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row">
				<div class="col-8 col-sm-2 offset-2">
					<label for="prenom">Date de Naissance</label>
				</div>
				<div class=" col-8 col-sm-4 form-group">
					<c:choose>
						<c:when test="${erreurDateNaissance != null }">
							<input type="date" class="form-control is-invalid" id="dateNaissance"
								name="dateNaissance" aria-describedby="inputGroupPrepend3" required>
							<div class="invalid-feedback">le prenom est obligatoire</div>
						</c:when>
						<c:otherwise>
							<input type="date" name="dateNaissance" id="prendateNaissanceom" class="form-control"
								<c:if test="${dateNaissance != null }">
						value="<c:out value="${dateNaissance }"/>"
						</c:if>>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row">
				<div class="col-8 col-sm-2 offset-2">
					<label for="adresse">Adresse</label>
				</div>
				<div class="  col-8 col-sm-4 form-group">
					<c:choose>
						<c:when test="${erreurAdresse != null }">
							<textarea input class="form-control is-invalid" id="adresse"
								name="adresse" aria-describedby="inputGroupPrepend3" rows="3"
								required></textarea>
							<div class="invalid-feedback">L'adresse est obligatoire</div>
						</c:when>
						<c:otherwise>
							<textarea input type="text" name="adresse" id="adresse"
								class="form-control" rows="3">
                    				<c:if test="${adresse != null }">
										<c:out value="${adresse }" />"
									</c:if>
						</textarea>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row">
				<div class="col-8 col-sm-2 offset-2">
					<label for="numeroSecu">Numéro de sécurité sociale</label>
				</div>
				<div class=" col-8 col-sm-4 form-group">
					<c:choose>
						<c:when test="${erreurNumeroSecu != null }">
							<input type="text" class="form-control is-invalid"
								id="numeroSecu" name="numeroSecu"
								aria-describedby="inputGroupPrepend3" required>
							<div class="invalid-feedback">le numéro de sécurité sociale
								doit contenir 15 chiffres</div>
						</c:when>
						<c:otherwise>
							<input type="text" name="numeroSecu" id="numeroSecu"
								class="form-control"
								<c:if test="${numeroSecu != null }">
						value="<c:out value="${numeroSecu }"/>"
						</c:if>>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="row">
				<div class="col-2 offset-7">
					<button type="submit" class="btn btn-primary">Confirmer</button>
				</div>
			</div>
		</form>
	</div>



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