package admin.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import admin.bean.AdminPaging;
import admin.dao.AdminDAO;
import admin.service.AdminService;
import room.bean.RoomDTO;
import user.bean.UserDTO;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;
	
	@Autowired
	private AdminPaging adminPaging;
	@Override
	public Map<String, Object> checkUser(String pg) {
		//1페이지당 5개씩
		int startNum = (Integer.parseInt(pg)-1) * 5; //시작위치 (0부터 시작)
		int endNum = 5; //개수
		
		Map<String, Integer> map = new HashedMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		//DB
		List<UserDTO> list = adminDAO.checkUser(map);
		
		//페이징 처리
		int totalA = adminDAO.getTotalA(); //총글수
		
		adminPaging.setCurrentPage(Integer.parseInt(pg)); //현재페이지
		adminPaging.setPageBlock(3);
		adminPaging.setPageSize(5);
		adminPaging.setTotalA(totalA);
		adminPaging.makePagingHTML();
		
		Map<String, Object> map2 = new HashedMap<>();
		map2.put("list", list);
		map2.put("adminPaging", adminPaging);
		
		return map2;
	}
	@Override
	public List<RoomDTO> getRoomList() {
		List<RoomDTO> list = adminDAO.getRoomList();
		return list;
	}
	@Override
	public RoomDTO getRoomDTO(String type) {
		return adminDAO.getRoomDTO(type);
	}
	@Override
	public void update(RoomDTO roomDTO, MultipartFile img) {
		// TODO Auto-generated method stub
		
	}
}
