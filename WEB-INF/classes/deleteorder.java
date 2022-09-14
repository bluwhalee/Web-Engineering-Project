import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class deleteorder extends HttpServlet {
    orderDAO oa = orderDAO.getOD();
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        

        String orderid = request.getParameter("orderid");
        
        int r = oa.deleteorder(orderid);
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admindash.jsp");
        dispatcher.forward(request, response);




    }
}
