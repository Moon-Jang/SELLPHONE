package seller.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import seller.service.DuplicateIdException;
import seller.service.JoinRequest;
import seller.service.JoinService;

public class JoinHandler implements CommandHandler {

	private static final String FORM_VIEW = "/WEB-INF/view/Login/SellerSignup.jsp";
	private JoinService joinService = new JoinService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) {
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
		System.out.println("processForm 실행");
		return FORM_VIEW;
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		System.out.println("process submit 실행");
		JoinRequest joinReq = new JoinRequest();
		joinReq.setSeller_id(req.getParameter("seller_id"));
		joinReq.setSeller_name(req.getParameter("seller_name"));
		joinReq.setSeller_pw(req.getParameter("seller_pw"));
		joinReq.setSeller_confirmPw(req.getParameter("seller_confirmPw"));
		joinReq.setSeller_address(req.getParameter("seller_address"));
		joinReq.setSeller_email(req.getParameter("seller_email"));
		joinReq.setSeller_phone(req.getParameter("seller_phone"));
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		joinReq.validate(errors);
		
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			joinService.join(joinReq);
			return "/WEB-INF/view/Login/SellerCom.jsp";
		} catch (DuplicateIdException e) {
			errors.put("duplicateId", Boolean.TRUE);
			return FORM_VIEW;
		}
	}

}
