package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.model.Article;
import article.service.ArticleContentNotFoundException;
import article.service.ArticleData;
import article.service.ArticleNotFoundException;
import article.service.DeleteArticleService;
import article.service.ReadArticleService;
import mvc.command.CommandHandler;

public class DeleteArticleHandler implements CommandHandler {
	private ReadArticleService readService = new ReadArticleService();
	private DeleteArticleService deleteService = new DeleteArticleService();

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) 
			throws Exception {
		String noVal = req.getParameter("no");
		int articleNum = Integer.parseInt(noVal);
		ArticleData articleData = readService.getArticle(articleNum);
		String authUseId =(String)req.getSession().getAttribute("authUserId");
		if (!canModify(authUseId, articleData)) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
		try {
			System.out.println("handler_before");
			deleteService.deleteArticle(articleNum);
			System.out.println("handler_after");
			return "/WEB-INF/view/article/deleteSuccess.jsp";
		} catch (ArticleNotFoundException | ArticleContentNotFoundException e) {
			req.getServletContext().log("no article", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
	}
	
	private boolean canModify(String authUseId, ArticleData articleData) {
		String writerId = articleData.getArticle().getWriter().getId();
		return authUseId.equals(writerId);
	}

}
