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
<table border=1 bordercolor='navyblue' cellpadding="10" cellspacing="10">
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