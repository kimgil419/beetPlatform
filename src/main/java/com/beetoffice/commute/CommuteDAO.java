package com.beetoffice.commute;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beetoffice.commute.CommuteVO;

import java.util.List;

@Repository
public class CommuteDAO {

    @Autowired
    private SqlSessionTemplate mybatis;

    public CommuteDAO() {
    }

    public void insertCommute(CommuteVO vo){
        mybatis.insert("commute.insertCommute", vo);
    }

    public List<CommuteVO> CommuteList(CommuteVO vo){
        return mybatis.selectList("commute.commuteList", vo);

    }
    
    public void updateCommute(CommuteVO vo){
        mybatis.update("commute.updateCommute", vo);
    }

}
