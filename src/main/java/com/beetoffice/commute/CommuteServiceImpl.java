package com.beetoffice.commute;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beetoffice.commute.CommuteService;
import com.beetoffice.commute.CommuteVO;

@Service("CommuteService")
public class CommuteServiceImpl implements CommuteService {

    @Autowired
    private CommuteDAO CommuteDAO;

    @Override
    public void insertCommute(CommuteVO vo) {
        CommuteDAO.insertCommute(vo);
    }

    @Override
    public void updateCommute(CommuteVO vo) {
    	CommuteDAO.updateCommute(vo);

    }

    @Override
    public List<CommuteVO> getCommuteList(CommuteVO vo) {
    	return CommuteDAO.CommuteList(vo);
    }
    @Override
    public CommuteVO getCommute(CommuteVO vo) {
    	return CommuteDAO.getCommute(vo);
    }


	
}
