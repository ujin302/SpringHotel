package room.service;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import room.bean.RoomDTO;
import room.dao.ReserveDAO;
import room.dao.RoomDAO;

@Service
public class ReserveServiceImpl implements ReserveService {
    @Autowired
    private RoomDAO roomDAO;
    @Autowired
    private ReserveDAO reserveDAO;

	@Override
	public List<RoomDTO> getRoomList() throws Exception {
		return roomDAO.getAllRooms();
	}

	@Override
	public ArrayList<RoomDTO> getFindRoomList(Map<String, String> map) {
		System.out.println("/findRoom: " + map.toString());
		
		int kids = Integer.parseInt(map.get("kids"));
		int adults = Integer.parseInt(map.get("adults"));
		
		map.put("people", kids + adults + "");
		ArrayList<RoomDTO> findRoomList = reserveDAO.findRoomList(map);
		
		for (RoomDTO roomDTO : findRoomList) {
			System.out.println(roomDTO.toString());
		}
		System.out.println(findRoomList == null);
		System.out.println(findRoomList.size());
		return findRoomList;
	}
    
}
