package spring.conf;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

import lombok.Getter;
import lombok.Setter;

@Configuration
@PropertySource("classpath:naver/login.properties")
@Getter
@Setter
public class NaverLoginConfiguration {
	public @Value("${naver.clientID}") String clientID;
	private @Value("${naver.clientSecret}") String clientSecret;
	private @Value("${naver.callbackURL}") String callbackURL;
}
