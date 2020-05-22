package article.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import article.model.Writer;
import article.service.WriteArticleService;
import article.service.WriteRequest;
import buyauth.service.BuyUser;
import mvc.command.CommandHandler;

public class WriteArticleHandler implements CommandHandler {
	private static final String FORM_VIEW = "/WEB-INF/view/article/newArticleForm.jsp";
	private WriteArticleService writeService = new WriteArticleService();
	
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
		return FORM_VIEW;
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);

		BuyUser buyuser = (BuyUser)req.getSession(false).getAttribute("authUser");
		WriteRequest writeReq = createWriteRequest(buyuser, req);
		writeReq.validate(errors);
		
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		
		int newArticleNo = writeService.write(writeReq);
		req.setAttribute("newArticleNo", newArticleNo);
		 
		
		return "/WEB-INF/view/article/newArticleSuccess.jsp";
	}

	private WriteRequest createWriteRequest(BuyUser buyuser, HttpServletRequest req) {
		return new WriteRequest(
				new Writer((String)(req.getSession().getAttribute("authUserId")),
						(String)(req.getSession().getAttribute("authUserName"))),
				req.getParameter("qna_title"),
				req.getParameter("qna_question"));
	}
}
