<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
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
    #total {display: none;}
    caption {font-family: Cooper Black}
    button {border:0;font-family: Cooper Black;height: 50px;background-color: inherit;}
  table {width: 600px;border-style: outset;margin-left: 10px;margin-bottom: 20px;border-color: navy blue;}
  </style>
  <script type="text/javascript">
    function show()
    {
      var elmt=document.getElementById('total');
      elmt.style.display='block';
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
      <a class="navbar-brand" href="#">Logo</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">Dashboard</a></li>
    
        <li><a href="#">Make payment</a></li>
        <li><a href="#">My transactions</a></li>
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
    
        <li><a href="#section2">Make payment</a></li>
        <li><a href="#section3">My transactions</a></li>
      </ul><br>
    </div>
    <br>
    
    <div class="col-sm-9">
      <div class="well">
        <h4>Dashboard</h4>
        <p>Some text..</p>
      </div>
      <div class="row">
        <div class="col-sm-4">
          <div class="well">
            <h4><center><button onclick="show()">total stock</button></center></h4> 
          </div>
        </div>
        <div class="col-sm-4">
          <div class="well">
            <h4><center><a href="newindex.jsp?p=1"><button>Present Availability</button></center></h4> 
          </div>
        </div>
       <div class="col-sm-4">
          <div class="well">
            <h4><center><button onclick="show3()">Analysis</button></center></h4> 
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-12">
          <div class="well">
            <div id="total">
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
<table cellpadding="10" cellspacing="10" align="center">
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
</div>
<div >
  <%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
String set=request.getParameter("p");
out.println(set);
if(strcmp(set,'1'))
{
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:prasad");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select pid,brand,cat,type,price from dbo_products");
%>
<table bordercolor='navyblue' cellpadding="10" cellspacing="10">
  <caption>Brand models availability:</caption>
<tr><th>ID</th><th>BRAND</th><th>Categories</th><th>type(GENDER)</th><th>Price</th><tr>
<%while(rs.next())
{
%>
<td><%= rs.getInt(1)%></td>
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
}
%>
</div>
          </div>
        </div>
        
      </div>
      
    </div>
  </div>
</div>

</body>
</html>
