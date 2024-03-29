package com.beetoffice.dpboard;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.beetoffice.board.BoardVO;
import com.beetoffice.board.CommentService;
import com.beetoffice.board.CommentVO;
import com.beetoffice.board.Paging;


@Controller
//"board"라는 이름의 Model 이 있으면 session에 저장
@SessionAttributes("board") //모델에 값을 넣어 세션에 저장?
public class DpBoardController {
	@Autowired //일치 타입이 하나여야만 한다, 예전에 컨트롤러 타입?으로 찾던걸 오토와이어드로 찾는다
	private DpBoardService boardService; //이 변수 명과 @서비스의 변수명이 같아야 서비스로 이동
	

	
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
		conditionMap.put("작성자", "WRITTER");
		return conditionMap;
	}
	
	@RequestMapping("/dpgetBoardInsert.do")
	public String dpgetBoardInsert(DpBoardVO vo, HttpSession session,@RequestParam String curPage,RedirectAttributes redirectAttributes) {
		System.out.println(">>>조회수를 위한것 - getBoardInsert.do");
		System.out.println("수정요청 vo : " + vo);
		int a = vo.getSeq();
		String b = String.valueOf(a);
		session.setAttribute("mySeq", b);
		vo = boardService.dpgetBoard(vo);
		String pd = vo.getT_password();
		//session.setAttribute("c1",curPage);
		

		redirectAttributes.addAttribute("curPage", curPage);
		session.setAttribute("pd", pd);
		return "redirect:dpgetBoard.do";
	}
	
	//리턴타입 ModleAndView -> String 변경 통일
	//데이타 저장타입 : ModleAndView -> Model
	@RequestMapping("/dpgetBoard.do")
	public String dpgetBoard(DpBoardVO vo, Model model, HttpSession session,@RequestParam String curPage,RedirectAttributes redirectAttributes) {
		System.out.println(">>> 글 상세 조회 처리 - getBoard()");
		String a = (String) session.getAttribute("mySeq");
		vo.setSeq(Integer.parseInt(a));
		model.addAttribute("board", boardService.dpgetBoard(vo)); //데이타 저장
		
//		String c1 = (String) session.getAttribute("c1");
//		model.addAttribute("c1", c1);
		model.addAttribute("c1", curPage);
		
		
		
		
		String pd = (String) session.getAttribute("pd");
		vo.setT_password(pd);
		
		if(!"구분".equals(vo.getT_password())) {
			String user_position = (String) session.getAttribute("user_position");
			if("과장".equals(user_position) || "차장".equals(user_position) || "부장".equals(user_position) || "이사".equals(user_position) || "대표이사".equals(user_position)) {
				boardService.dpgetBoardInsert(vo);
				return "dpboard/dpgetBoard";
				
			}else {
				session.setAttribute("secretAgent", "비밀글");
				model.addAttribute("secretmassage", "비밀글");
				redirectAttributes.addAttribute("curPage", curPage);
		            return "redirect:dpgetBoardList.do";
			}
		}
		boardService.dpgetBoardInsert(vo);
		return "dpboard/dpgetBoard";
	}
	

	
	@RequestMapping("/dpupdateBoardf.do")
	public String dpupdateBoardf(DpBoardVO vo, Model model, HttpSession session,@RequestParam String curPage) {
		
		model.addAttribute("board", boardService.dpupdateBoardf(vo));
		model.addAttribute("c3", curPage);
		return "dpboard/dpupdateBoard";
	}
	
	//리턴타입 ModleAndView -> String 변경 통일
	//데이타 저장타입 : ModleAndView -> Model
	@RequestMapping("/dpgetBoardList.do")
	public String dpgetBoardList(DpBoardVO vo, 
			Model model,@RequestParam String curPage, HttpSession session) {
		System.out.println(">>> 글 목록 조회 처리- getBoardList()");
		
		String dept = (String) session.getAttribute("dept");
        vo.setDept(dept);
		//페이지 처리를 위한 Paging 객체 생성해서 값 설정
		Paging p = new Paging();
		//p.setNumPerPage(2);
        
		if("original".equals(vo.getLi())) {
			System.out.println("keyword: -" + vo.getLi() + "-");
        	session.removeAttribute("search");
        	session.removeAttribute("content");
        	session.removeAttribute("writter");
        }else if(!"original".equals(vo.getLi())) {
        	
		if(vo.getSearchKeyword() == null) {
			
        String sea = (String) session.getAttribute("search");
        vo.setSearchKeyword(sea);
        if(session.getAttribute("content") != null) {
        String content = (String) session.getAttribute("content");
        vo.setSearchCondition(content);
        }else if(session.getAttribute("writter") != null) {
        	String writter = (String) session.getAttribute("writter");
        	vo.setSearchCondition(writter);
        }
		}
        }
		
		//1. 전체 게시물의 수를 구하기
		p.setTotalRecord(boardService.dpgetTotalCount(vo));
		p.setTotalPage(); //전체 페이지 갯수 구하기
		
		System.out.println(">전체 건수: "+ p.getTotalRecord());
		System.out.println(">전체 페이지수: "+ p.getTotalPage());
		
		//2. 현재 페이지 구하기(default: 1)
		
		if (curPage != null) {
			p.setNowPage(Integer.parseInt(curPage));
		}
		
		//3. 현재페이지의 시작번호(begin)와 끝번호(end) 구하기
		//끝번호(end) 구하기
		//끝번호(end) = 현재페이지번호 * 페이지당표시글수
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		System.out.println(">>현재페이지: " + p.getNowPage());
		System.out.println(">>시작번호(begin): " + p.getBegin());
		System.out.println(">>시작번호(end): " + p.getEnd());
		
		//4. 블록의 시작페이지, 끝페이지 구하기(현재 페이지 번호 이용)
		int nowPage = p.getNowPage();
		int beginPage = (nowPage - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(p.getBeginPage() + p.getPagePerBlock() - 1);
		
		//endPage 먼저 구하기
		// (현재페이지 / pagePerBlock) 올림처리 * pagePerBlock
		
		System.out.println(">>>현재페이지: " + p.getNowPage());
		System.out.println(">>>시작페이지(beginPage): " + p.getBeginPage());
		System.out.println(">>>끝페이지(endPage): " + p.getEndPage());
		
		System.out.println(">>> 글 목록 조회 처리- getBoardList()");
		System.out.println("condition: " + vo.getSearchCondition());
		System.out.println("keyword: -" + vo.getSearchKeyword() + "-");
		
		//null체크 후 초기값 설정
		if (vo.getSearchCondition() == null) {
			vo.setSearchCondition("TITLE");
		}
		if (vo.getSearchKeyword() == null) {
			vo.setSearchKeyword("");
		}
		System.out.println("null처리후 condition: " + vo.getSearchCondition());
		System.out.println("null처리후 keyword: -" + vo.getSearchKeyword() + "-");
		
		if(!"".equals(vo.getSearchKeyword())) {
		p.setTotalRecord(boardService.dpgetTotalCounts(vo));
		p.setTotalPage(); //전체 페이지 갯수 구하기
		session.setAttribute("search", vo.getSearchKeyword());
		if("CONTENT".equals(vo.getSearchCondition())) {
			session.setAttribute("content", vo.getSearchCondition());
		}else if("WRITTER".equals(vo.getSearchCondition())) {
			session.setAttribute("writter", vo.getSearchCondition());
		}
		}
		//---------
		//4-1 끝페이지(endPage)가 전체페이지수(totalPage) 보다 크면
		//endPage <- totalPage 설정
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		System.out.println("변경후 끝페이지(endPage) : "+ p.getEndPage());

		//현재페이지 기준 게시글 가져오기---------------
		//DB에서 게시글 데이타 가져오기
//		Map<String, Integer> map = new HashMap<>();
//		map.put("begin", p.getBegin());
//		map.put("end", p.getEnd());
		
		vo.setBegin(p.getBegin());
		vo.setEnd(p.getEnd());
		
		
		
		
		//전체 데이타 조회(검새조건 적용)
		List<DpBoardVO> boardList = boardService.dpgetBoardList(vo);
		
		System.out.println("현재페이지 글목록(list) : "+ boardList);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pvo", p);
		String secretAgent = (String) session.getAttribute("secretAgent");
	    model.addAttribute("bdmsg", secretAgent);
	    session.removeAttribute("secretAgent");
		return "dpboard/dpgetBoardList";
	}	
	
	@RequestMapping("/dpinsertBoard.do")
	public String dpinsertBoard(DpBoardVO vo, HttpSession session, Model model,@RequestParam String curPage,RedirectAttributes redirectAttributes,  HttpServletRequest request) 
			throws IllegalStateException, IOException {
		System.out.println(">>> 글 등록 처리 - insertBoard()");
		
	    
		vo.setCnt(0);
		String a = (String) session.getAttribute("user_id");
		String b = (String) session.getAttribute("dept");
		String c = (String) session.getAttribute("user_position");
		
		if("".equals(vo.getT_noti())) {
			model.addAttribute("bdfsmsg", "본문");
			model.addAttribute("c2", curPage);
	            return "dpboard/dpinsertBoard";
		}
		
		if ( "Y".equals(vo.getT_noti().trim())) {
		if(!"대리".equals(c)) {
				model.addAttribute("bdmsg", "공지");
				model.addAttribute("c2", curPage);
  	            return "dpboard/dpinsertBoard";
  	            
		} else if(!"".equals(vo.getT_password())) {
			    model.addAttribute("bdssmsg", "공지");
			    model.addAttribute("c2", curPage);
	            return "dpboard/dpinsertBoard";
	            
		}
		}
		vo.setUser_id(a);
		vo.setDept(b);
		vo.setUser_position(c);
		if(!"".equals(vo.getT_password())) {
			String str = "[건의사항]" + vo.getT_title();
			vo.setT_title(str);
		}else if("".equals(vo.getT_password())) {
			vo.setT_password("구분");
		}
		/* ***** 파일 업로드 처리 *************
		 * MultipartFile 인터페이스 주요 메소드
		 * String getOriginalFilename() : 업로드한 파일명
		 * void transferTo(File destFile) : 업로드한 파일을 destFile에 저장
		 * boolean isEmpty() : 업로드한 파일의 존재여부(없으면 true 리턴)
		 */
		MultipartFile uploadFile = vo.getT_imgs();
		System.out.println("uploadFile : " + uploadFile);
		if (!uploadFile.isEmpty()) {//파일이 있으면
			String uploadsDir = "/WEB-INF/image/";
            String realPathtoUploads =  request.getServletContext().getRealPath(uploadsDir);
            if(! new File(realPathtoUploads).exists())
            {
                new File(realPathtoUploads).mkdir();
            }

            
      

    

            String orgName = uploadFile.getOriginalFilename();
            String[] strSplit1 = orgName.split("\\\\");
            
			
			orgName	 = strSplit1[strSplit1.length-1].toString();
            String filePath = realPathtoUploads + orgName;
            File dest = new File(filePath);
            uploadFile.transferTo(dest);
			
			vo.setT_img(orgName);
		} 
		
		boardService.dpinsertBoard(vo);
		redirectAttributes.addAttribute("curPage", curPage);
		return "redirect:dpgetBoardList.do";
	}
	
	@RequestMapping("/dpinsertBoardf.do")
	public String dpinsertBoardf(DpBoardVO vo,@RequestParam String curPage,Model model) 
			throws IllegalStateException, IOException {
		System.out.println(">>> 글 등록 처리 - insertBoardf()");
		
		model.addAttribute("c2", curPage);
		return "dpboard/dpinsertBoard";
	}
	
	@RequestMapping("/dpupdateBoard.do")
	public String dpupdateBoard(DpBoardVO vo, HttpSession session,@RequestParam String curPage,RedirectAttributes redirectAttributes, HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println(">>> 글 수정 처리 - updateBoard()");
		
		DpBoardVO bvo = boardService.dpgetBoard(vo);
		//bvo.getT_img();
		MultipartFile uploadFile = vo.getT_imgs();
		System.out.println("uploadFile : " + uploadFile);
		if (!uploadFile.isEmpty()) {//파일이 있으면
			String uploadsDir = "/WEB-INF/image/";
            String realPathtoUploads =  request.getServletContext().getRealPath(uploadsDir);
            if(! new File(realPathtoUploads).exists())
            {
                new File(realPathtoUploads).mkdir();
            }

            
      

    

            String orgName = uploadFile.getOriginalFilename();
            String[] strSplit1 = orgName.split("\\\\");
            
			
			orgName	 = strSplit1[strSplit1.length-1].toString();
            String filePath = realPathtoUploads + orgName;
            File dest = new File(filePath);
            uploadFile.transferTo(dest);
			
			vo.setT_img(orgName);
			System.out.println("수정요청 vo : " + uploadFile.getName());
			System.out.println("수정요청 vo : " + vo);
			
			boardService.dpupdateBoard(vo);
			redirectAttributes.addAttribute("curPage", curPage);
			return "redirect:dpgetBoardList.do";
		} else {
		
		vo.setT_img(bvo.getT_img());
		
		//System.out.println("수정요청 vo : " + igg);
		
		boardService.dpupdateBoard(vo);
		redirectAttributes.addAttribute("curPage", curPage);
		return "redirect:dpgetBoardList.do";
		}
	}
	
	
	
	@RequestMapping(value="/dpdeleteBoard.do", method=RequestMethod.POST)
	public String dpdeleteBoard(DpBoardVO vo, HttpSession session,Model model,@RequestParam String curPage,RedirectAttributes redirectAttributes) {
		System.out.println(">>> 글 삭제 처리 - deleteBoard()");
		
	
		boardService.dpdeleteBoard(vo);
		redirectAttributes.addAttribute("curPage", curPage);
		return "redirect:dpgetBoardList.do";
		
	}

	

}
