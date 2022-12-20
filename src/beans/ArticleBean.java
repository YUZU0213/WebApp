package beans;

import java.io.Serializable;

public class ArticleBean implements Serializable {
	private String id;
	private String keywords;
	private String description;
	private String headerTitle;
	private String headerArticle;
	private String contentsTitle;
	private String contentsArticle;

	public ArticleBean() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getHeaderTitle() {
		return headerTitle;
	}

	public void setHeaderTitle(String headerTitle) {
		this.headerTitle = headerTitle;
	}

	public String getHeaderArticle() {
		return headerArticle;
	}

	public void setHeaderArticle(String headerArticle) {
		this.headerArticle = headerArticle;
	}

	public String getContentsTitle() {
		return contentsTitle;
	}

	public void setContentsTitle(String contentsTitle) {
		this.contentsTitle = contentsTitle;
	}

	public String getContentsArticle() {
		return contentsArticle;
	}

	public void setContentsArticle(String contentsArticle) {
		this.contentsArticle = contentsArticle;
	}

}
