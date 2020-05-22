package article.service;

import java.util.Map;

import article.model.Writer;

public class WriteRequest {

	private Writer writer;
	private String qna_title;
	private String qna_question;

	public WriteRequest(Writer writer, String qna_title, String qna_question) {
		this.writer = writer;
		this.qna_title =qna_title;
		this.qna_question = qna_question;
	}

	public Writer getWriter() {
		return writer;
	}

	public String getQna_title() {
		return qna_title;
	}

	public String getqna_question() {
		return qna_question;
	}

	public void validate(Map<String, Boolean> errors) {
		if (qna_title == null || qna_title.trim().isEmpty()) {
			errors.put("qna_title", Boolean.TRUE);
		}
	}
}
