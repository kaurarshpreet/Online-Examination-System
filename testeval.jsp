<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <body>
        <%
            

                 try
           {
               Connection c;
               Statement s;
               Class.forName("com.mysql.jdbc.Driver");
               c=DriverManager.getConnection("jdbc:mysql:///online","root","");
               s=c.createStatement();
                int count=(Integer)session.getAttribute("usermarks");
                   String uans=request.getParameter("rbutton");
                   int k=(Integer)session.getAttribute("userques");
                   String x=request.getParameter("prev");
                  
 
               ResultSet rs=s.executeQuery("select ans from test1 where id='"+k+"' ");
                if(rs.next())
                {
                    String correct=rs.getString("ans");
                    out.println(uans+" "+correct);
                    if(correct.trim().equals(uans))
                    {
                       
                        count=count+2;
                        session.setAttribute("usermarks",count);
                    }
                    
                }
            
              String uemail=(String)session.getAttribute("sessname");
              rs=s.executeQuery("select email from result where email='"+uemail+"' ");
              String uname=(String)session.getAttribute("username");
                if(rs.next())
                {
                 s.executeUpdate("update result set marks='"+count+"' where email='"+uemail+"'");   
                }
                else
                {
                   s.executeUpdate("insert into result values ('"+uname+"','"+uemail+"','"+count+"')"); 
                }
               out.println(x);
               if (x!=null && x.equals("prev"))
               { k=k-1;
               if(k>0)
               {
               session.setAttribute("userques",k);
               response.sendRedirect("test.jsp");
               }
               else if(k==0)
               {
                session.setAttribute("userques",k+1);
               response.sendRedirect("test.jsp");  
               }
               }
            
               else if(k>=1 && k<10)
             {
                 k=k+1;
                 session.setAttribute("userques",k);
               response.sendRedirect("test.jsp");
               
             }
             else 
               {
                 response.sendRedirect("result.jsp");  
               }
                    
           }
                 catch(Exception e)
                 {
                   out.println(e); 
                 }
        %>
    </body>
</html>
