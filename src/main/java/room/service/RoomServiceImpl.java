package room.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import room.bean.RoomDTO;
import room.bean.RoomImgDTO;
import room.dao.RoomDAO;

import java.util.List;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomDAO roomDAO;

    @Override
    public List<RoomDTO> getAllRooms() throws Exception {
    	 return roomDAO.getAllRooms();
    }
    
    @Override
    public RoomDTO getRoomById(int roomId) {
    	 RoomDTO room = roomDAO.getRoomById(roomId);
    	    if (room == null) {
    	        System.out.println(" DB에 RoomID 가 없는가? : " + roomId);  // 데이터가 없는 경우 확인
    	    }
    	    return room;
    }

    @Override
    public List<RoomImgDTO> getRoomImagesByRoomId(int roomId) {
        return roomDAO.getRoomImagesByRoomId(roomId);  // 이미지 정보 가져옴
    }
    
}