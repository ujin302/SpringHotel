package user.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import user.bean.UserDTO;
import user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {
	@Autowired
	private UserService userService;

	
	/*
	 * 1. 회원가입 
	 * 2. 로그인 - SH, Naver
	 * 3. 마이페이지
	 * 4. 회원정보 수정
	 * 5. id 중복 체크
	 */
	
	@RequestMapping(value = "/join")
	public String join(HttpSession session) {
		System.out.println("/join");
		
		return "user/join";
	}
	
	@RequestMapping(value = "/join/submit", method = RequestMethod.POST)
	@ResponseBody
	public void joinSubmit(@ModelAttribute UserDTO userDTO) {
		System.out.println("/join/submit");
		System.out.println(userDTO.toString());
		userService.joinSubmit(userDTO);
	}
	
	// 로그인 화면 출력
	@RequestMapping(value = "/login")
	public String login(HttpSession session, ModelMap map) {
		String apiURL = userService.login(session);
		map.addAttribute("apiURL", apiURL);
		
		return "user/login";
	}
	
	// SH 로그인 처리
	@RequestMapping(value = "/login/sh")
	@ResponseBody
	public Boolean loginSH(@RequestParam Map<String, String> map, HttpSession session) {
		Boolean isLogin = false;
		isLogin = userService.loginSH(map, session);
		
		return isLogin;
	}
	
	// Naver 로그인 처리
	@RequestMapping(value = "/login/naver")
	public String loginNaver(@RequestParam Map<String, String> map, HttpSession session, ModelMap mMap) {
		// 1. 콜백 처리
		UserDTO userDTO = userService.loginNaver(map, session);
		mMap.addAttribute("userDTO", userDTO);
		
		// 2. 신규 or 기존 사용자
		if(userDTO == null) { // 기존 사용자
			return "index";
		}else { // 신규 사용자
			return "user/join";
		}
	}
	
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "index";
	}
	
	@RequestMapping(value = "/checkUserId")
	@ResponseBody
	public boolean checkUserId(@RequestParam String userId) {
		boolean isUseUserId = userService.checkUserId(userId);
		return isUseUserId;
	}
		
}
