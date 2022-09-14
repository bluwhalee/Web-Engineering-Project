import java.io.*;
import java.sql.ResultSet;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class deleteuser extends HttpServlet {
    adminDAO ad = adminDAO.getAD();

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><head><link rel=stylesheet href=adminstyle.css></head>");
        out.println("<body>");
        String username = request.getParameter("userid");
        HttpSession session = request.getSession();
        if(session.getAttribute("alogin")== null)
        {
            out.println("<h2>You can access from Admin Dashboard Only<h2>");
            return;
        }

        int rs1 = ad.deleteuser(username);
        if (rs1== 1)
        {
            response.sendRedirect("http://localhost:8080/project/adminlogin.jsp");
        }
        if (rs1== 0)
        {
            out.println("Enter a valid username");
        }

    }
}
