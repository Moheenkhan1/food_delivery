package com.hotel.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.hotel.daoimp.UserDaoImp;
import com.hotel.models.User;

@WebServlet("/loginServlet")
public class LoginUserServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			UserDaoImp userDaoImp = new UserDaoImp();
			User user = userDaoImp.getUser(email);
			
			if (user == null || !password.equals(user.getPassword())) {
			    req.setAttribute("validation", "invalid");
			    req.getRequestDispatcher("login.jsp").forward(req, resp);
			    return;
			}else {
				
				HttpSession session = req.getSession();
				session.setAttribute("user", user);
				
				resp.sendRedirect("restaurant");
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
