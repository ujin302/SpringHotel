package admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import room.bean.ReserveDTO;
import room.bean.RoomDTO;
import room.bean.RoomImgDTO;
import user.bean.UserDTO;

@Mapper
public interface AdminDAO {

	public List<UserDTO> checkUser(Map<String, Integer> map);

	public int getTotalA();

	public List<RoomDTO> getRoomList();

	public RoomDTO getRoomDTO(String type);

	// 객실 정보 업데이트
    public void updateRoom(RoomDTO roomDTO);

    // 객실 이미지 정보 업데이트
    public void updateRoomImg(RoomImgDTO roomImgDTO);

	public RoomImgDTO getRoomImgDTO(String roomId);

	public List<RoomDTO> getRoomListWithImages();

	public List<ReserveDTO> checkReserve(Map<String, Integer> map);

	public int getTotalB();
}
