package room.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import room.bean.RoomDTO;
import room.bean.RoomImgDTO;
import room.service.RoomService;

import java.util.List;

@Controller
@RequestMapping("/room")
public class RoomController {

    @Autowired
    private RoomService roomService;

    @RequestMapping(value = "/roomView", method = RequestMethod.GET)
    public String getAllRooms(Model model) {
        List<RoomDTO> rooms;
		try {
			rooms = roomService.getAllRooms();
			model.addAttribute("rooms", rooms);  // Model에 rooms 추가
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        return "room/roomView";  // roomView.jsp로 이동
    }
    
    // 특정 객실의 상세 정보 보기
    @RequestMapping(value = "/detail/{roomId}", method = RequestMethod.GET)
    public String roomDetail(@PathVariable("roomId") int roomId, Model model) {
        System.out.println("Room ID: " + roomId);  // roomId가 제대로 넘어오는지 확인
        
        RoomDTO room = roomService.getRoomById(roomId);
        List<RoomImgDTO> roomImages = roomService.getRoomImagesByRoomId(roomId);
        
        if (room == null) {
            System.out.println("Room not found for ID: " + roomId); // 데이터가 없을 경우 확인
        } else {
            System.out.println("Room found: " + room.getType()); // 데이터가 있을 경우 확인
        }

        model.addAttribute("room", room);
        model.addAttribute("roomImages", roomImages);
        return "room/roomDetail";  // roomDetail.jsp로 이동
    }

    
}