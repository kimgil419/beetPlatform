package com.beetoffice.commute;

import java.util.List;

public interface CommuteService {

  
    void updateCommute(CommuteVO vo);
    List<CommuteVO> getCommuteList(CommuteVO vo);
	void insertCommute(CommuteVO vo);

}
