package com.beetoffice.dpboard;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;



@Repository("DpBoardDAOMybatis2")
public class DpBoardDAOMybatis2 {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public DpBoardDAOMybatis2() {
		System.out.println(">> DpBoardDAOMybastis2 객체 생성");
	}
	//글 입력(INSERT)
	public void dpinsertBoard(DpBoardVO vo) {
		System.out.println("===> Mybatis2로 insertBoard() 실행");
		mybatis.insert("BoardDAO.insertBoard", vo);
	}
	
	//글수정
	public void dpupdateBoard(DpBoardVO vo) {
		System.out.println("===> Mybatis2로 updateBoard() 실행");
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	//글삭제
	public void dpdeleteBoard(DpBoardVO vo) {
		System.out.println("===> Mybatis2로 deleteBoard() 실행");
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}
	
	//글 상세 조회
	public DpBoardVO dpgetBoard(DpBoardVO vo) {
		System.out.println("===> Mybatis2로 getBoard() 실행");
		return mybatis.selectOne("BoardDAO.getBoard", vo);
	}
	
	//검색조건 적용해서 데이타 조회
	//(실습) 검색조건 적용해서 처리되도록 구현
	public List<DpBoardVO> dpgetBoardList(DpBoardVO vo) {
		System.out.println("===> Mybatis2로 getBoardList() 실행");
		return mybatis.selectList("BoardDAO.getBoardList", vo);
	}
	public void dpgetBoardInsert(DpBoardVO vo) {
		System.out.println("===> Mybatis2로 deleteBoard() 실행");
		mybatis.update("BoardDAO.getBoardInsert",vo);
	}
	public DpBoardVO dpupdateBoardf(DpBoardVO vo) {
		System.out.println("===> Mybatis2로 updateBoardf() 실행");
		 return mybatis.selectOne("BoardDAO.getBoard", vo);
	}
	public int dpgetTotalCount() {
	
		return mybatis.selectOne("BoardDAO.totalCount");
	}
	public int dpgetTotalCounts(DpBoardVO vo) {
		// TODO Auto-generated method stub
		return mybatis.selectOne("BoardDAO.totalCount", vo);
	}	
}



















