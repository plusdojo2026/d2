package dto;

import java.io.Serializable;

public class LoginUser implements Serializable {
	private int id; // ログイン時のID

	public int getId() {
		return id;
	}

	public void setUserId(int id) {
		this.id = id;
	}

	public LoginUser() {
	}

	public LoginUser(int id) {
		this.id = id;
	}
}
