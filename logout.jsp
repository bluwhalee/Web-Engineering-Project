<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.ProcessBuilder.Redirect" %>
<%@ page import="javax.swing.*" %>
<html>
<HEAD>
    <TITLE>invalid </TITLE>
    <link rel=stylesheet href=adminstyle.css>
</HEAD>
<Body>
<br>

<%      
        session.removeAttribute("myorders");
        session.invalidate();
        response.sendRedirect("http://localhost:8080/project/index.html");
        
%>
</body> 
</html>