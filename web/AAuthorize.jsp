
<%@page import="com.database.Queries"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%

String id=request.getParameter("id");
try{

    int i=Queries.getExecuteUpdate("update sender set status='Authorized' where id='"+id+"'");
    if(i>0){
        %>
        <script type="text/javascript">
            window.alert("Authorization successfully");
            window.location="AViewSender.jsp";
            </script>
        <%
    }else{
 %>
        <script type="text/javascript">
            window.alert("Authorization Failed");
            window.location="AViewSender.jsp";
            </script>
        <%
}
    
}catch(Exception e){
    out.println(e);
}


%>