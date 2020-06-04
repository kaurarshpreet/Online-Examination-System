<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <body>
        <%
            String uname=request.getParameter("Name");
            String uid=request.getParameter("id");
            String uemail=request.getParameter("e1");
            String upass=request.getParameter("p1");
            String uques=request.getParameter("Q1");
            String uans=request.getParameter("ans");
            session.setAttribute("username",uname);
           try
           {
               Connection c;
               Statement s;
               Class.forName("com.mysql.jdbc.Driver");
               c=DriverManager.getConnection("jdbc:mysql:///online","root","");
               s=c.createStatement();
               s.executeUpdate("insert into login values ('"+uname+"','"+uid+"','"+uemail+"','"+upass+"','"+uques+"','"+uans+"')");
         response.sendRedirect("login.html");
           }
           catch(Exception e)
           {
               out.println(e);
           }
           
            %>
            
    </body>
</html>
