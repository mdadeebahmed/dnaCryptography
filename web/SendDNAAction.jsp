<%-- 
    Document   : SendDNAAction
    Created on : 7 Mar, 2023, 6:50:02 PM
    Author     : GKV
--%>

<%@page import="com.mail.Mail"%>
<%@page import="com.sun.org.apache.xerces.internal.impl.dv.util.Base64"%>
<%@page import="javax.crypto.SecretKey"%>
<%@page import="javax.crypto.KeyGenerator"%>
<%@page import="com.upload.Ftpcon"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.database.DBCon"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%try{
      
      String email=(String)session.getAttribute("email");
            String remail=request.getParameter("email");
            String message=request.getParameter("message");
            String ascii=request.getParameter("ascii");
          
            String hexadecimal=request.getParameter("hexadecimal");
            String binary=request.getParameter("binary");
            String dna=request.getParameter("dna");
            
             KeyGenerator keygen=KeyGenerator.getInstance("AES");
           keygen.init(192);
           SecretKey s=keygen.generateKey();
           //converting secret keyto string
           byte[] b=s.getEncoded();//encoding secret key
           String skey=Base64.encode(b);
           
           String msg="Decode Key: "+skey;
           Mail.secretMail(msg, remail, remail);
           
            Connection con=DBCon.getConnection();
           
            PreparedStatement pst=con.prepareStatement("insert into dna values(null,?,?,?,?,?,?,?,now(),?)");
           pst.setString(1,email);
            pst.setString(2,remail);
             pst.setString(3,message);
           pst.setString(4,ascii);
               pst.setString(5,hexadecimal);
                pst.setString(6,binary);
                pst.setString(7,dna);
                 pst.setString(8,skey);
               
                
            int i=pst.executeUpdate();
            if(i>0){
                File f=new File("C://project//DNA.txt");
                FileWriter fw=new FileWriter(f);
                fw.write(skey);
                fw.close();
                Ftpcon fcon=new Ftpcon();
                fcon.upload(f, f.getName());
                
                %>
                <script type="text/javascript"> 
                window.alert("Message Encoded to DNA..!!\nDecode Key Sent To Mail");
                window.location="SendMessage.jsp";
                </script>
                <%
               
            }else{
                %>
                <script type="text/javascript"> 
                window.alert("Message Encodeding Failed..!!");
                window.location="SendMessage.jsp";
                </script>
                <%
            }
            
        }catch(Exception e){
            out.println(e);
        }
  %>