package user.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
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
		System.out.println("session: " + session.getAttribute("userName"));
		return "user/join";
	}
	
	@RequestMapping(value = "/join/submit")
	@ResponseBody
	public String joinDB(HttpSession session) {
		System.out.println("/join/submit");
		
		return "회원가입 완료 / 실패";
	}
	
	@RequestMapping(value = "/login")
	public String login(HttpSession session, ModelMap map) {
		String apiURL = userService.login(session);
		map.addAttribute("apiURL", apiURL);
		
		return "user/login";
	}
	
	@RequestMapping(value = "/login/sh")
	public String loginSH() {
		
		return "index";
	}
	
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
	
	@RequestMapping(value = "/logout/naver")
	public String logoutNaver(@RequestParam Map<String, String> map, HttpSession session) {
		// 콜백 처리
		userService.loginNaver(map, session);
		
		return "index";
	}
		
}
