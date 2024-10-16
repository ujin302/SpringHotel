package admin.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import room.bean.RoomDTO;

public interface AdminService {

	public Map<String, Object> checkUser(String pg);

	public List<RoomDTO> getRoomList();

	public RoomDTO getRoomDTO(String type);

	public void update(RoomDTO roomDTO, MultipartFile img);

}
