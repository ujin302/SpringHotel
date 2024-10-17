package user.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import user.bean.UserDTO;

public interface UserService {

	public String login(HttpSession session);

	public UserDTO loginNaver(Map<String, String> map, HttpSession session);
	
}
