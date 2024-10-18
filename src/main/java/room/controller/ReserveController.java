package room.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import room.bean.RoomDTO;
import room.service.ReserveService;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	@Autowired
	ReserveService reserveService;
	
	// 예약 화면 보여주기
	@RequestMapping(value = "/main")
	public String main(ModelMap mMap) {
		return "reserve/menu1";
	}
	
	// 조건에 맞는 객실 확인
	@RequestMapping(value = "/findRoom", method = RequestMethod.POST)
	@ResponseBody
	public boolean findRoom(@RequestParam Map<String, String> map) {
		ArrayList<RoomDTO> findRoomList = reserveService.getFindRoomList(map);
		
		// 예약 가능 객실 없음
		if(findRoomList == null || findRoomList.size() == 0) return false;
		
		// 예약 가능 객실 있음
		return true;
	}
	
	@RequestMapping(value = "/menu2")
	public String menu2(@RequestParam Map<String, String> map, ModelMap mMap) {
		ArrayList<RoomDTO> roomList = reserveService.getFindRoomList(map);
		mMap.addAttribute("roomList", roomList);
		
		return "reserve/menu2";
	}
}