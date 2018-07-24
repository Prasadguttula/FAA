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
<tr><th>Product ID</th><th>Brand</th><th>Categories</th><th>Type(GENDER)</th><th>Quantity</th><tr>
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