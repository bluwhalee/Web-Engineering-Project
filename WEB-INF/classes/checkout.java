import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class checkout extends HttpServlet {
    orderDAO oa = orderDAO.getOD();

    public void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html><head><link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT\" crossorigin=\"anonymous\"></head>");
        out.println("<body bgcolor=\"white\">");
        HttpSession session = request.getSession();
        if (session.getAttribute("myorders") == null) {
            out.println("<h2> Cart is Empty!<h2><a href=" + "http://localhost:8080/project/index.html"
                    + "><button class=\"btn btn-primary\">Buy Now</button></a>");
            return;
        }
        
        if (session.getAttribute("login") == null) {

            session.setAttribute("url", "http://localhost:8080/project/cart.jsp");
            response.sendRedirect("http://localhost:8080/project/login.jsp");
            return;
        } 

        List<String[]> orders = new ArrayList<String[]>();
        orders = (List<String[]>) session.getAttribute("myorders");
        String id = (String) session.getAttribute("uname");
        int val = 0;
        
        while (orders.size() > val) 
        {

            // out.println("OrderNo:" + (val+1) + "<br>");
            // out.println("Package: " + orders.get(val)[0] + "<br>");
            // out.println("Model: " + orders.get(val)[1] + "<br>");
            if (orders.get(val)[0].equals("Complete Repair")) {
                // out.println("Cpu: " + orders.get(val)[2] + "<br>");
                // out.println("Gpu: " + orders.get(val)[3] + "<br>");
                // out.println("Hdd: " + orders.get(val)[4] + "<br>");
                // out.println("Ram: " + orders.get(val)[5] + "<br>");
                int suc = 1;
                suc = oa.addorder(orders.get(val)[0], orders.get(val)[1], orders.get(val)[2], orders.get(val)[3],
                        orders.get(val)[4], orders.get(val)[5], "-", "-", "-", "-", "New", id,Integer.parseInt(orders.get(val)[7]));

            }
            if (orders.get(val)[0].equals("Cosmic Repair")) {
                // out.println("Body: " + orders.get(val)[2] + "<br>");
                // out.println("Paint: " + orders.get(val)[3] + "<br>");
                // out.println("Dispaly: " + orders.get(val)[4] + "<br>");
                // out.println("Wash: " + orders.get(val)[5] + "<br>");
                int suc = 1;
                suc = oa.addorder(orders.get(val)[0], orders.get(val)[1], "-", "-", "-", "-", orders.get(val)[2],orders.get(val)[3], orders.get(val)[4], orders.get(val)[5], "New", id,Integer.parseInt(orders.get(val)[7]));
            }
            val = val + 1;
        }
        out.println("<div style=\"text-align:center\"><img src=\"https://i.postimg.cc/3xQSYrxB/tick.png\" width=300px>");
        out.println("<h2> Order Succsesfull<h2>");
        session.removeAttribute("myorders");
        out.println("<a href=" + "http://localhost:8080/project/index.html" + "><button class=\"btn btn-primary mt-3\">Buy More</button></a></div>");

    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }
}
