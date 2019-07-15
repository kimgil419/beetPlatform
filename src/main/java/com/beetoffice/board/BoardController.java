package com.beetoffice.board;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.mapping.ParameterMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONArray;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

//




@Controller
//"board"라는 이름의 Model 이 있으면 session에 저장
@SessionAttributes("board") //모델에 값을 넣어 세션에 저장?
public class BoardController {
	@Autowired //일치 타입이 하나여야만 한다, 예전에 컨트롤러 타입?으로 찾던걸 오토와이어드로 찾는다
	private BoardService boardService; //이 변수 명과 @서비스의 변수명이 같아야 서비스로 이동
	
	@Autowired
	CommentService commentService;
	
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
	
	@RequestMapping("/getBoardInsert.do")
	public String getBoardInsert(BoardVO vo, HttpSession session,@RequestParam String curPage,RedirectAttributes redirectAttributes) {
		System.out.println(">>>조회수를 위한것 - getBoardInsert.do");
		System.out.println("수정요청 vo : " + vo);
		int a = vo.getSeq();
		String b = String.valueOf(a);
		session.setAttribute("mySeq", b);
		boardService.getBoardInsert(vo);
		
		//session.setAttribute("c1",curPage);
		redirectAttributes.addAttribute("curPage", curPage);
		return "redirect:getBoard.do";
	}
	
	//리턴타입 ModleAndView -> String 변경 통일
	//데이타 저장타입 : ModleAndView -> Model
	@RequestMapping("/getBoard.do")
	public String getBoard(BoardVO vo, Model model, HttpSession session,@RequestParam String curPage, CommentVO vol) {
		System.out.println(">>> 글 상세 조회 처리 - getBoard()");
		String a = (String) session.getAttribute("mySeq");
		vo.setSeq(Integer.parseInt(a));
		model.addAttribute("board", boardService.getBoard(vo)); //데이타 저장
		
//		String c1 = (String) session.getAttribute("c1");
//		model.addAttribute("c1", c1);
		model.addAttribute("c1", curPage);
		
		vol.setSeq(vo.getSeq());
        List<CommentVO> list = commentService.getCommentList(vol);
		
		model.addAttribute("cm_list", list);
		
		return "board/getBoard";
	}
	

	@RequestMapping("/updateBoardf.do")
	public String updateBoardf(BoardVO vo, Model model, HttpSession session,@RequestParam String curPage) {
		
		model.addAttribute("board", boardService.updateBoardf(vo));
		model.addAttribute("c3", curPage);
		return "board/updateBoard";
	}
	
	//리턴타입 ModleAndView -> String 변경 통일
	//데이타 저장타입 : ModleAndView -> Model
	@RequestMapping("/getBoardList.do")
	public String getBoardList(BoardVO vo, 
			Model model,@RequestParam String curPage, HttpSession session) {
		System.out.println(">>> 글 목록 조회 처리- getBoardList()");
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
		p.setTotalRecord(boardService.getTotalCount());
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
			p.setTotalRecord(boardService.getTotalCounts(vo));
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
		List<BoardVO> boardList = boardService.getBoardList(vo);
		
		System.out.println("현재페이지 글목록(list) : "+ boardList);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("pvo", p);
		return "board/getBoardList";
	}	
	
	@RequestMapping("/insertBoard.do")
	public String insertBoard(BoardVO vo, HttpSession session, Model model,@RequestParam String curPage,RedirectAttributes redirectAttributes,  HttpServletRequest request) 
			throws IllegalStateException, IOException {
		System.out.println(">>> 글 등록 처리 - insertBoard()");
		
	    
		vo.setCnt(0);
		String a = (String) session.getAttribute("user_id");
		String b = (String) session.getAttribute("dept");
		String c = (String) session.getAttribute("user_position");
		
		if("".equals(vo.getT_noti())) {
			model.addAttribute("bdfsmsg", "본문");
			model.addAttribute("c2", curPage);
	            return "board/insertBoard";
		}
		
		if ( "Y".equals(vo.getT_noti().trim())) {
		if(!("인사".equals(b) && "대리".equals(c))) {
				model.addAttribute("bdmsg", "공지");
				model.addAttribute("c2", curPage);
  	            return "board/insertBoard";
		}
		}
		vo.setUser_id(a);
		
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
		
		boardService.insertBoard(vo);
		redirectAttributes.addAttribute("curPage", curPage);
		return "redirect:getBoardList.do";
	}
	
	@RequestMapping("/insertBoardf.do")
	public String insertBoardf(BoardVO vo,@RequestParam String curPage,Model model) 
			throws IllegalStateException, IOException {
		System.out.println(">>> 글 등록 처리 - insertBoardf()");
		
		model.addAttribute("c2", curPage);
		return "board/insertBoard";
	}
	
	@RequestMapping("/updateBoard.do")
	public String updateBoard(BoardVO vo, HttpSession session,@RequestParam String curPage,RedirectAttributes redirectAttributes,  HttpServletRequest request) throws IllegalStateException, IOException {
		System.out.println(">>> 글 수정 처리 - updateBoard()");
		
		BoardVO bvo = boardService.getBoard(vo);
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
			
			boardService.updateBoard(vo);
			redirectAttributes.addAttribute("curPage", curPage);
			return "redirect:getBoardList.do";
		} else {
		
		vo.setT_img(bvo.getT_img());
		
		//System.out.println("수정요청 vo : " + igg);
		
		boardService.updateBoard(vo);
		redirectAttributes.addAttribute("curPage", curPage);
		return "redirect:getBoardList.do";
		}
	}
	
	
	
	@RequestMapping(value="/deleteBoard.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteBoard(BoardVO vo, HttpSession session,Model model,@RequestParam String curPage,RedirectAttributes redirectAttributes) {
		System.out.println(">>> 글 삭제 처리 - deleteBoard()");
		

		boardService.deleteBoard(vo);
		redirectAttributes.addAttribute("curPage", curPage);
		return "redirect:getBoardList.do";
		
	}
	

	

	
	
	@RequestMapping(value="/addComment.do")
    @ResponseBody
    public String ajax_addComment(@ModelAttribute("vol") CommentVO vol, HttpServletRequest request) throws Exception{
        
        HttpSession session = request.getSession();
        String user_name = (String)session.getAttribute("user_name");
        String user_id = (String) session.getAttribute("user_id");
        try{
            
            vol.setUser_name(user_name);

            vol.setUser_id(user_id);
          

            commentService.addComment(vol);
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return "success";
    }
    
    /**
     * 게시물 댓글 불러오기(Ajax)
     * @param boardVO
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value="/commentList.do", produces="application/json; charset=utf8")
    @ResponseBody
    public ResponseEntity<String> ajax_commentList(@ModelAttribute("vol") CommentVO vol, HttpServletRequest request) throws Exception{
        
        HttpHeaders responseHeaders = new HttpHeaders();
        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
        
        // 해당 게시물 댓글
        System.out.println("vol"+vol);
        List<CommentVO> commentVO = commentService.selectBoardCommentByCode(vol);
        
        if(commentVO.size() > 0){
            for(int i=0; i<commentVO.size(); i++){
                HashMap<String, Comparable> hm = new HashMap();
                hm.put("c_code", commentVO.get(i).getReply_seq());
                hm.put("comment", commentVO.get(i).getBoard_content());
                hm.put("writer", commentVO.get(i).getUser_name());
                
                hmlist.add(hm);
            }
            
        }
        System.out.println("hmlist"+hmlist);
        JSONArray json = new JSONArray(hmlist);   
        
        return new ResponseEntity<String>(json.toString(), responseHeaders, HttpStatus.CREATED);
        
    }
    

    @RequestMapping(value="/deleteComment.do")
    @ResponseBody
    public String ajax_deleteComment(@RequestParam("codes") String id) throws Exception{ //requestbody로 하면 제이슨을 스트링으로 받을시 제이슨형태로 받는다
         ModelAndView mv = new ModelAndView();
    
     //System.out.println(params.toString());
        try{
     
          
           //System.out.println("ccd.toString()"+ccd.toString());
            commentService.deleteComment(id.toString());
            
        } catch (Exception e){
            e.printStackTrace();
        }
        
        return "success";
    }

}
