<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.ProcessBuilder.Redirect" %>
<%@ page import="javax.swing.*" %>
<html>
<HEAD>
    <TITLE>Cart</TITLE>
</HEAD>
<Body>
<br>
<h1> Cart Page <h1>
<%
        session = request.getSession();
        if (session.getAttribute("login") == null) {
            session.setAttribute("url","http://localhost:8080/project/cart.jsp");
            request.getRequestDispatcher("/login.jsp").forward(request, response);

        }
        else{
            session.removeAttribute("url");
        }
        List<String[]> orders = new ArrayList<String[]>();
        orders = (List<String[]>)session.getAttribute("cartitems");
        int val = 0;
        int total = 0;
        if(orders == null)
        {
%>
<h2> Cart is Empty!<h2>
<a href="http://localhost:8080/project/index.html"><button>Buy Now</button></a>
<%
        return;
        }
        while (orders.size() > val) {
            int orderno = val + 1;
%>

            <br><br>
         <h4>   Order No: <%= orderno %> <h4>
         <h4>   Package: <%= orders.get(val)[0] %><br> <h4>
         <h4>   Model: <%= orders.get(val)[1] %><br> <h4>
<%
            if (orders.get(val)[0].equals("Complete Repair")) {
                total = total + 500;
%>
                <h4>   Cpu: <%= orders.get(val)[2] %><br> <h4>
                <h4>   Gpu: <%= orders.get(val)[3] %><br> <h4>
                <h4>   Hdd: <%= orders.get(val)[4] %><br> <h4>
                <h4>   Ram: <%= orders.get(val)[5] %><br> <h4>
<%
                

            }
            if (orders.get(val)[0].equals("Cosmic Repair")) {
                total = total + 300;
%>
                <h4>   Body: <%= orders.get(val)[2] %><br> <h4>
                <h4>   Paint: <%= orders.get(val)[3] %><br> <h4>
                <h4>   Display: <%= orders.get(val)[4] %><br> <h4>
                <h4>   Wash: <%= orders.get(val)[5] %><br> <h4>
<%
            
            }
            val = val + 1;
        }
%>
<h2>Order Total :- $<%= total %><h2>
<form action = "checkout" method="post">
    <input type="submit" value="Checkout">
</form>
<form action = "emptycart" method="post">
    <input type="submit" value="Empty Cart">
</form>

