package user.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

public interface UserService {

	public String login(HttpSession session);

	public void loginNaver(Map<String, String> map, HttpSession session);
	
}
