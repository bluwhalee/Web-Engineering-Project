<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.ProcessBuilder.Redirect" %>
<%@ page import="javax.swing.*" %>

<html>
<HEAD>
    <TITLE>Admin dash </TITLE>
    <link rel=stylesheet href="adminstyle.css">
</HEAD>
<Body style="font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">
<br>

<%    
        session = request.getSession();
        Integer a = (Integer)session.getAttribute("alogin");
        if ( a != (Integer) 1){
            response.sendRedirect("http://localhost:8080/project/adminlogin.jsp");

        }
        
        if((Integer)session.getAttribute("utype")==(Integer)0)
        {
%>
<h2>You are accessing with customer account, <a href="http://localhost:8080/project/adminlogin.jsp">login to admin</a> account<h2>
<%
            return;

        }
        

        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://127.0.0.1/rsm";
            Connection con = DriverManager.getConnection(url, "root", "root");
            Statement s = con.createStatement();
            String query = "select * from orders" ;
            ResultSet rs = s.executeQuery(query); 
%>
<%= session %>
    <table style="min-width:1240px">
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
    int total=0;
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
                if(package1.equals("Complete Repair"))
                {
                    total = total + 500;
                }
                if(package1.equals("Cosmic Repair"))
                {
                    total = total + 300;
                }

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
<h2>Total Revenue :- $<%= total %><h2>
<h2>Parts<h2><br>
<table>
        <tr>
            <th>Cpu</th>
            <th>Gpu</th>
            <th>HDD</th>
            <th>RAM</th>
            <th>Body</th>
            <th>Display</th>
        </tr>
<%
    
     query = "select * from parts" ;
     rs = s.executeQuery(query);
    rs.next();
    int cpu1 = (rs.getInt("cpu"));
    int gpu1 = (rs.getInt("gpu"));
    int hdd1 = (rs.getInt("hdd"));
    int ram1 = (rs.getInt("ram"));
    int body1 = (rs.getInt("body"));
    int display1 = (rs.getInt("display"));
    rs.previous();
%>
    <tr>
        <th><%=cpu1%></th>
        <th><%=gpu1%></th>
        <th><%=hdd1%></th>
        <th><%=ram1%></th>
        <th><%=body1%></th>
        <th><%=display1%></th>
    </table>
            <h1>Change Order Status<h1>
            <form action=changestatus action=post><input type=text name=orderid placeholder="Order id"><input type=text
                    name=status placeholder="New status"><input type=submit value="Change Status"></form><br>
             <h1>Complete Order<h1>
            <form action=completeorder action=post><input type=text name=orderid placeholder="Order id">
                <input type=submit value="Change Status"></form><br>
            <h1>Search user<h1>
            <form action="searchuser.jsp" action=post><input type=text name=userid placeholder="Enter User id"><input
                    type=submit value="Search"></form><br>
            <h1>Delete Order<h1>
                    <form action=deleteorder action=post><input type=text name=orderid placeholder="Enter order
                            id"><input type=submit value="Delete"></form>
            
</body>
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