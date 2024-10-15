package user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	 */
	
	@RequestMapping(value = "/joinForm")
	public String joinForm(HttpSession session) {
		
		return "user/joinForm";
	}
	
	@RequestMapping(value = "/join")
	public String join(HttpSession session) {
		
		return "user/join";
	}
	
	@RequestMapping(value = "/login")
	public String login(HttpSession session, ModelMap map) {
		userService.login(session);
		//map.addAttribute("apiURL", );
		
		return "user/login";
	}
	@RequestMapping(value = "/login/sh")
	public String loginSH() {
		
		return "index";
	}
	
	@RequestMapping(value = "/login/naver")
	public String loginNaver(@RequestParam String code) {
		System.out.println("Naver code: " + code);
		
		return "index";
	}
}
