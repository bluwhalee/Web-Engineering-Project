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
        HttpSession session = request.getSession();
    
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
        int cost = 0;
        if (request.getParameter("pkg").equals("1")) {
            package1 = "Complete Repair";
            model = request.getParameter("model");
            cpu = request.getParameter("cpu");
            if(cpu != null)
            {
                cost = cost =100;
            }
            gpu = request.getParameter("gpu");
            if(gpu!= null)
            {
                cost = cost +200;
            }
            hdd = request.getParameter("hdd");
            if(hdd!= null)
            {
                cost = cost +100;
            }
            ram = request.getParameter("ram");
            if(ram!= null)
            {
                cost = cost +50;
            }
            status = "New";
            orders.add(new String[] { package1, model, cpu, gpu, hdd, ram, status, String.valueOf(cost) });
        }

        else {
            package1 = "Cosmic Repair";
            model = request.getParameter("model");
            body = request.getParameter("body");
            if(body!= null)
            {
                cost = cost + 50;
            }
            paint = request.getParameter("paint");
            if(paint!= null)
            {
                cost = cost + 30;
            }
            display = request.getParameter("display");
            if(display!= null)
            {
                cost = cost + 100;
            }
            wash = request.getParameter("wash");
            if(wash!= null)
            {
                cost = cost + 20;
            }
            status = "New";
            orders.add(new String[] { package1, model, body, paint, display, wash, status,String.valueOf(cost) });
        }
        
        
        int val = 0;

        session.setAttribute("cartitems", orders);

        response.sendRedirect("http://localhost:8080/project/cart.jsp");

        

    }

}