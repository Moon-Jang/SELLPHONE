package buyauth.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import buyauth.service.LoginFailException;
import buyauth.service.LoginService;
import buyauth.service.BuyUser;
import mvc.command.CommandHandler;

public class LoginHandler implements CommandHandler {
	
	private static final String FORM_VIEW = "/WEB-INF/view/Login/BuyerLogin.jsp";
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
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) 
	throws Exception {
		String buyer_id = trim(req.getParameter("buyer_id"));
		String buyer_pw = trim(req.getParameter("buyer_pw"));

		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);

		if (buyer_id == null || buyer_id.isEmpty())
			errors.put("buyer_id", Boolean.TRUE);
		if (buyer_pw == null || buyer_pw.isEmpty())
			errors.put("buyer_pw", Boolean.TRUE);

		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}

		try {
			BuyUser buyuser = loginService.login(buyer_id, buyer_pw);
			req.getSession().setAttribute("authUser", buyuser);
			req.getSession().setAttribute("authUserId", buyuser.getBuyer_id());
			req.getSession().setAttribute("authUserName",buyuser.getBuyer_name());
			res.sendRedirect(req.getContextPath() + "/index.do");
			return null;
		} catch (LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		}
	}

	private String trim(String str) {
		return str == null ? null : str.trim();
	}

}
