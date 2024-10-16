package user.service.impl;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;

import spring.conf.NaverLoginConfiguration;
import spring.conf.SpringConfiguration;
import user.bean.UserDTO;
import user.dao.UserDAO;
import user.service.UserNaverLoginService;

public class UserNaverLoginServiceImpl implements UserNaverLoginService {

	@Override
	public String naverLogin(NaverLoginConfiguration loginConfiguration) {
		String clientId = loginConfiguration+""  ;//애플리케이션 클라이언트 아이디값";
	    String redirectURI;
	    String apiURL = null;
		try {
			redirectURI = URLEncoder.encode("http://localhost:8080/SpringHotel/user/login/naver", "UTF-8");
			SecureRandom random = new SecureRandom();
		    String state = new BigInteger(130, random).toString();
		    apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
		    apiURL += "&client_id=" + clientId;
		    apiURL += "&redirect_uri=" + redirectURI;
		    apiURL += "&state=" + state;
		   // session.setAttribute("state", state);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return apiURL;
	}
	
}
