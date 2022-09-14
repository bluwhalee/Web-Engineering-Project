import java.io.*;
import java.sql.ResultSet;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class allusers extends HttpServlet {
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
        ResultSet rs1 = ad.allusers();
        if(rs1==null){out.println(rs1);}
        
        out.println("<table class="+"\"table table-striped\""+"><tr><th>Name</th><th>Email</th><th>Username</th></tr>");
        
        
        try {
            while (rs1.next()) {
                
                String name = rs1.getString("name");
                String email = rs1.getString("email");
                String username = rs1.getString("username");
                out.println("<tr><th>" + name + "</th><th>" + email + "</th><th>" + username + "</th></tr>");
    
            }
            out.println("</table>");
        } catch (Exception e) {
            out.println(e);
        }

    }
}
