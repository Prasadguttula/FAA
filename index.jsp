<!DOCTYPE html>
<html lang="en">
<head>
  <title>HOME</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 550px}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
        
    /* On small screens, set height to 'auto' for the grid */
    @media screen and (max-width: 767px) {
      .row.content {height: auto;} 
    }
    li{
    font-size:15pt;
    }
input[type=text] {
    width: 200px;
    box-sizing: border-box;
    border: 2px solid #ccc;
    border-radius: 4px;
    font-size: 16px;
    background-color: white;
    background-image: url('searchicon.png');
    background-position: 10px 10px; 
    background-repeat: no-repeat;
    padding: 12px 20px 12px 40px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

input[type=text]:focus {
    width: 100%;
}
.a {
    background-color: light blue; /* Green */
    border: none;
    color: white;
    padding: 20px 45px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
.b {
    background-color: light blue /* Green */
    border: none;
    color: white;
    padding: 20px 45px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
.c {
    background-color: light blue; /* Green */
    border: none;
    color: white;
    padding: 20px 45px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
	position:relative;
	left:20px;
}
.header img {
  float: left;
  width: 100px;
  height: 100px;
  background: #555;
}

.header h1 {
  position: relative;
  top: 18px;
  left: 10px;
}
a.hover{background-color: green;}
  #stock{float: left;font-family: cursive;}
  #brands{float: left;font-family: cursive;}
  #analysis{float: left;font-family: cursive;}
  #transctions{float: left;font-family: cursive;}
  caption {font-family: Cooper Black}
  table {width: 800px;border-style: outset;margin-left: 10px;margin-bottom: 20px}  
  </style>
  <script type="text/javascript">
  	function show() {
  		// body...
  		var elmt1=document.getElementById('brands');
        var elmt2=document.getElementById('analysis');
        elmt2.style.display='none';
  		elmt1.style.display='block';
  	}
   function analyze() {
  		// body...
  		var elmt3=document.getElementById('brands');
  		var elmt4=document.getElementById('analysis');
        elmt3.style.display='none'; 
  		elmt4.style.display='block';
  		
  	}
  </script>
</head>
<body>

<nav class="navbar navbar-inverse visible-xs">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="">Logo<img src="viewlogo.PNG"/></a>
    </div>
<div class="header">
  <h1>footwear store management</h1>
</div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Dashboard</a></li>
    
        
        <li><a href="select.jsp" target="_blank">My transactions</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav hidden-xs">
      <h2>Logo</h2>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="#section1">Dashboard</a></li>
    
        
        <li><a href="select.jsp" target="_blank">My transactions</a></li>
      </ul><br>
    </div>
    <br>
    
    <div class="col-sm-9">
      <div class="well">
        <h1 style="font-family: Cooper Black;" align="center"><font color="blue">Footstore Product Availability</font></h1>
      </div>
     </div>
  <div id="stock">   
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:prasad");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT SUM(COUNT) from dbo_catalog");
%>
<table bordercolor='navyblue' cellpadding="10" cellspacing="10">
<tr><th>Total Stock Available</th><tr>
<%while(rs.next())
{
%>
<td><%= rs.getInt(1)%></td>
</tr>
<%
}
rs.close();
st.close();
con.close();
}
catch(Exception e)
{
out.println("error"+e);
}

%>
<br>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:prasad");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT brand,SUM(count) from dbo_products,dbo_catalog  where dbo_products.pid=dbo_catalog.pid  group by brand");
%>
<table  bordercolor='navyblue' cellpadding="10" cellspacing="10">
	<caption>Present available:</caption>
<tr><th>Brand</th><th>Availability</th></tr><tr>
<%while(rs.next())
{
%>
<td><%= rs.getString(1)%></td>
<td><%= rs.getInt(2)%></td>
</tr>
<%
}
rs.close();
st.close();
con.close();
}
catch(Exception e)
{
out.println("error"+e);
}

%>
</div> 
<br>
<div id="brands">		
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:prasad");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select pid,brand,cat,type,price from dbo_products");
%>
<table bordercolor='navyblue' cellpadding="10" cellspacing="10">
	<caption>Brand models availability:</caption>
<tr><th>ID</th><th>BRAND</th><th>Categories</th><th>type(GENDER)</th><th>Price</th></tr><tr>
<%while(rs.next())
{
%>
<td><%= rs.getInt(1)%></td>
<td><%= rs.getString(2)%></td>
<td><%= rs.getString(3)%></td>
<td><%= rs.getString(4)%></td>
<td>Rs.<%= rs.getInt(5)%>/-</td>
</tr>
<%
}
rs.close();
st.close();
con.close();
}
catch(Exception e)
{
out.println("error"+e);
}

%>
</div>
<div id="analysis">
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:prasad");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT dbo_transactions.pid,brand,cat,type,qty FROM dbo_products, dbo_transactions WHERE dbo_products.pid=dbo_transactions.pid");
%>
<table  bordercolor='navyblue' cellpadding="10" cellspacing="10">
	<caption>Analysis(Total stock sold till now):</caption>
<tr><th>Product ID</th><th>Brand</th><th>Categories</th><th>Type(GENDER)</th><th>Quantity</th></tr><tr>
<%while(rs.next())
{
%>
<td><%= rs.getString(1)%></td>
<td><%= rs.getString(2)%></td>
<td><%= rs.getString(3)%></td>
<td><%= rs.getString(4)%></td>
<td><%= rs.getInt(5)%></td>
</tr>
<%
}
rs.close();
st.close();
con.close();
}
catch(Exception e)
{
out.println("error"+e);
}

%>
</div>

</body>
</html>