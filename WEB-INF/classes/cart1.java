import java.io.*;
import java.lang.ProcessBuilder.Redirect;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class cart1 extends HttpServlet {
    List<String[]> orders = new ArrayList<String[]>();
    
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        orderDAO oa = orderDAO.getOD();
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);

        out.println("<html>");
        out.println("<body bgcolor=\"white\">");

        if (session == null) {
            response.sendRedirect("http://localhost:8080/project/login.jsp");

        }
        else{
        
            out.println("<h1>" + "Cart Page" + "</h1>");
            
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

        response.sendRedirect("http://localhost:8080/project/cart.jsp");

        }

    }

}