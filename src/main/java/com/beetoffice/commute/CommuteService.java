package com.beetoffice.commute;

import java.util.List;

import com.beetoffice.user.UserVO;

public interface CommuteService {

  
    void updateCommute(CommuteVO vo);
    List<CommuteVO> getCommuteList(CommuteVO vo);
    CommuteVO getCommute(CommuteVO vo);
	void insertCommute(CommuteVO vo);

}
