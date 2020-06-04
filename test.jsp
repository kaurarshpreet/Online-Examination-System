<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.pagination a {
  color: black;
  float: left;
  padding: 15px 20px;
  text-decoration: none;
  transition: background-color .3s;
  background-color:#FFE4B5;
  border: 2px solid white;
font-size: 20px;
}
body{
  background-color:#fffdd0;
  background-image:linear-gradient(to right, lightblue, white);
  border: 10px solid transparent;
  padding: 15px;
  border-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSFO0Pmysu7BCkuC7Cr3ejgZ8_u63sKQJpc9MokplDQACX1OCxr&usqp=CAU') 30 round;
}

button {
  background-color: blue;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  border-radius: 12px;

}

p,input,label{
 text-shadow: 0 0 10px rgba(0,0,0,0.3); letter-spacing:1px; text-align:left;font-size:20px;
}
#para
{
   background-image:linear-gradient(to bottom right, yellow,white);
    
  background-color: yellow;

}
.pagination a.active {
  background-color: dodgerblue;
  color: white;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
h2
{
  background: rgba(0,0,0,0.3);
    border: none;
    outline: none;
    padding: 10px;
    font-size: 50px;
    color: white;
    text-shadow: 1px 1px 1px rgba(0,0,0,0.3);
    border: 1px solid rgba(0,0,0,0.3);
    border-radius: 4px;
    box-shadow: inset 0 -5px 45px rgba(100,100,100,0.2), 0 1px 1px rgba(255,255,255,0.2);
    -webkit-transition: box-shadow .5s ease;
    -moz-transition: box-shadow .5s ease;
    -o-transition: box-shadow .5s ease;
    -ms-transition: box-shadow .5s ease;
    transition: box-shadow .5s ease;
text-align: center;
}
</style>
</head>
<body  >
    <form action="testeval.jsp">
<h2>QUESTIONS</h2>

<p id="para" style="color:blue;margin-left:90%; font-size:20px"></p>


<%
    try
{
Connection c;
               Statement s;
               Class.forName("com.mysql.jdbc.Driver");
               c=DriverManager.getConnection("jdbc:mysql:///online","root","");
               s=c.createStatement();
               int k=(Integer)session.getAttribute("userques");
                ResultSet rs= s.executeQuery("select * from test1 where id ='"+k+"'");
               
                %>
    
    
<p>
     <%
                
while(rs.next())
{

%>
<p>
   
    <%=
    rs.getString("ques") %>
    <br>
<input type="radio" name="rbutton" value="<%= rs.getString("option1")%>">
<%= rs.getString("option1")%>
<br>
<input type="radio" name="rbutton" value="<%= rs.getString("option2")%>">
<%= rs.getString("option2")%>
<br>
<input type="radio" name="rbutton"value="<%=rs.getString("option3")%>">
<%=rs.getString("option3")%>
<br>
<input type="radio" name="rbutton" value="<%=rs.getString("option4")%>">
<%=rs.getString("option4")%>
</p>
<br>
<br><br>
<%
}
%>
      
   
    <%
}
    
catch(Exception e)
{
    e.printStackTrace();
    }




%>

    

<center><button style="margin-left: 10px" value="prev" name="prev">PREV</button><button id="b2" style="margin-left: 10px" name="next" value="next">NEXT</button></center>
</form>
<script>
        var timer=60;
        var min=00,sec=00;
        function startTimer()
        {
            min=parseInt(timer/60);
            sec=parseInt(timer%60);
            if(timer<1)
            {
                window.location="ques2.jsp";
            }
            document.getElementById("para").innerHTML="<b>Time Left: 0"+min.toString()+":"+sec.toString()+"</b>";
            timer--;
            setTimeout(function(){
                startTimer();
            },2000);
            
        }
        </script> 
</body>
</html>
