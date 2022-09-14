import java.io.*;
import java.sql.ResultSet;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class allparts extends HttpServlet {
    adminDAO ad = adminDAO.getAD();

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><head><link rel=stylesheet href=adminstyle.css></head>");
        out.println("<body>");

        HttpSession session = request.getSession();
        if(session.getAttribute("alogin")== null)
        {
            out.println("<h2>You can access from Admin Dashboard Only<h2>");
            return;
        }

        ResultSet rs1 = ad.allparts();
        if(rs1==null){out.println(rs1);}
        out.println("<table class="+"\"table table-striped\""+"><tr><th>CPU</th><th>GPU</th><th>HDD</th><th>RAM</th><th>Body</th><th>Display</th></tr>");
        
        
        try {
            while (rs1.next()) {
                
                int cpu = rs1.getInt("cpu");
                int gpu = rs1.getInt("gpu");
                int hdd = rs1.getInt("hdd");
                int ram = rs1.getInt("ram");
                int body = rs1.getInt("body");
                int display = rs1.getInt("display");
                out.println("<tr><th>" + cpu + "</th><th>" + gpu + "</th><th>" + hdd + "</th><th>" + ram
                        + "</th><th>" + body + "</th><th>" + display + "</th></tr>");
    
            }
            out.println("</table>");
        } catch (Exception e) {
            out.println(e);
        }

    }
}
