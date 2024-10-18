package room.service;

import java.util.List;

import room.bean.RoomDTO;

public interface ReserveService {

	List<RoomDTO> getRoomList() throws Exception;

}
