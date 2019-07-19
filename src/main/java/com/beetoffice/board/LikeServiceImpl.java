package com.beetoffice.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("likeService")
public class LikeServiceImpl implements LikeService {
    
	@Autowired
    LikeDAOMybatis likeDAO;
	
	public LikeServiceImpl() {
		System.out.println(">> LikeServiceImpl 객체 생성");
	}

	@Override
	public String selectReallike(LikeVO vo) {
		
		return likeDAO.selectReallike(vo);
	}

	@Override
	public void insertLike(LikeVO vo) {
		
		likeDAO.insertLike(vo);
		
	}

	@Override
	public String selectReallikec(LikeVO vo) {
		
		return likeDAO.cselectReallike(vo);
	}

	@Override
	public void updateLikemns(LikeVO vo) {
		likeDAO.updateLikemns(vo);
		
	}

	@Override
	public void updateLikepls(LikeVO vo) {
		likeDAO.updateLikepls(vo);
		
	}

	@Override
	public String selectReallikecc(LikeVO vo) {
		// TODO Auto-generated method stub
		return likeDAO.cselectReallikec(vo);
	}






	

}
