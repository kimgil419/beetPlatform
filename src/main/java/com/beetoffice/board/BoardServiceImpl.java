package com.beetoffice.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



//@Service : @Component를 상속받아 만든 
//비즈니스 로직처리 서비스 영역에 사용
@Service("boardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	//private BoardDAO boardDAO;
	//private BoardDAOSpring boardDAO;
	//private BoardDAOMybatis1 boardDAO;
	private BoardDAOMybatis2 boardDAO;
	
	public BoardServiceImpl() {
		System.out.println(">> BoardServiceImpl 객체 생성");
	}

	@Override
	public void insertBoard(BoardVO vo) {
		boardDAO.insertBoard(vo);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateBoard(vo);
	}

	@Override
	public void deleteBoard(BoardVO vo) {
		boardDAO.deleteBoard(vo);
	}

	@Override
	public BoardVO getBoard(BoardVO vo) {
		return boardDAO.getBoard(vo);
	}

	@Override
	public void getBoardInsert(BoardVO vo) {
		boardDAO.getBoardInsert(vo);
		
	}

	@Override
	public BoardVO updateBoardf(BoardVO vo) {
		return boardDAO.updateBoardf(vo);
		
	}

	@Override
	public int getTotalCount() {
		return boardDAO.getTotalCount();
	}

	@Override
	public List<BoardVO> getBoardList(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.getBoardList(vo);
	}

	@Override
	public int getTotalCounts(BoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.getTotalCounts(vo);
	}

	@Override
	public List<BoardVO> getBoardListm() {
		return boardDAO.getBoardListm();
		
	}

}














