package admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import room.bean.RoomDTO;
import user.bean.UserDTO;

@Mapper
public interface AdminDAO {

	public List<UserDTO> checkUser(Map<String, Integer> map);

	public int getTotalA();

	public List<RoomDTO> getRoomList();

	public RoomDTO getRoomDTO(String type);

}
