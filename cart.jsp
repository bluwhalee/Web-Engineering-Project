<%@ page import="java.sql.*" %> 
<%@ page import="java.io.*" %> 
<%@ page import="java.util.*" %> 
<%@ page import="java.lang.ProcessBuilder.Redirect" %>
<%@ page import="javax.swing.*" %>
<html>
<HEAD>
    <TITLE>Cart</TITLE>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</HEAD>
<Body>
<br>
<div class="text-center">
<h1> Cart Page <h1>
<%
        session = request.getSession();
        List<String[]> orders = new ArrayList<String[]>();
        orders = (List<String[]>)session.getAttribute("myorders");
        int val = 0;
        int total = 0;
        if(orders == null)
        {
%>

    <h2 class="mt-5"> Cart is Empty!<h2>
    <a href="http://localhost:8080/project/index.html"><button class="btn btn-primary">Buy Now</button></a>
</div>
<%
        return;
        }
%>
<div class="p-5">
    <table class="table table-striped table-hover">
        <tr>
            <th>Order No.</th>
            <th>Package</th>
            <th>Model</th>
            <th>Parts</th>
            <th>Total</th>
        </tr>


<%
        while (orders.size() > val) {
            int orderno = val + 1;
            String parts = "";
%>      
            <tr>
                <th><%= orderno %></th>
                <th><%= orders.get(val)[0] %></th>
                <th><%= orders.get(val)[1] %></th>

<%
            if (orders.get(val)[0].equals("Complete Repair")) {
                total = total + Integer.parseInt(orders.get(val)[7]);
                if(orders.get(val)[2].equals("yes")){
                    parts = parts + "CPU,";
                }
                if(orders.get(val)[3].equals("yes")){
                    parts = parts + "GPU,";
                }
                if(orders.get(val)[4].equals("yes")){
                    parts = parts + "HDD,";
                }
                if(orders.get(val)[5].equals("yes")){
                    parts = parts + "RAM,";
                }
                
            }
            if (orders.get(val)[0].equals("Cosmic Repair")) {
                total = total + Integer.parseInt(orders.get(val)[7]);
                if(orders.get(val)[2].equals("yes")){
                    parts = parts + "Body,";
                }
                if(orders.get(val)[3].equals("yes")){
                    parts = parts + "Paint,";
                }
                if(orders.get(val)[4].equals("yes")){
                    parts = parts + "Display,";
                }
                if(orders.get(val)[5].equals("yes")){
                    parts = parts + "Wash,";
                }
            
            }
            val = val + 1;
%>
        <th><%= parts %></th>
        <th>$<%= total %></th>
      </tr>
<%
            
}
%>
    </table>
</div>


<div class="fixed-bottom text-center">
    <h2>Order Total :- $<%= total %><h2>
    <div class="d-flex justify-content-evenly">
        <div>
            <a href="http://localhost:8080/project/index.html"><button class="btn btn-primary">Buy More</button></a><br><br>
        </div>
        <div>
            <form action = "checkout" method="post">
                <input type="submit" value="Checkout" class="btn btn-primary">
            </form>
        </div>
        <div>
            <form action = "emptycart" method="post">
                <input type="submit" value="Empty Cart" class="btn btn-primary">
            </form>
        </div>
    </div>

</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
</body>
</html>

