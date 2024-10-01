
<%@page import="com.database.Queries"%>
<%@page import="java.sql.ResultSet"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
try{
  String email=(String)session.getAttribute("email");
   String decode=request.getParameter("decode");
 
   String sql="select * from dna where decode='"+decode+"' and receiver='"+email+"'";
   
   ResultSet r=Queries.getExecuteQuery(sql);
 
   if(r.next()){
   session.setAttribute("id",r.getString("id"));
            %>
    <script type="text/javascript">
        window.alert("Verification Successful..!!");
        window.location="DecodeMessage.jsp";
        </script>
    <%}else{
       %>
    <script type="text/javascript">
        window.alert("Verification Failed...!!");
        window.location="ViewMessage.jsp";
        </script>
    <%   
     }
   
   
}catch(Exception e){
  System.out.println(e);
}


%>