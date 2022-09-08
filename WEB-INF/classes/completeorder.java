import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class completeorder extends HttpServlet {
    orderDAO oa = orderDAO.getOD();
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        
        
        int orderid = Integer.valueOf(request.getParameter("orderid")) ;
        
        int r = oa.completeorder(orderid);
        response.setContentType("text/html");
        if(r==1){
            response.sendRedirect("http://localhost:8080/project/admindash.jsp");
        }
   
        




    }
}
