package article.service;

import article.model.Article;

public class ArticleData {

	private Article article;
	private String qna_question;

	public ArticleData(Article article,String qna_question) {
		this.article = article;
		this.qna_question=qna_question;
	}

	public Article getArticle() {
		return article;
	}

	public String getQna_question() {
		return qna_question;
	}
	
}
