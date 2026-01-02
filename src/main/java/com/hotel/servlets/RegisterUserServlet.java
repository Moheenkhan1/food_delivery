package com.hotel.servlets;

import java.io.IOException;
import java.sql.SQLException;

import com.hotel.daoimp.UserDaoImp;
import com.hotel.models.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/register")
public class RegisterUserServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			String username = req.getParameter("username");
			String email = req.getParameter("email");
			long phone = Long.parseLong(req.getParameter("phone"));
			String password = req.getParameter("password");
			String address="";
			
			
			UserDaoImp userDaoImp = new UserDaoImp();
			
			User exists = userDaoImp.getUser(email);
			
			if(exists!=null) {
				
				req.setAttribute("userExists", "userExists");
				
				RequestDispatcher rd = req.getRequestDispatcher("register.jsp");
				rd.forward(req, resp); 
				return;
			}else {
				User user = new User(username, password, email, phone, address);
				int userId = userDaoImp.addUser(user);
				
				resp.sendRedirect("login.jsp");
			}
		}
		catch (SQLException e) {

		    if (e.getErrorCode() == 1062) {

		        String msg = e.getMessage();

		        if (msg.contains("phone")) {
		            resp.sendRedirect("register.jsp?error=phone_exists");
		        } 
		        else if (msg.contains("username")) {
		            resp.sendRedirect("register.jsp?error=username_exists");
		        }
		    } 
		    else {
		        throw new ServletException(e);
		    }
		    
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
