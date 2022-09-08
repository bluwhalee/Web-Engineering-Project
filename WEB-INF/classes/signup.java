import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.sql.*;
import javax.swing.*;


public class signup extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
    {   
        userDAO ud = userDAO.getUD();
        int r = ud.userSignup(req.getParameter("id"), req.getParameter("pass"), req.getParameter("name"));
        if( r == 1)
        {
            HttpSession session = req.getSession();
            session.setAttribute("signup",1);
            res.sendRedirect("http://localhost:8080/project/signup.jsp");
        }
        if( r == 0)
        {
            HttpSession session = req.getSession();
            session.setAttribute("signup",0);
            res.sendRedirect("http://localhost:8080/project/signup.jsp");
        }


    }
}
