package product.command;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.command.CommandHandler;
import product.service.ProductPage;
import product.service.ListProductService;

public class ListProductHandler implements CommandHandler {

	private ListProductService listProduct = new ListProductService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
			throws Exception {
		String pageNoVal = req.getParameter("pageNo");
		int pageNo = 1;
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		ProductPage productPage = listProduct.getProductPage(pageNo);
		req.setAttribute("ProductPage", productPage);
		return "/WEB-INF/view/OneTech/ListProduct.jsp";
	}

}
