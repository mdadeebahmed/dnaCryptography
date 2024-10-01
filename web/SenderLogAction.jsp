
<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
  
   String username=request.getParameter("uname");
   String pwd=request.getParameter("pwd");
      
   String sql="select * from sender where username='"+username+"' and password='"+pwd+"'";
   
   ResultSet r=Queries.getExecuteQuery(sql);
 
   if(r.next()){
     String s=r.getString("status");
    if(s.equals("waiting")){
            %>
    <script type="text/javascript">
        window.alert("you are not authorized by\nAdmin...!!");
        window.location="Sender.jsp";
        </script>
    <%}else{
      session.setAttribute("id",r.getString("id"));
          session.setAttribute("email",r.getString("email"));
                   session.setAttribute("username",username);
       %>
    <script type="text/javascript">
        window.alert("Login Success...!!");
        window.location="SenderHome.jsp";
        </script>
    <%   
     }
   }else{
 %>
    <script type="text/javascript">
        window.alert("Login Failed...!!");
        window.location="Sender.jsp";
        </script>
    <%
}
   
}catch(Exception e){
  System.out.println(e);
}


%>