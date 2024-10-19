package room.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.amazonaws.HttpMethod;

import room.bean.ReserveDTO;
import room.bean.RoomDTO;
import room.service.ReserveService;
import room.service.RoomService;

@Controller
@RequestMapping("/reserve")
public class ReserveController {
	@Autowired
	ReserveService reserveService;
	
	// [ 날짜, 인원 선택 화면 ]
	@RequestMapping(value = "/main")
	public String main(ModelMap mMap) {
		return "reserve/menu1";
	}
	
	// 조건에 맞는 객실 확인
	@RequestMapping(value = "/menu2/findRoom", method = RequestMethod.POST)
	@ResponseBody
	public boolean findRoom(@RequestParam Map<String, String> map) {
		ArrayList<RoomDTO> findRoomList = reserveService.getFindRoomList(map);
		
		// 예약 가능 객실 없음
		if(findRoomList == null || findRoomList.size() == 0) return false;
		
		// 예약 가능 객실 있음
		return true;
	}
	
	// [ 객실 정보 화면 ]
	@RequestMapping(value = "/menu2")
	public String menu2(@RequestParam Map<String, String> map, ModelMap mMap) {
		ArrayList<RoomDTO> roomList = reserveService.getFindRoomList(map);
		mMap.addAttribute("roomList", roomList);
		mMap.addAttribute("userInput", map);
		
		return "reserve/menu2";
	}
	
	// [ 예약 정보 화면 ]
	@RequestMapping(value = "/menu3/info")
	public String info() {
		return "reserve/menu3";
	}
	
	// 예약 정보 출력
	@RequestMapping(value = "/menu3")
	public void menu3(@RequestParam Map<String, String> getInfoMap, ModelMap mMap) {
		System.out.println("/menu3");
		System.out.println(getInfoMap);
		
		// 1. 예약 정보 가져오기
		mMap.addAttribute("reserveDTO", reserveService.setReserveDTO(getInfoMap));
	}
	
	// 예약 정보 저장
	@RequestMapping(value = "/menu3/submit", method = RequestMethod.POST)
	@ResponseBody
	public String submit(@RequestParam Map<String, String> getSubmitMap, HttpSession session) {
		System.out.println("/menu3/submit");
		getSubmitMap.put("userSeq", session.getAttribute("userSeq").toString());
		System.out.println(getSubmitMap);
		
		// 예약 정보 저장
		reserveService.submitReserve(getSubmitMap);
		
		return null;
	}
	
	// 사용자 예약 내역 확인
	@RequestMapping(value = "/list")
	public String list(HttpSession session, Model model) {
		System.out.println("/list");
		
		ArrayList<ReserveDTO> reserveDTOList = reserveService.getReserveList(session.getAttribute("userSeq").toString());
		
		model.addAttribute("reserveDTOList", reserveDTOList);
		
		return "reserve/list";
	}
	
	@RequestMapping(value = "/list/detail")
	public String list(@RequestParam String reserveId, Model model) {
		System.out.println("/list/detail");
		
		ReserveDTO reserveDTO = reserveService.getReserveDetali(reserveId);
		model.addAttribute("reserveDTO", reserveDTO);
		
		return "reserve/list/detail";
	}
}