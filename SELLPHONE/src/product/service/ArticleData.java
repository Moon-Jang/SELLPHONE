package product.service;

import product.model.Product;
import product.model.ArticleContent;

public class ArticleData {

	private Product article;
	private ArticleContent content;

	public ArticleData(Product article, ArticleContent content) {
		this.article = article;
		this.content = content;
	}

	public Product getArticle() {
		return article;
	}

	public String getContent() {
		return content.getContent();
	}

}
