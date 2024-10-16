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
    	 return roomDAO.getRoomById(roomId);
    }

    @Override
    public List<RoomImgDTO> getRoomImagesByRoomId(int roomId) {
        return roomDAO.getRoomImagesByRoomId(roomId);  // 이미지 정보 가져옴
    }
    
}
