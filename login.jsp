<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<%@include file="all_js_css.jsp"%>
<style type="text/css">
h1 {
	text-align: center;
	color: black;
	font-family: "Times New Roman", Times, serif;
}

body {
	align: center;
}

.button2 {
	background-color: #b3b3cc;
	border-radius: 12px;
	border: none;
	color: black;
	padding: 7px 30px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
}
</style>
</head>
<body>
	<%@include file="navbar2.jsp"%>
	<div class="container-fluid div-color">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card mt-4">
					<div class="card-header text-center text-black bg-custom">
						<i class="fa fa-user-plus fa-3x" aria-hidden="true"></i>
						<h4>Login</h4>
					</div>



					<%
					String withoutLogin = (String) session.getAttribute("login-failed");

					if (withoutLogin != null) {
					%>
					<div class="alert alert-danger" role="alert"><%=withoutLogin%></div>

					<%
					session.removeAttribute("login-failed");
					}
					%>


					<div class="card-body">
						<form action="loginServlet" method="post">

							<div class="form-group">
								<label>Enter Email Id:</label> <input type="email"
									class="form-control" id="exampleInputEmail1" aria=describedly=
									"emailHelp" placeholder="email id" name="uemail">
							</div>

							<div class="form-group">
								<label>Enter Password:</label> <input type="password"
									class="form-control" id="exampleInputPassword1"
									placeholder="password" name="upassword">
							</div>

							<button type="submit" class="button button2">Submit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>