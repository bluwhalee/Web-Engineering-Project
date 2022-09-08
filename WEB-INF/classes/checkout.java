import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class checkout extends HttpServlet {
    orderDAO oa = orderDAO.getOD();
    public void processRequest(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<body bgcolor=\"white\">");
        out.println("<h1>" + "Checkout Page"+ "</h1>");
        HttpSession session = request.getSession();
        if (session.getAttribute("login") == null) {
            session.setAttribute("url","http://localhost:8080/project/checkout");
            request.getRequestDispatcher("/login.jsp").forward(request, response);

        }
        else{
            session.removeAttribute("url");
        }
        
        
        List<String[]> orders = new ArrayList<String[]>();
        orders = (List<String[]>)session.getAttribute("cartitems");
        if(orders == null){
          out.println("<h2> Cart is Empty!<h2><a href="+"http://localhost:8080/project/index.html"+"><button>Buy Now</button></a>");
        }
        String id = (String)session.getAttribute("uname");
        int val = 0;
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
                int suc =1;
                 suc = oa.addorder(orders.get(val)[0],orders.get(val)[1],orders.get(val)[2],orders.get(val)[3],orders.get(val)[4],orders.get(val)[5],"-","-","-","-","New",id);
                out.println("suc: " + suc+ "<br>");

            }
            if (orders.get(val)[0].equals("Cosmic Repair")) {
                out.println("Body: " + orders.get(val)[2] + "<br>");
                out.println("Paint: " + orders.get(val)[3] + "<br>");
                out.println("Dispaly: " + orders.get(val)[4] + "<br>");
                out.println("Wash: " + orders.get(val)[5] + "<br>");
                int suc =1;
                 suc = oa.addorder(orders.get(val)[0],orders.get(val)[1],"-","-","-","-",orders.get(val)[2],orders.get(val)[3],orders.get(val)[4],orders.get(val)[5],"New",id);
                out.println("suc: " + suc+ "<br>");
            }
            val = val + 1;
        }
        out.println("<h2> Order Succsesfull<h2>");
        out.println("<a href="+"http://localhost:8080/project/index.html"+"><button>Buy More<button></a>");



    }
    
	public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException { 
		processRequest(request, response);} 


	public void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException { 
		processRequest(request, response); 
    }
}
