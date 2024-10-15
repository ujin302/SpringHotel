package user.service.impl;
import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.SecureRandom;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Override
	public void login(HttpSession session) {
		
	}
	
}
