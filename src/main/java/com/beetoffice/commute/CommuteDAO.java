package com.beetoffice.commute;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beetoffice.commute.CommuteVO;
import java.util.List;

@Repository("CommuteDAO")
public class CommuteDAO {

    @Autowired
    private SqlSessionTemplate mybatis;

    public CommuteDAO() {
    }
                                                                                  
    public void insertCommute(CommuteVO vo){
        mybatis.insert("commuteDAO.insertCommute", vo);
    }

    public List<CommuteVO> CommuteList(CommuteVO vo){
        return mybatis.selectList("commuteDAO.commuteList", vo);

    }
    
    public void updateCommute(CommuteVO vo){
        mybatis.update("commuteDAO.updateCommute", vo);
    }
    
    public CommuteVO getCommute(CommuteVO vo) {
    	return mybatis.selectOne("commuteDAO.getCommute", vo);
		
    }

}
