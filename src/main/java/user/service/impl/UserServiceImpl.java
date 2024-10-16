package user.service.impl;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.conf.NaverLoginConfiguration;
import user.service.UserNaverLoginService;
import user.service.UserService;


@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserNaverLoginService naverLoginService;
	
	@Override
	public String login(HttpSession session) {
		String apiURL = naverLoginService.naverLogin(session);
		
		return apiURL;
	}

	@Override
	public void loginNaver(Map<String, String> map, HttpSession session) {
		naverLoginService.loginNaver(map, session);
	}
	
}
