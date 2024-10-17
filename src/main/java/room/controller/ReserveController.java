package room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	
	@RequestMapping("/menu1")
	public String meun1() {
		
		return "reserve/menu/reservation1";
	}
}
