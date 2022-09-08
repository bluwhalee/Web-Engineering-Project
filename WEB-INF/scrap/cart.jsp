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
        session = request.getSession(false);
        if (session == null) {
            response.sendRedirect("http://localhost:8080/project/login.jsp");

        }
        else
        {
            List<String[]> orders = new ArrayList<String[]>();
%>
<h1> Cart Page <h1>
<%
            if(true)
            {
                String package1;
                String model;
                String cpu;
                String gpu;
                String hdd;
                String ram;
                String body;
                String paint;
                String display;
                String wash;
                String status;
                String username;

                if (request.getParameter("pkg").equals("1")) {
                    package1 = "Complete Repair";
                    model = request.getParameter("model");
                    cpu = request.getParameter("cpu");
                    gpu = request.getParameter("gpu");
                    hdd = request.getParameter("hdd");
                    ram = request.getParameter("ram");
                    status = "Working";
                    orders.add(new String[] { package1, model, cpu, gpu, hdd, ram, status });
                }

                else {
                    package1 = "Cosmic Repair";
                    model = request.getParameter("model");
                    body = request.getParameter("body");
                    paint = request.getParameter("paint");
                    display = request.getParameter("display");
                    wash = request.getParameter("wash");
                    status = "Working";
                    orders.add(new String[] { package1, model, body, paint, display, wash, status });
                }
                int val = 0;

                session.setAttribute("cartitems", orders);
                session.setAttribute("lastorder", model);

                while (orders.size() > val) {
                    int orderno = val + 1;
                    out.println("<br><br>");
                    out.println("Order No: " + orderno + "<br>");
                    out.println("Package: " + orders.get(val)[0] + "<br>");
                    out.println("Model: " + orders.get(val)[1] + "<br>");
                    if (orders.get(val)[0].equals("Complete Repair")) {
                        out.println("Cpu: " + orders.get(val)[2] + "<br>");
                        out.println("Gpu: " + orders.get(val)[3] + "<br>");
                        out.println("Hdd: " + orders.get(val)[4] + "<br>");
                        out.println("Ram: " + orders.get(val)[5] + "<br>");
                    }
                    if (orders.get(val)[0].equals("Cosmic Repair")) {
                        out.println("Body: " + orders.get(val)[2] + "<br>");
                        out.println("Paint: " + orders.get(val)[3] + "<br>");
                        out.println("Dispaly: " + orders.get(val)[4] + "<br>");
                        out.println("Wash: " + orders.get(val)[5] + "<br>");
                    }
                    val = val + 1;
                }
            }
%>

<a href="http://localhost:8080/project/index.html"> <button>Buy More</button></a><br>
<form action="checkout" method="post">
    <input type="submit" value="Checkout">
</form>

<%
        }
%>