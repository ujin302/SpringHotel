package room.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import room.bean.ReserveDTO;
import room.bean.RoomDTO;

public interface ReserveService {

	public List<RoomDTO> getRoomList() throws Exception;

	public ArrayList<RoomDTO> getFindRoomList(Map<String, String> map);

	public ReserveDTO getReserveInfo(Map<String, String> map);

}
