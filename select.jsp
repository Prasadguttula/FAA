<!DOCTYPE html>
<html>
<head>
	<title>Transactions</title>
	<style type="text/css">
		#transctions{font-family: cursive;}
  caption {font-family: Cooper Black;font-size: 25px;}
  table {width: cover;border-style: outset;margin-left: 10px;margin-bottom: 20px;}
  th{color:navy blue;}
  b{font-family: Cooper Black;margin-right: 20px;font-size: 20px;color: navy  blue;}
	</style>
</head>
<body>
<div id="transactions" align="center">
  <%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:prasad");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT bid, dbo_transactions.pid,brand,cat,type,price,qty,price*qty from dbo_transactions,dbo_products where"+" dbo_transactions.pid=dbo_products.pid;");
%>
<table bordercolor='navyblue' cellpadding="10" cellspacing="10">
  <caption>All Transactions</caption>
<tr><th>Bill NO.</th><th>Product ID</th><th>BRAND</th><th>Categories</th><th>type</th><th>Price</th><th>Quantity</th><th>Total Bill(Per each)</th></tr><tr>
<%while(rs.next())
{
%>
<td><%= rs.getInt(1)%></td>
<td><%= rs.getString(2)%></td>
<td><%= rs.getString(3)%></td>
<td><%= rs.getString(4)%></td>
<td><%= rs.getString(5)%></td>
<td>Rs. <%= rs.getInt(6)%>/-</td>
<td><%= rs.getInt(7)%></td>
<td>Rs.<%= rs.getInt(8)%>/-</td>
</tr>
<%
}
%>
</table>
<%
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
<div align="center">
  <%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
Connection con=DriverManager.getConnection("jdbc:odbc:prasad");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT SUM(total) from (SELECT  bid,dbo_transactions.pid, brand, cat, type, price, qty,(price*qty) as total"+"    FROM dbo_transactions, dbo_products WHERE dbo_transactions.pid=dbo_products.pid) as new1;");
%>

<b>Total Bill(till now) :</b>
<%
while(rs.next())
{
%>
Rs.<%= rs.getInt(1)%>.00/-


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
