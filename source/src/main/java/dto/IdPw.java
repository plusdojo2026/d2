package dto;

import java.io.Serializable;

public class IdPw implements Serializable {
	private int id;
	private String user_id; // ID
	private String password; // パスワード

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public IdPw(String user_id, String password) {
		this.user_id = user_id;
		this.password = password;
	}

	public IdPw() {
		this.id = 0;
		this.user_id = "";
		this.password = "";
	}

}
