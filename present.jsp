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
<table border=1 bordercolor='navyblue' cellpadding="10" cellspacing="10">
<tr><th>Brand</th><th>Availability</th><tr>
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