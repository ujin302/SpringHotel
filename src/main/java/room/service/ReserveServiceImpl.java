package room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import room.bean.RoomDTO;
import room.dao.RoomDAO;

@Service
public class ReserveServiceImpl implements ReserveService {
    @Autowired
    private RoomDAO roomDAO;

	@Override
	public List<RoomDTO> getRoomList() throws Exception {
		return roomDAO.getAllRooms();
	}
    
}
