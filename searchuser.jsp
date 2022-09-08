<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.ProcessBuilder.Redirect" %>
<%@ page import="javax.swing.*" %>
<html>
<HEAD>
    <TITLE>Admin dash </TITLE>
    <link rel=stylesheet href=adminstyle.css>
</HEAD>
<Body>
<br>

<%         
         
        
        try {
            
            String userid = request.getParameter("userid");
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/rsm";
            Connection con = DriverManager.getConnection(url, "root", "root");
            String query = "select * from orders where username=?" ;
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, userid);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
            {
%>
    <table>
        <tr>
            <th>Order Id</th>
            <th>Package</th>
            <th>Model</th>
            <th>Cpu</th>
            <th>Gpu</th>
            <th>HDD</th>
            <th>RAM</th>
            <th>Body</th>
            <th>Paint</th>
            <th>Display</th>
            <th>Wash</th>
            <th>Status</th>
            <th>User</th>
        </tr>
<%
        rs.previous();
            }
        else{
%>
<h1>No Record Found<h1>
<%            
        }

    while (rs.next()) {
                String package1 = rs.getString("package");
                String model = rs.getString("model");
                String cpu = rs.getString("cpu");
                String gpu = rs.getString("gpu");
                String hdd = rs.getString("hdd");
                String ram = rs.getString("ram");
                String body = rs.getString("body");
                String paint = rs.getString("paint");
                String display = rs.getString("display");
                String wash = rs.getString("wash");
                String status = rs.getString("status");
                String username = rs.getString("username");
                int orderid  = rs.getInt("orderid");

%>
    <tr>
        <th><%=orderid%></th>
        <th><%=package1%></th>
        <th><%=model%></th>
        <th><%=cpu%></th>
        <th><%=gpu%></th>
        <th><%=hdd%></th>
        <th><%=ram%></th>
        <th><%=body%></th>
        <th><%=paint%></th>
        <th><%=display%></th>
        <th><%=wash%></th>
        <th><%=status%></th>
        <th><%=username%></th>
    </tr>
<% } %>
</table><br><br>
<a href="http://localhost:8080/project/admindash.jsp"><button> Go back </button> </a>   
            

<%

    }
    catch(Exception e)
    {
        out.println(e);
    }
    finally {
        out.println("</body>");
        out.println("<html>");
        out.close();
    }

%>



</body>
</html>