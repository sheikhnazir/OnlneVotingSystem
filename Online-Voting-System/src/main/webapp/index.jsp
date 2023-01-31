<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Voting System</title>
<link rel="stylesheet" type="text/css" href="style.css"> 
</head>
<%@ include file="navbar.jsp"%>
<body>
<div class="form-container" >

<form action="loginVoter" method="post">
<h3>Enter your Voter Card Number</h3>

<label for="voterNumber" class="form-elements form-label"><b>Voter ID</b></label>
<br>
<input name="voterNumber" id="voterNumber" class="form-elements form-input" type="text"/>
<br>
<button type="Submit" class="form-elements form-button">Login</button>
<br>
<a href="adminlogin.jsp" class="index-a">Admin</a>	
</form>

</div>
</body>
</html>