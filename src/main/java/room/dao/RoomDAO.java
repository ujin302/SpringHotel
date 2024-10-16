package room.dao;

import org.apache.ibatis.annotations.Mapper;
import room.bean.RoomDTO;
import room.bean.RoomImgDTO;

import java.util.List;

@Mapper
public interface RoomDAO {
	
    public List<RoomDTO> getAllRooms() throws Exception;

	public RoomDTO getRoomById(int roomId);

	public List<RoomImgDTO> getRoomImagesByRoomId(int roomId);
	    
    
}
