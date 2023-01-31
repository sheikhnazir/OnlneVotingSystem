<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Map" %>
<%@page import="java.util.HashMap" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome Admin!</title>
<link rel="stylesheet" type="text/css" href="style.css"> 
 <%
   
    String a[] = new String[100];
    Map<String, Integer> partyVotes = new HashMap<>();
    Class.forName("com.mysql.cj.jdbc.Driver");
	java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineVotingDB","root","MyNewPass");
	
	PreparedStatement preparedStatement = con.prepareStatement("select partie,count(partie) as c from vote group by partie");
	ResultSet rs=((java.sql.Statement) preparedStatement).executeQuery("select partie,count(partie) as c from vote group by partie");
	
    int i=0;
    while(rs.next()){
    	String party = rs.getString("partie");
    	int votes = rs.getInt("c");
    	partyVotes.put(party, votes);
        // a[i] = rs.getString("c");
        // i++;
    }
    %>
</head>
<%@ include file="adminNavbar.jsp"%> 
<body>
<div class="checkTable">
<table>
<tr>
<th>
Parties
</th>
<th>
Names
</th>
<th>
Votes
</th>
</tr>
<tr>
<td>
<img src="images/Aap.jpg" class="sym" alt="AAP"> 
</td>
<td>AAP</td>
<td><%=partyVotes.get("Aam Aadmi Party")%></td>
</tr>
<tr> 
<td> 
<img src="images/bjp.jpg" class="sym" alt="BJP"> 
</td>
<td>BJP</td>
<td><%=partyVotes.get("BJP")%></td>
</tr>
<tr>
<td>
<img src="images/bsp.jpg" class="sym" alt="BSP">
</td>
<td>BSP</td>
<td><%=partyVotes.get("BSP")%></td>
</tr>
<tr>
<td> 
<img src="images/congress.png" class="sym" alt="Congress">
</td>
<td>Congress</td>
<td><%=partyVotes.get("Congress")%></td>
</tr>
<tr>
<td>
<img src="images/CPI-banner.jpeg" alt="CPI">
</td>
<td>CPI</td>
<td><%=partyVotes.get("CPI")%></td>
</tr>
</table>
</div>
</body>
</html>