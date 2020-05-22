package article.model;

import java.util.Date;

public class Article {

	private int Qna_idx;
	private Writer writer;
	private String qna_title;
	private String qna_question;
	private String qna_answer;
	private Date qna_date;

	public Article(Writer writer, String qna_title, 
			String qna_question, String qna_answer, Date qna_date) {
		this.writer = writer;
		this.qna_title = qna_title;
		this.qna_question = qna_question;
		this.qna_answer = qna_answer;
		this.qna_date = qna_date;
	}

	public int getQna_idx() {
		return Qna_idx;
	}

	public void setQna_idx(int qna_idx) {
		Qna_idx = qna_idx;
	}

	public Writer getWriter() {
		return writer;
	}

	public void setWriter(Writer writer) {
		this.writer = writer;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_question() {
		return qna_question;
	}

	public void setQna_question(String qna_question) {
		this.qna_question = qna_question;
	}

	public String getQna_answer() {
		return qna_answer;
	}

	public void setQna_answer(String qna_answer) {
		this.qna_answer = qna_answer;
	}

	public Date getQna_date() {
		return qna_date;
	}

	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}

}
