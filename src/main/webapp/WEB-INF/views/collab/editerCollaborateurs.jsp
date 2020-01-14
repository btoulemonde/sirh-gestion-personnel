<%@page import="dev.sgp.entite.Collaborateur"%>
<%@page import="dev.sgp.entite.Departement"%>
<%@page import="dev.sgp.util.Constantes"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SGP - editer collaborateur</title>
<link rel="stylesheet"
	href="<c:url value="/bootstrap-4.4.1/dist/css/bootstrap.css"/>">
</head>



<body>
	<div class="countainer">
		<nav class="navbar navbar-expand-lg navbar-light bg-light"> <a
			class="navbar-brand" href="#"> <img
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
	</div>
	<c:set var="collab" value="${requestScope.collaborateur}" />

	<div class="countainer px-5">
		<div class="row">
			<div class="col-8 col-lg-5 offset-2  ">
				<h1>
					<c:out value="${collab.nom }" />
					-
					<c:out value="${collab.prenom }" />
					-
					<c:out value="${collab.matricule }" />

				</h1>

			</div>
			<div class="col-2  offset-8 align-self-center">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value=""
						id="desactiver" name="desactiver"> <label
						class="form-check-label" for="desactiver"> Désactiver </label>
				</div>
			</div>
		</div>


		<div class="countainer-fluid px-1">
			<form class="form-group" method="post" action="">
				<div class="media">
					<img src="<c:out value="${collab.photo }"/>"
						class="align-self-start  mr-3 img-thumbnail">
					<div class="media-body">


						<div class="accordion" id="accordionExample">
							<div class="card">
								<div class="card-header" id="headingOne">
									<h2 class="mb-0">
										<button class="btn " type="button" data-toggle="collapse"
											data-target="#collapseOne" aria-expanded="true"
											aria-controls="collapseOne">Identité</button>
									</h2>
								</div>

								<div id="collapseOne" class="collapse show"
									aria-labelledby="headingOne" data-parent="#accordionExample">
									<div class="card-body">

										<div class="row">
											<div class="col-12 col-lg-4 offset-1">
												<div class="form-group">
													<label for="civilité">Civilité</label>
												</div>
											</div>
											<div class="col-12 col-lg-4 form-group">
												<select name="genre" class="form-control" id="civilité">
													<option>Madame</option>
													<option>Monsieur</option>
												</select>
											</div>
										</div>
										<div class="row">
											<div class="col-12 col-lg-4 offset-1">
												<label for="nom">Nom</label>
											</div>
											<div class="col-12 col-lg-4 form-group">
												<input type="text" id="nom" disabled="disabled"
													value="<c:out value="${collab.nom }"/>"
													class="form-control">
											</div>
										</div>
										<div class="row">
											<div class="col-12 col-lg-4 offset-1">
												<label for="prenom">Prenom</label>
											</div>
											<div class="col-12 col-lg-4 form-group">
												<input type="text" id="prenom" disabled="disabled"
													value="<c:out value="${collab.prenom }"/>"
													class="form-control">
											</div>
										</div>
										<div class="row">
											<div class="col-12 col-lg-4 offset-1">
												<label for="dateNaissance">Date de naissance</label>
											</div>
											<div class="col-12 col-lg-4 form-group">
												<input type="text" id="dateNaissance" disabled="disabled"
													value="<c:out value="${collab.dateNaissance }"/>"
													class="form-control">
											</div>
										</div>
										<div class="row">
											<div class="col-12 col-lg-4 offset-1">
												<label for="adresse">Adresse</label>
											</div>
											<div class="col-12 col-lg-4 form-group">
												<textarea input type="text" name="adresse" id="adresse"
													value="" class="form-control"><c:out
														value="${collab.adresse }" />
                                                </textarea>
											</div>
										</div>
										<div class="row">
											<div class="col-12 col-lg-4 offset-1">
												<label for="numeroSecu">Numéro de sécurité sociale</label>
											</div>
											<div class="col-12 col-lg-4 form-group">
												<input type="number" id="numeroSecu" class="form-control"
													disabled="disabled"
													value="<c:out value="${collab.numeroSecu }"/>">
											</div>
										</div>

									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header" id="headingTwo">
									<h2 class="mb-0">
										<button class="btn collapsed" type="button"
											data-toggle="collapse" data-target="#collapseTwo"
											aria-expanded="false" aria-controls="collapseTwo">
											Poste</button>
									</h2>
								</div>
								<div id="collapseTwo" class="collapse" aria-labelledby="poste"
									data-parent="#accordionExample">
									<div class="card-body">

										<div class="row">
											<div class="col-12 col-md-4 offset-1">
												<div class="form-group">
													<label for="exampleFormControlSelect1">Département</label>
												</div>
											</div>
											<div class="col-12 col-lg-4 form-group">
												<select name="departement" class="form-control"
													id="exampleFormControlSelect1">
													<c:choose>
														<c:when test="${collab.departement.nom == null}">

															<c:forEach items="${departements}" var="dep">
																<option><c:out value=' ${dep.nom} ' /></option>
															</c:forEach>
														</c:when>
														<c:otherwise>
															<c:forEach items="${departements}" var="dep">
																<c:choose>
																	<c:when test="${collab.departement.nom == dep.nom}">
																		<option selected><c:out
																				value=' ${collab.departement.nom} ' />
																		</option>
																	</c:when>
																	<c:otherwise>
																		<option><c:out value=' ${dep.nom} ' /></option>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</select>
											</div>
										</div>
										<div class="row">
											<div class="col-12 col-lg-4 offset-1">
												<label for="nom">Nom</label>
											</div>
											<div class="col-12 col-lg-4 form-group">
												<input
													<c:if test="${collab.intitulePoste != null }">
												value="<c:out value="${collab.intitulePoste }"/>"
												</c:if>
													type="text" id="nom" name="poste" class="form-control">
											</div>
										</div>

									</div>
								</div>
							</div>
							<div class="card">
								<div class="card-header" id="headingThree">
									<h2 class="mb-0">
										<button class="btn collapsed" type="button"
											data-toggle="collapse" data-target="#collapseThree"
											aria-expanded="false" aria-controls="collapseThree">
											Coordonnées bancaires</button>
									</h2>
								</div>
								<div id="collapseThree" class="collapse"
									aria-labelledby="Coordonnées" data-parent="#accordionExample">
									<div class="card-body">

										<div class="row">
											<div class="col-12 col-lg-4 offset-1">
												<label for="iban">IBAN</label>
											</div>
											<div class="col-12 col-lg-4 form-group">
												<input
													<c:if test="${collab.iban != null }">
												value="<c:out value="${collab.iban }"/>"
												</c:if>
													type="text" id="iban" name="iban" class="form-control">
											</div>
										</div>
										<div class="row">
											<div class="col-12 col-lg-4 offset-1">
												<label for="bic">BIC</label>
											</div>
											<div class="col-12 col-lg-4 form-group">
												<input
													<c:if test="${collab.bic != null }">
												value="<c:out value="${collab.bic }"/>"
												</c:if>
													type="text" id="bic" name="bic" class="form-control">
											</div>
										</div>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col offset-10">
						<button type="submit" class="btn btn-secondary">Confirmer</button>
					</div>
				</div>

			</form>
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