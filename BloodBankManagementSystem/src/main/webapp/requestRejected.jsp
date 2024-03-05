<%@ page import="Project.ConnectionProvider" errorPage="errorPage.jsp"%>
<%@ page import="java.sql.*" %>
<%@include file="header.html"%>
<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<%
     response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
     response.setHeader("Expires", "0");
     if(session.getAttribute("username")==null){
    	 response.sendRedirect("adminLogin.jsp");
     }
%>
<br>
<center>
<table id="customers">
<tr>
<th><center>ID</center></th>
<th><center>Name</center></th>
<th><center>Mobile Number</center></th>
<th><center>Email</center></th>
<th><center>Blood Group</center></th>
</tr>
<tr>
<%
try{
	Connection con = ConnectionProvider.getCon();
	Statement st= con.createStatement();
	ResultSet rs=st.executeQuery("select  *from bloodrequest where status= 'rejected'");
	while(rs.next())
	{
%>
<td><center>4RB03- 30<%=rs.getString(1)%> -84</center>
<td><center><%=rs.getString(2) %></center>
<td><center><%=rs.getString(3) %></center>
<td><center><%=rs.getString(4) %></center>
<td><center><%=rs.getString(5) %></center>
</tr>
<%		
	}
}
catch(Exception e){
	System.out.println(e);
}
%>
</table>
</center>
</body>
</html>