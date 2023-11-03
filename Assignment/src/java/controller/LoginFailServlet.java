/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author HELLO
 */
public class LoginFailServlet extends HttpServlet {
   

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
          String username = request.getParameter("username");
        String password = request.getParameter("password");
        User param = new User();
        param.setUsername(username);
        param.setPassword(password);
        UserDAO db = new UserDAO();
        User loggedUser = db.get(param);
        if (loggedUser != null) {
            
            HttpSession session = request.getSession();
            session.setAttribute("account", loggedUser);
            
            String remember = request.getParameter("remember");
            if (remember != null) {
                Cookie c_user = new Cookie("user", username);
                Cookie c_pass = new Cookie("pass", password);
                c_user.setMaxAge(24 * 3600);
                c_pass.setMaxAge(24 * 3600);
                response.addCookie(c_user);
                response.addCookie(c_pass);
            }
            response.sendRedirect("home.jsp");;
            
        } else {
            response.sendRedirect("loginFail.jsp");;
            
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
