import java.io.*;
import java.sql.ResultSet;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class searchuser extends HttpServlet {
    userDAO ud = userDAO.getUD();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        String userid = request.getParameter("userid");
        ResultSet rs1 = ud.searchuser(userid);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><head><link rel=stylesheet href=adminstyle.css></head>");
        out.println("<body>");
        out.println("<table><tr><th>Order Id</th><th>Package</th><th>Model</th><th>Cpu</th><th>Gpu</th><th>HDD</th><th>RAM</th><th>Body</th><th>Paint</th><th>Display</th><th>Wash</th><th>Status</th><th>User</th></tr>");
        try {
            while (rs1.next()) {
                String package1 = rs1.getString("package");
                String model = rs1.getString("model");
                String cpu = rs1.getString("cpu");
                String gpu = rs1.getString("gpu");
                String hdd = rs1.getString("hdd");
                String ram = rs1.getString("ram");
                String body = rs1.getString("body");
                String paint = rs1.getString("paint");
                String display = rs1.getString("display");
                String wash = rs1.getString("wash");
                String status = rs1.getString("status");
                String username = rs1.getString("username");
                int orderid = rs1.getInt("orderid");
                out.println("<tr><th>" + orderid + "</th><th>" + package1 + "</th><th>" + model + "</th><th>" + cpu
                        + "</th><th>" + gpu + "</th><th>" + hdd + "</th><th>" + ram + "</th><th>" + body + "</th><th>"
                        + paint + "</th><th>" + display + "</th><th>" + wash + "</th><th>" + status + "</th><th>" + username
                        + "</th></tr>");
    
            }
        } catch (Exception e) {
            System.out.println("e");
        }

    }
}
