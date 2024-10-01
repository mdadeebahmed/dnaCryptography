


<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
  
   String username=request.getParameter("uname");
   String pwd=request.getParameter("pwd");
   
   
 
   
   String sql="select * from cloud where username='"+username+"' and password='"+pwd+"'";
   
   ResultSet r=Queries.getExecuteQuery(sql);

   if(r.next()){
     
    
       %>
    <script type="text/javascript">
        window.alert("Login Success...!!");
        window.location="CloudHome.jsp";
        </script>
    <%   
     
   }else{
 %>
    <script type="text/javascript">
        window.alert("Login Failed...!!");
        window.location="Cloud.jsp";
        </script>
    <%
}
   
}catch(Exception e){
  System.out.println(e);
}


%>