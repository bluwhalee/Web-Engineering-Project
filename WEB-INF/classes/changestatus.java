import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class changestatus extends HttpServlet {
    orderDAO oa = orderDAO.getOD();
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        

        String status = request.getParameter("status");
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        int r = oa.changeorderstatus(orderid, status);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        response.sendRedirect("http://localhost:8080/project/admindash.jsp");




    }
}
