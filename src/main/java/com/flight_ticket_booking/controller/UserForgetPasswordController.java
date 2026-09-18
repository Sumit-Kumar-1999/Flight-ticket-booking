/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.flight_ticket_booking.controller;

import com.flight_ticket_booking.service.UserService;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
/**
 *
 * @author Sumit
 */
@WebServlet("/forgetPassword")
public class UserForgetPasswordController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String email = req.getParameter("email");
        String newpassword = req.getParameter("newPassword");

        UserService service = new UserService();
        int result = service.updatePasswordByEmail(email, newpassword);
        if (result == 1) {
            RequestDispatcher dispatcher = req.getRequestDispatcher("user-login.jsp");
            dispatcher.forward(req, resp);
        } else {
            req.setAttribute("errmsg", "Email not exist");
            req.setAttribute("enteredEmail", email);
            RequestDispatcher dispatcher = req.getRequestDispatcher("user-login.jsp");
            dispatcher.forward(req, resp);
        }
    }
}
