package room.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import room.bean.RoomDTO;

@Mapper
public interface ReserveDAO {
	public ArrayList<RoomDTO> findRoomList(Map<String, String> map);
}
