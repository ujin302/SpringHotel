package room.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.ui.ModelMap;

import room.bean.ReserveDTO;
import room.bean.RoomDTO;

public interface ReserveService {

	public ArrayList<RoomDTO> getFindRoomList(Map<String, String> map);

	public ReserveDTO setReserveDTO(Map<String, String> mMap);

	public void submitReserve(ReserveDTO reserveDTO);

}
