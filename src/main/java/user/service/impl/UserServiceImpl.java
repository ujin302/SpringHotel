package user.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.conf.NaverLoginConfiguration;
import user.bean.UserDTO;
import user.dao.UserDAO;
import user.service.UserNaverLoginService;
import user.service.UserService;


@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserNaverLoginService naverLoginService;
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public String login(HttpSession session) {
		String apiURL = naverLoginService.naverLogin(session);
		
		return apiURL;
	}

	@Override
	public UserDTO loginNaver(Map<String, String> map, HttpSession session) {
		// 1. 네이버 로그인 정보 추출 
		UserDTO userDTO = naverLoginService.loginNaver(map, session);
		String userId = userDTO.getUserId();
		
		// 2. 신규 사용자 구분
		String checkNaverLoginId = userDAO.checkNaverLoginId(userId);
		if(!userId.equals(checkNaverLoginId)) { 
			// 2-1. 신규 사용자: 회원가입 진행 
			return userDTO;
		} else { 
			// 2-2. 기존 사용자: 로그인 완료
			session.setAttribute("userSeq", userDTO.getSeq());
			session.setAttribute("userName", userDTO.getName());
			return null;
		}
	}

	@Override
	public Boolean loginSH(Map<String, String> map, HttpSession session) {
		// 1. 로그인 정보 확인
		UserDTO userDTO = userDAO.loginSH(map);
		System.out.println("loginSH(): " + map.toString());
		
		// 2. 로그인 성공&실패 확인
		if(userDTO != null) {
			session.setAttribute("userSeq", userDTO.getSeq());
			session.setAttribute("userName", userDTO.getName());
			return true;
		} else return false;
		
	}
	
}
