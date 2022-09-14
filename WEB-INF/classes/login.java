import java.io.*;
import javax.servlet.http.*;
import javax.servlet.*;
import java.util.*;
import java.sql.*;
import javax.swing.*;

public class login extends HttpServlet {
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
    {   
        userDAO ud = userDAO.getUD();
        int r = ud.userLogin(req.getParameter("id"), req.getParameter("pass"));
        if( r == 1)
        {
            HttpSession session = req.getSession();
            session.setAttribute("login",1);
            session.setAttribute("utype",0);
            session.setAttribute("uname",req.getParameter("id"));
            if(session.getAttribute("alogin")!=null)
            {
                session.removeAttribute("alogin");
            }
            res.sendRedirect("http://localhost:8080/project/login.jsp");
        }
        if( r == 0)
        {
            HttpSession session = req.getSession();
            session.setAttribute("login",0);
            res.sendRedirect("http://localhost:8080/project/login.jsp");
        }


    }
}
