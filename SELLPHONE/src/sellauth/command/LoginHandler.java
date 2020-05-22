package sellauth.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import sellauth.service.LoginFailException;
import sellauth.service.LoginService;
import sellauth.service.User;

public class LoginHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/Login/SellerLogin.jsp";
	private LoginService loginService = new LoginService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
	throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("GET_login");
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) 
	throws Exception {
		System.out.println("POST_login");
		String id = trim(req.getParameter("seller_id"));
		String password = trim(req.getParameter("seller_pw"));
		System.out.println(id+"\t"+password);
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);

		if (id == null || id.isEmpty())
			errors.put("id", Boolean.TRUE);
		if (password == null || password.isEmpty())
			errors.put("password", Boolean.TRUE);

		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}

		try {
			System.out.println("try_login");
			User user = loginService.login(id, password);
			req.getSession().setAttribute("authUser", user);
			req.getSession().setAttribute("authUserId", req.getParameter("seller_id"));
			req.getSession().setAttribute("authUserName",user.getName());
			res.sendRedirect(req.getContextPath() + "/index.do");
			return null;
		} catch (LoginFailException e) {
			System.out.println("error_login");
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		}
	}

	private String trim(String str) {
		return str == null ? null : str.trim();
	}
}
