<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<title>User Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: 655D8A">
			<div>
				<a class="navbar-brand"> Salary Management App </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<form action="update" method="post">

					<caption>
						<h2>Edit User</h2>
					</caption>

					<c:if test="${user != null}">
						<input type="hidden" name="id"
							value="<c:out value='${user.id}' />" />
					</c:if>

					<fieldset class="form-group">
						<label>User Name</label> <input type="text"
							value="<c:out value='${user.name}' />" class="form-control"
							name="name" required="required">
					</fieldset>

					<fieldset class="form-group">
						<label>User Salary</label> <input type="text"
							value="<c:out value='${user.salary}' />" class="form-control"
							name="salary">
					</fieldset>

					<fieldset class="form-group">
						<label>User Department</label> <input type="text"
							value="<c:out value='${user.department}' />" class="form-control"
							name="department">
					</fieldset>

					<fieldset class="form-group">
						<label>User Address</label> <input type="text"
							value="<c:out value='${user.department}' />" class="form-control"
							name="address">
					</fieldset>

					<fieldset class="form-group">
						<label>User Phone</label> <input type="text"
							value="<c:out value='${user.phone}' />" class="form-control"
							name="phone">
					</fieldset>

					<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>

</html>