package product.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import product.model.Producter;

import product.service.WriteProductRequest;
import product.service.WriteProductService;


public class WriteProductHandler implements CommandHandler {
	private static final String FORM_VIEW = "/WEB-INF/view/OneTech/registerForm.jsp";
	private WriteProductService writeService = new WriteProductService();
	
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

		WriteProductRequest writeReq = createWriteRequest(req);
		writeReq.validate(errors);
		
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		int newArticleNo = writeService.write(writeReq);
		req.setAttribute("newArticleNo", newArticleNo);
		
		return "/WEB-INF/view/Login/SellerCom.jsp";
	}

	private WriteProductRequest createWriteRequest(HttpServletRequest req) {
		return new WriteProductRequest(
				new Producter((String)(req.getSession().getAttribute("authUserId")),
						(String)(req.getSession().getAttribute("authUserName"))),
				req.getParameter("product_name"),
				req.getParameter("product_content"),
				req.getParameter("product_color"),
				req.getParameter("product_image"),
				req.getParameter("product_price"),
				req.getParameter("product_state"),
				req.getParameter("product_storage")
				);
	}
}
