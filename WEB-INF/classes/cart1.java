import java.io.*;
import java.lang.ProcessBuilder.Redirect;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class cart1 extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        orderDAO oa = orderDAO.getOD();
        List<String[]> orders = new ArrayList<String[]>();
        response.setContentType("text/html");
        HttpSession session = request.getSession();
        if (session.getAttribute("myorders") != null) {
            orders = (List<String[]>) session.getAttribute("myorders");
        }

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
        model = request.getParameter("model");

        if (request.getParameter("pkg").equals("1")) {
            package1 = "Complete Repair";

            cpu = request.getParameter("cpu");
            if (cpu != null) {
                cost = cost = 100;
                cpu = "yes";
            } else {
                cpu = "no";
            }
            gpu = request.getParameter("gpu");
            if (gpu != null) {
                cost = cost + 200;
                gpu = "yes";
            } else {
                gpu = "no";
            }
            hdd = request.getParameter("hdd");
            if (hdd != null) {
                cost = cost + 100;
                hdd = "yes";
            } else {
                hdd = "no";
            }
            ram = request.getParameter("ram");
            if (ram != null) {
                cost = cost + 50;
                ram = "yes";
            } else {
                ram = "no";
            }
            status = "New";
            orders.add(new String[] { package1, model, cpu, gpu, hdd, ram, status, String.valueOf(cost) });
        }

        else {
            package1 = "Cosmic Repair";

            body = request.getParameter("body");
            if (body != null) {
                cost = cost + 50;
                body = "yes";
            } else {
                body = "no";
            }
            paint = request.getParameter("paint");
            if (paint != null) {
                cost = cost + 30;
                paint = "yes";
            } else {
                paint = "no";
            }
            display = request.getParameter("display");
            if (display != null) {
                cost = cost + 100;
                display = "yes";
            } else {
                display = "no";
            }
            wash = request.getParameter("wash");
            if (wash != null) {
                cost = cost + 20;
                wash = "yes";
            } else {
                wash = "no";
            }
            status = "New";
            orders.add(new String[] { package1, model, body, paint, display, wash, status, String.valueOf(cost) });
        }

        int val = 0;

        session.setAttribute("myorders", orders);

        response.sendRedirect("http://localhost:8080/project/cart.jsp");

    }

}