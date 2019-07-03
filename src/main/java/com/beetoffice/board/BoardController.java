package com.beetoffice.board;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.beetoffice.user.UserVO;




@Controller
//"board"라는 이름의 Model 이 있으면 session에 저장
@SessionAttributes("board") //모델에 값을 넣어 세션에 저장?
public class BoardController {
	@Autowired //일치 타입이 하나여야만 한다, 예전에 컨트롤러 타입?으로 찾던걸 오토와이어드로 찾는다
	private BoardService boardService; //이 변수 명과 @서비스의 변수명이 같아야 서비스로 이동
	
	//메소드에 설정된 @ModelAttribute 는 리턴된 데이타를 View에 전달
	//@ModelAttribute 선언된 메소드는  
	//@RequestMapping 선언된 메소드보다 먼저 실행된다
	//뷰에 전달될 때 설정된 명칭(예: conditionMap)으로 전달
	@ModelAttribute("conditionMap") //뭔가가 들어오는 객체가 아니라 보내기 위한 준비 작업
	public Map<String, String> searchConditionMap() {
		//key: 제목, value: TITLE
		//key: 내용, value: CONTENT
		Map<String, String> conditionMap = new HashMap<>();
		conditionMap.put("제목", "TITLE");
		conditionMap.put("내용", "CONTENT"); //단지 getboardlist.jsp에서 검색 옵션을 보여주기 위한것 
		
		return conditionMap;
	}
	
	@RequestMapping("/getBoardInsert.do")
	public String getBoardInsert(BoardVO vo, HttpSession session) {
		System.out.println(">>>조회수를 위한것 - getBoardInsert.do");
		System.out.println("수정요청 vo : " + vo);
		int a = vo.getSeq();
		String b = String.valueOf(a);
		session.setAttribute("mySeq", b);
		boardService.getBoardInsert(vo);
		return "redirect:getBoard.do";
	}
	
	//리턴타입 ModleAndView -> String 변경 통일
	//데이타 저장타입 : ModleAndView -> Model
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model, HttpSession session) {
		System.out.println(">>> 글 상세 조회 처리 - getBoard()");
		String a = (String) session.getAttribute("mySeq");
		vo.setSeq(Integer.parseInt(a));
		model.addAttribute("board", boardService.getBoard(vo)); //데이타 저장
		
		return "board/getBoard";
	}
	
	//리턴타입 ModleAndView -> String 변경 통일
	//데이타 저장타입 : ModleAndView -> Model
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, 
			Model model) {
		System.out.println(">>> 글 목록 조회 처리- getBoardList()");
	
		
		//전체 데이타 조회(검새조건 적용)
		List<BoardVO> boardList = boardService.getBoardList(vo);
		
		model.addAttribute("boardList", boardList);
		
		return "board/getBoardList";
	}	
	
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo, HttpSession session) 
			throws IllegalStateException, IOException {
		System.out.println(">>> 글 등록 처리 - insertBoard()");
		vo.setCnt(0);
		String a = (String) session.getAttribute("user_id");
		String b = (String) session.getAttribute("dept");
		String c = (String) session.getAttribute("user_position");
		
		vo.setUser_id(a);
		vo.setDept(b);
		vo.setUser_position(c);
		
		/* ***** 파일 업로드 처리 *************
		 * MultipartFile 인터페이스 주요 메소드
		 * String getOriginalFilename() : 업로드한 파일명
		 * void transferTo(File destFile) : 업로드한 파일을 destFile에 저장
		 * boolean isEmpty() : 업로드한 파일의 존재여부(없으면 true 리턴)
		 */
		MultipartFile uploadFile = vo.getT_imgs();
		System.out.println("uploadFile : " + uploadFile);
		if (!uploadFile.isEmpty()) {//파일이 있으면
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("C:/Users/HB04-01/git/beetPlatform/src/main/resources/static/image/" + fileName));
			
			vo.setT_img(fileName);
		} 
		
		boardService.insertBoard(vo);
		return "redirect:getBoardList.do";
	}
	
	@RequestMapping("/insertBoardf.do")
	public String insertBoardf(BoardVO vo) 
			throws IllegalStateException, IOException {
		System.out.println(">>> 글 등록 처리 - insertBoardf()");
		

		return "board/insertBoard";
	}
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(@ModelAttribute("board") BoardVO vo) {
		System.out.println(">>> 글 수정 처리 - updateBoard()");
		System.out.println("수정요청 vo : " + vo);
		
		boardService.updateBoard(vo);
		return "getBoardList.do";
	}
	
	@RequestMapping("/deleteBoard.do")
	public String deleteBoard(BoardVO vo) {
		System.out.println(">>> 글 삭제 처리 - deleteBoard()");
		boardService.deleteBoard(vo);
		
		return "getBoardList.do";
	}
}