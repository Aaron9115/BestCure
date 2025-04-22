package com.islington.controller;

import java.io.IOException;

import com.islington.util.RedirectionUtil;
import com.islington.util.ValidationUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * @author Anish
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ValidationUtil validationUtil;
	private RedirectionUtil redirectionUtil;

	@Override
	public void init() throws ServletException {
		this.validationUtil = new ValidationUtil();
		this.redirectionUtil = new RedirectionUtil();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher(RedirectionUtil.loginUrl).forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		if (validationUtil.isNullOrEmpty(username) || validationUtil.isNullOrEmpty(password)) {
			redirectionUtil.setMsgAndForward(req, resp, "error", "Please fill all the fields!",
					RedirectionUtil.loginUrl);
		} else {
			if (username.equals("admin") && password.equals("admin")) {
				redirectionUtil.setSessionMsgAndRedirect(req, resp, "success", "Successfully Logged In!",
						RedirectionUtil.homeUrl);
			} else {
				redirectionUtil.setSessionMsgAndRedirect(req, resp, "error", "Either username or password is incorrect!",
						RedirectionUtil.loginUrl);
			}
		}
	}
}
