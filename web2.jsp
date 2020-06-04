<%@page import="javax.swing.JOptionPane"%>
<%@page import="javax.swing.JFrame"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        
        String uemail=request.getParameter("e1");
        session.setAttribute("sessname",uemail); 
        session.setAttribute("usermarks",0);
        session.setAttribute("userques",1);
        
        String upass=request.getParameter("p1");
          try
           {
               Connection c;
               Statement s;
               Class.forName("com.mysql.jdbc.Driver");
               c=DriverManager.getConnection("jdbc:mysql:///online","root","");
               s=c.createStatement();
              ResultSet rs= s.executeQuery("select * from login where email='"+uemail+"'and pass='"+upass+"'");
              if(rs.next())
              {
         // out.println("DATA SAVED SUCCESSFULLY");
                  response.sendRedirect("instr.html");
              }
              else
              {
                   
                  response.sendRedirect("login.html");
           }
           }
           catch(Exception e)
           {
               out.println(e);
           }
            
        %>
        
</html>
