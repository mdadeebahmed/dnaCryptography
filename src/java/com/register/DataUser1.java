/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.register;

import com.database.DBCon;
import com.database.Queries;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mahee
 */
public class DataUser1 extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out=response.getWriter();
         try{
            String name=request.getParameter("name");
            String email=request.getParameter("email");
            String mobile=request.getParameter("mobile");
          
            String address=request.getParameter("address");
            String uname=request.getParameter("uname");
            String pwd=request.getParameter("pwd");

           
            Connection con=DBCon.getConnection();
            String sql="select count(*) from sender where email='"+email+"'";
            int count=0;
            
            ResultSet r=Queries.getExecuteQuery(sql);
            while(r.next()){
                count=r.getInt(1);
            }
            if(count==0){
            
            PreparedStatement pst=con.prepareStatement("insert into sender values(null,?,?,?,?,?,?,?)");
           pst.setString(1,name);
            pst.setString(2,email);
             pst.setString(3,mobile);
           pst.setString(4,address);
               pst.setString(5,uname);
                pst.setString(6,pwd);
                pst.setString(7,"waiting");
                
            int i=pst.executeUpdate();
            if(i>0){
               response.sendRedirect("SenderUserReg.jsp?msg=success");
            }else{
               response.sendRedirect("SenderUserReg.jsp?msg=failed"); 
            }
            }else{
               response.sendRedirect("SenderUserReg.jsp?msg=Already User Exist");  
            }
        }catch(Exception e){
            out.println(e);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
