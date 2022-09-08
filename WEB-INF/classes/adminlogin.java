import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.sql.*;
import javax.swing.*;

public class adminlogin extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
    {   
        userDAO ud = userDAO.getUD();
        int r = ud.adminLogin(req.getParameter("id"), req.getParameter("pass"));
        if( r == 1)
        {
            HttpSession session = req.getSession();
            session.setAttribute("alogin",1);
            session.setAttribute("utype",1);
            res.sendRedirect("http://localhost:8080/project/adminlogin.jsp");
        }
        if( r == 0)
        {
            HttpSession session = req.getSession();
            session.setAttribute("alogin",0);
            res.sendRedirect("http://localhost:8080/project/adminlogin.jsp");
        }


    }
}
