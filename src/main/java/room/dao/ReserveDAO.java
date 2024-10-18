package room.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReserveDAO {
	public HashMap<String, String> findRoom(HashMap<String, String> map);
}
