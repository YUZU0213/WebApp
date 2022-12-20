package beans;

import java.io.Serializable;

public class ProfileBean implements Serializable {
	private String comment;
	private String profileImg;
	private String tec;
	private String common;
	private String e_mail;

	public ProfileBean() {
		// TODO 自動生成されたコンストラクター・スタブ
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getTec() {
		return tec;
	}

	public void setTec(String tec) {
		this.tec = tec;
	}

	public String getCommon() {
		return common;
	}

	public void setCommon(String common) {
		this.common = common;
	}

	public String getE_mail() {
		return e_mail;
	}

	public void setE_mail(String e_mail) {
		this.e_mail = e_mail;
	}

}
