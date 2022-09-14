import java.io.*;
import java.lang.ProcessBuilder.Redirect;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

public class emptycart extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        HttpSession session = request.getSession();

        if (session.getAttribute("myorders") != null) {
            session.removeAttribute("myorders");
            response.sendRedirect("http://localhost:8080/project/cart.jsp");
        }

    }

}