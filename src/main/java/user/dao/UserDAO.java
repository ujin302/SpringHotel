package user.dao;

import org.apache.ibatis.annotations.Mapper;

import user.bean.UserDTO;

@Mapper
public interface UserDAO {

	public String checkUserId(String userId);

	public void joinUser(UserDTO userDTO);
	
}
