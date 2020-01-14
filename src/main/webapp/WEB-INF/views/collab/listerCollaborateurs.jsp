<%@page import="dev.sgp.util.Constantes"%>
<%@page import="dev.sgp.entite.Departement"%>
<%@page import="dev.sgp.entite.Collaborateur"%>
<%@page import="java.util.List"%>
<%@ page language="java" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SGP - App</title>
<link rel="stylesheet"
	href="<c:url value="/bootstrap-4.4.1/dist/css/bootstrap.css"/>">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#"> <img
			src="<c:url value="/image/logo.jpg"/>" width="30" height="30" alt="">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				<li class="nav-item active"><a class="nav-link"
					href="<c:url value="lister"/>">Collaborateurs <span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="stats.html">Statistiques</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="activites.html">Activités</a>
				</li>
			</ul>
		</div>
	</nav>

	<div class="coutainer-fluid px-5  mt-3 mb-5 ">
		<div class="row">
			<div class="col offset-9">
				<a href="<c:url value="nouveau"/>"
					class="btn btn-secondary btn-sm active" role="button"
					aria-pressed="true">Ajouter un nouveau collaborateur</a>
			</div>
		</div>
		<div class="row">

			<div class="col-6 ">
				<h1>Les collaborateurs</h1>
			</div>
		</div>
	</div>

	<div class="coutainerfluid px-5  mt-3">
		<form>
			<div class="row ml-3 mt-3 ">
				<div class="col-12  col-lg-4  ">
					<fieldset disabled>
						<div class="form-group row">
							<label for="nomPrenom">Rechercher un nom ou un prénom qui
								commence par:</label>
						</div>
				</div>
				<div class="col-12  col-md-3 mb-1 ">
					<input type="text" id="nomPrenom" action="" name="chercher"
						class="form-control">
				</div>
				<div class=" col-10 col-md-2 ">
					<button type="submit" class="btn btn-secondary">Rechercher</button>
					</fieldset>
				</div>
				<div class=" col-12  col-lg-3  mt-3 ">
					<div class="form-group row">
						<div class="form-check">
							<input class="form-check-input" type="checkbox"
								id="disabledFieldsetCheck"> <label
								class="form-check-label" for="disabledFieldsetCheck">
								Voir les collaborateurs désactivés </label>
						</div>
					</div>

				</div>
			</div>
			<div class="row ml-3">
				<div class="col-8  col-lg-4 ">
					<div class="form-group row">
						<label for="exampleFormControlSelect2">Filtrer par
							département: </label>

					</div>
				</div>
				<div class="col-8  col-lg-4 ">
					<select name="departement" class="form-control">

						<option>Tous</option>

						<c:forEach items="${departements}" var="dep">
							<option value="<c:out value=' ${dep.nom} ' />"><c:out
									value=' ${dep.nom} ' /></option>
						</c:forEach>

					</select>

				</div>
			</div>
		</form>
	</div>



	<div class="coutainer px-5">
		<div class="row mt-3 ">

			<c:forEach items="${collaborateurs }" var="collab">


				<div class="col-12 col-sm-6 col-xl-4 mt-3">
					<div class="card  ">
						<div class="card-header">
							<c:out value="${collab.nom}" />
							-
							<c:out value="${collab.prenom }" />
						</div>
						<div class="card-body">
							<div class="media">
								<img src="<c:out value='${collab.photo}'/>"
									class="align-self-center img-thumbnail " width="80" height="80">
								<div class="media-body">

									<ul>
										<li>Fonction: <c:out value="${ collab.intitulePoste}" />
										</li>
										<li>Département: <c:out
												value="${ collab.departement.nom}" />
										</li>
										<li>Email: <c:out value="${collab.emailPro }" /></li>
										<li>Téléphone: XXXXXXXX</li>
									</ul>
								</div>
							</div>

						</div>
						<div class="card-footer">
							<div class="col offset-9 ">
								<a href="<c:url value="editer?matricule=${collab.matricule }"/>"
									class="btn btn-secondary btn-sm" disabled>Editer</a>
							</div>
						</div>
					</div>

				</div>

			</c:forEach>
		</div>




		<!-- TODO -->
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