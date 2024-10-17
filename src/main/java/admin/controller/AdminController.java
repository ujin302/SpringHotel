package admin.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import admin.service.AdminService;
import answer.bean.AnswerDTO;
import questions.bean.QuestionsDTO;
import room.bean.RoomDTO;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value="admin/login")
	public String login() {
	    return "/admin/login";
	}
	
	@RequestMapping(value = "admin/loginForm", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	@ResponseBody
	public String adminLogin(@RequestParam String adminId, @RequestParam String pwd, HttpSession session, Model model) {
	    boolean adminCheck = adminService.adminCheck(adminId, pwd);
	    System.out.println("adminId = " + adminId);
	    System.out.println("pwd = " + pwd);
	    System.out.println("adminCheck = " + adminCheck);
	    if (adminCheck) {
	        session.setAttribute("adminId", adminId); // 세션에 adminId 저장
	        return "로그인에 성공하였습니다.";
	    } else {
	        return "아이디 또는 비밀번호가 틀렸습니다."; 
	    }
	}
	
	@RequestMapping(value="admin/updateRoom")
	public String updateRoom(Model model) {
	    List<RoomDTO> roomList = adminService.getRoomList();
	    model.addAttribute("roomList", roomList);
	    return "/admin/updateRoom";
	}
	
	@RequestMapping(value="admin/updateRoomInfo", method = RequestMethod.GET)
	public String updateRoomInfo(@RequestParam String type, Model model) {
		RoomDTO roomDTO = adminService.getRoomDTO(type);
		model.addAttribute("roomDTO", roomDTO);
		
		return "/admin/updateRoomInfo";
	}
	
	@RequestMapping(value = "admin/update", produces = "text/html; charset=UTF-8")
	public String update(@ModelAttribute RoomDTO roomDTO, @RequestParam("img") MultipartFile img, Model model) {
	    System.out.println("roomDTO = " + roomDTO);
	    System.out.println("img = " + img);
	    
	    adminService.update(roomDTO, img);
	    
	    List<RoomDTO> roomList = adminService.getRoomList();
	    model.addAttribute("roomList", roomList);
	    
	    // updateRoom.jsp로 이동
	    return "admin/updateRoom";
	}

	@RequestMapping(value="admin/checkReserve", method = RequestMethod.GET)
	public String checkReserve(@RequestParam(required = false, defaultValue = "1") String pg, Model model) {
		Map<String, Object> map2 = adminService.checkReserve(pg);
		
		map2.put("pg", pg);
		model.addAttribute("map2", map2);
		return "/admin/checkReserve";
	}
	
	@RequestMapping(value="admin/checkUser", method = RequestMethod.GET)
	public String checkUser(@RequestParam(required = false, defaultValue = "1") String pg, Model model) {
		Map<String, Object> map2 = adminService.checkUser(pg);
		
		map2.put("pg", pg);
		model.addAttribute("map2", map2);
		
		System.out.println("mape2 = " + map2);
		return "/admin/checkUser";
	}
	
	@RequestMapping(value="admin/inquiryList", method = RequestMethod.GET)
	public String inquiryList(@RequestParam(required = false, defaultValue = "1") String pg, Model model) {
		Map<String, Object> map2 = adminService.inquiryList(pg);
		
		map2.put("pg", pg);
		model.addAttribute("map2", map2);
		return "/admin/inquiryList";
	}
	
	
	@RequestMapping(value="admin/inquiryDetail", method = RequestMethod.GET)
	public String inquiryDetail(@RequestParam String questionsId, String typename, String writerId, HttpSession session,Model model) {
	    QuestionsDTO questionsDTO = adminService.getQuestionsDTO(questionsId);
	    String adminId = (String) session.getAttribute("adminId");
	    
	    // 댓글 목록 조회
	    List<AnswerDTO> comments = adminService.getCommentsByQuestionId(Integer.parseInt(questionsId));
	    
	    model.addAttribute("questionsDTO", questionsDTO);
	    model.addAttribute("typename", typename);
	    model.addAttribute("writerId", writerId);
	    model.addAttribute("comments", comments); 
	    model.addAttribute("adminId", adminId); 
	    
	    
	    System.out.println("comments = " + comments);
	    System.out.println(questionsDTO);
	    return "/admin/inquiryDetail";
	}

	@RequestMapping(value="admin/inquiryDetail2", method = RequestMethod.GET)
	public String inquiryDetail2(@RequestParam String questionsId, String typename, String writerId, HttpSession session,Model model) {
	    QuestionsDTO questionsDTO = adminService.getQuestionsDTO(questionsId);
	    String adminId = (String) session.getAttribute("adminId");
	    
	    // 댓글 목록 조회
	    List<AnswerDTO> comments = adminService.getCommentsByQuestionId(Integer.parseInt(questionsId));
	    
	    model.addAttribute("questionsDTO", questionsDTO);
	    model.addAttribute("typename", typename);
	    model.addAttribute("writerId", writerId);
	    model.addAttribute("comments", comments); 
	    model.addAttribute("adminId", adminId); 
	    
	    
	    System.out.println("comments = " + comments);
	    System.out.println(questionsDTO);
	    return "/inquiry/inquiryDetail";
	}
	
	@RequestMapping(value="admin/writeComment")
	@ResponseBody
	public String writeComment(@RequestParam AnswerDTO answerDTO, HttpSession session) {
	    try {
	        adminService.writeComment(answerDTO);
	        return "success";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "fail";
	    }
	}
	
	@RequestMapping(value = "admin/writeComment", method = RequestMethod.POST)
	@ResponseBody
	public String writeComment(@RequestParam int questionsId, 
	                           @RequestParam int userId, 
	                           @RequestParam String comment, HttpSession session) {
	    String adminId = (String) session.getAttribute("adminId");
	    System.out.println("questionsId = " + questionsId);
	    System.out.println("userId = " + userId);
	    System.out.println("comment = " + comment);
	    System.out.println("adminId = " + adminId);
	    
	    AnswerDTO answerDTO = new AnswerDTO();
	    answerDTO.setQuestionsId(questionsId);
	    answerDTO.setUserId(userId);
	    answerDTO.setComment(comment);
	    answerDTO.setAdminId(adminId);

	    try {
	        adminService.writeComment(answerDTO);
	        return "success"; 
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "fail";
	    }
	}


	@RequestMapping(value="admin/updateComment", method = RequestMethod.POST)
	@ResponseBody
	public String updateComment(@RequestParam int answerId, @RequestParam String comment) {
	    try {
	        adminService.updateComment(answerId, comment);
	        return "success";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "fail";
	    }
	}

	@RequestMapping(value="admin/deleteComment", method = RequestMethod.GET)
	@ResponseBody
	public String deleteComment(@RequestParam int answerId) {
	    try {
	        adminService.deleteComment(answerId);
	        return "success";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "fail";
	    }
	}
	
	//------------------------------------------------------------------------------
	@RequestMapping(value="admin/inquiryWrite", method = RequestMethod.GET)
	public String inquiryWrite() {
		return "/inquiry/inquiryWrite";
	}
	
	@PostMapping("/questions/save")
	@ResponseBody
	public String saveQuestion(@RequestParam("qtypesId") int qtypesId,
	                    @RequestParam("content") String content,
	                    HttpSession session) {
		// 세션에서 userId 가져오기
		Integer userId = (Integer) session.getAttribute("userId");
		
		// QuestionsDTO 객체 생성
		QuestionsDTO questionsDTO = new QuestionsDTO();
		questionsDTO.setUserId(userId);
		questionsDTO.setContent(content);
		questionsDTO.setQtypesId(qtypesId);
		
		// 데이터베이스에 저장
		adminService.saveQuestion(questionsDTO);
		
		return "success"; // AJAX 성공 응답
	}
	
	@RequestMapping(value="admin/inquiryUpdate", method = RequestMethod.GET)
	public String inquiryUpdate(@RequestParam("typename") String typename,
            					@RequestParam("content") String content,
            					@RequestParam("questionsId") String questionsId,
            					Model model) {
		System.out.println("typename = " + typename);
		System.out.println("content = " + content);
		System.out.println("questionsId = " + questionsId);
		model.addAttribute("typename", typename);
		model.addAttribute("content", content);
		model.addAttribute("questionsId", questionsId);
		return "/inquiry/inquiryUpdate";
	}
    
	@RequestMapping(value="admin/inquiryList2", method = RequestMethod.GET)
	public String inquiryList2(@RequestParam(required = false, defaultValue = "1") String pg, Model model) {
		Map<String, Object> map2 = adminService.inquiryList(pg);
		
		map2.put("pg", pg);
		model.addAttribute("map2", map2);
		return "/inquiry/inquiryList";
	}
	
	@RequestMapping(value = "inquiry/update", method = RequestMethod.POST)
	public String updateInquiry(@RequestParam("typename") int typename,
	                            @RequestParam(value = "questionsId", required = false) String questionsIdStr,
	                            @RequestParam("content") String content,
	                            Model model) {
	    if (questionsIdStr == null || questionsIdStr.isEmpty()) {
	        throw new IllegalArgumentException("questionsId는 필수입니다."); // 예외 처리
	    }
	    
	    int questionsId = Integer.parseInt(questionsIdStr); // 문자열을 정수로 변환
	    adminService.updateInquiry(questionsId, typename, content); // 서비스 호출

	    // 성공적으로 업데이트된 후의 로직
	    return "redirect:/inquiryList.jsp";  // 수정 후 목록으로 리다이렉트
	}

}
