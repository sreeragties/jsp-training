<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<title>Salary Management Application</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>

<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #655D8A">
			<div>
				
					Salary Management App </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header>
	<br>

	<div class="row">
		<div class="container">
			<h3 class="text-center">List of Users</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success ">Add
					New User</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Salary</th>
						<th>Department</th>
						<th>Address</th>
						<th>Phone Number</th>
					</tr>
				</thead>
				<tbody>
					<!--   for (Todo todo: todos) {  -->
					<c:forEach var="user" items="${listUser}">

						<tr>
							<td class="text-center align-middle"><c:out
									value="${user.id}" /></td>
							<td class="text-center align-middle"><c:out
									value="${user.name}" /></td>
							<td class="text-center align-middle"><c:out
									value="${user.salary}" /></td>
							<td class="text-center align-middle"><c:out
									value="${user.department}" /></td>
							<td class="text-center align-middle"><c:out
									value="${user.address}" /></td>
							<td class="text-center align-middle"><c:out
									value="${user.phone}" /></td>
							<td><a class="btn btn-primary btn-block "
								href="edit?id=<c:out value='${user.id}' />">Edit </a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a class="btn btn-danger btn-block "
								href="delete?id=<c:out value='${user.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
					<!-- } -->
				</tbody>

			</table>
		</div>
	</div>
</body>

</html>