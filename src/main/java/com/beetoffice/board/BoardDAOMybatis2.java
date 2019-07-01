package com.beetoffice.board;

import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;



@Repository("BoardDAOMybatis2")
public class BoardDAOMybatis2 {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public BoardDAOMybatis2() {
		System.out.println(">> BoardDAOMybastis2 객체 생성");
	}
	//글 입력(INSERT)
	public void insertBoard(BoardVO vo) {
		System.out.println("===> Mybatis2로 insertBoard() 실행");
		mybatis.insert("BoardDAO.insertBoard", vo);
	}
	
	//글수정
	public void updateBoard(BoardVO vo) {
		System.out.println("===> Mybatis2로 updateBoard() 실행");
		mybatis.update("BoardDAO.updateBoard", vo);
	}
	
	//글삭제
	public void deleteBoard(BoardVO vo) {
		System.out.println("===> Mybatis2로 deleteBoard() 실행");
		mybatis.delete("BoardDAO.deleteBoard", vo);
	}
	
	//글 상세 조회
	public BoardVO getBoard(BoardVO vo) {
		System.out.println("===> Mybatis2로 getBoard() 실행");
		return mybatis.selectOne("BoardDAO.getBoard", vo);
	}
	
	//검색조건 적용해서 데이타 조회
	//(실습) 검색조건 적용해서 처리되도록 구현
	public List<BoardVO> getBoardList(BoardVO vo) {
		System.out.println("===> Mybatis2로 getBoardList() 실행");
		return mybatis.selectList("BoardDAO.getBoardList", vo);
	}	
}



















