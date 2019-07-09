package com.beetoffice.dpboard;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



//@Service : @Component를 상속받아 만든 
//비즈니스 로직처리 서비스 영역에 사용
@Service("dpBoardService")
public class DpBoardServiceImpl implements DpBoardService {
	@Autowired
	//private BoardDAO boardDAO;
	//private BoardDAOSpring boardDAO;
	//private BoardDAOMybatis1 boardDAO;
	private DpBoardDAOMybatis2 boardDAO;
	
	public DpBoardServiceImpl() {
		System.out.println(">> BoardServiceImpl 객체 생성");
	}

	@Override
	public void dpinsertBoard(DpBoardVO vo) {
		boardDAO.dpinsertBoard(vo);
	}

	@Override
	public void dpupdateBoard(DpBoardVO vo) {
		boardDAO.dpupdateBoard(vo);
	}

	@Override
	public void dpdeleteBoard(DpBoardVO vo) {
		boardDAO.dpdeleteBoard(vo);
	}

	@Override
	public DpBoardVO dpgetBoard(DpBoardVO vo) {
		return boardDAO.dpgetBoard(vo);
	}

	@Override
	public void dpgetBoardInsert(DpBoardVO vo) {
		boardDAO.dpgetBoardInsert(vo);
		
	}

	@Override
	public DpBoardVO dpupdateBoardf(DpBoardVO vo) {
		return boardDAO.dpupdateBoardf(vo);
		
	}

	@Override
	public int dpgetTotalCount(DpBoardVO vo) {
		return boardDAO.dpgetTotalCount(vo);
	}

	@Override
	public List<DpBoardVO> dpgetBoardList(DpBoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.dpgetBoardList(vo);
	}

	@Override
	public int dpgetTotalCounts(DpBoardVO vo) {
		// TODO Auto-generated method stub
		return boardDAO.dpgetTotalCounts(vo);
	}

	@Override
	public List<DpBoardVO> dpgetBoardListm(String dept) {
		return boardDAO.dpgetBoardListm(dept);
		
		
	}

}














