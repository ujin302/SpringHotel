package user.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import spring.conf.NaverLoginConfiguration;

public interface UserNaverLoginService {
	public String naverLogin(HttpSession session);

	public void loginNaver(Map<String, String> map, HttpSession session);
}
