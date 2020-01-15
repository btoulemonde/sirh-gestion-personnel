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

	<div class="countainer">
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
	</div>
	<div class="coutainer-fluid px-5  mt-3">
		<div class="row">
			<div class="col offset-9">
				<a href="<c:url value="nouveau"/>"
					class="btn btn-secondary btn-sm active" role="button"
					aria-pressed="true">Ajouter un nouveau collaborateur</a>
			</div>
		</div>
		<div class="row">

			<div class="col-6 ">
				<h1>Statistiques</h1>
			</div>
		</div>
	</div>

	<div class="countainer-fluid mt-3 px-5">
		<div class="row">
			<table class="table table-bordered table table-striped">
				<thead class="thead-dark">
					<tr>
						<th scope="col">Chemin</th>
						<th scope="col">Nombre de visites</th>
						<th scope="col">Min (ms)</th>
						<th scope="col">Max (ms)</th>
						<th scope="col">Moyenne (ms)</th>
					</tr>
				</thead>
				 <tbody>
                <c:forEach var="visite" items="${listeVisites}">
                	<tr>
                		<td><c:out value="${visite.chemin }"/> </td>
                		<td></td>
                		<td></td>
                		<td></td>
                		<td><c:out value="${visite.tempsExecution }"/></td>
                	</tr>
                </c:forEach>
            </tbody>
			</table>
		</div>
	</div>


</body>
</html>