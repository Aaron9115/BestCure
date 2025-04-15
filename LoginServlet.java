package controller.servlets.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.islington.modal.bestPharma;
import com.islington.service.LoginService;
import com.islington.utils.CookieUtils;
import com.islington.utils.sessionUtils;


@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String password = req.getParameter("password");

		  bestPharma loginModel = new bestPharma(username, password);
		    LoginService loginService = new LoginService(); 
		    Boolean loginStatus = loginService.loginUser(loginModel);

		if (loginStatus != null && loginStatus) {
			sessionUtils.setAttribute(req, "username", username);
			if (username.equals("admin")) {
				CookieUtils.addCookie(resp, "role", "admin", 5 * 30);
				resp.sendRedirect(req.getContextPath() + "/dashboard"); // Redirect to dashboard page
			} else {
				CookieUtils.addCookie(resp, "role", "client", 5 * 30);
				resp.sendRedirect(req.getContextPath() + "/home"); // Redirect to home page
			}
		} else {
			handleLoginFailure(req, resp, loginStatus);
		}
	}

	/**
	 * Handles login failures
	
	 */
	private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus)
			throws ServletException, IOException {
		String errorMessage;
		if (loginStatus == null) {
			errorMessage = "Our server is under maintenance. Please try again later!";
		} else {
			errorMessage = "User credential mismatch. Please try again!";
		}
		req.setAttribute("error", errorMessage);
		req.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(req, resp);
	}

}