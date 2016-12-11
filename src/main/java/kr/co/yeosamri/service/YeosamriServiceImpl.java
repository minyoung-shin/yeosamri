package kr.co.yeosamri.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import kr.co.yeosamri.dao.*;
import kr.co.yeosamri.vo.*;

@Service
public class YeosamriServiceImpl implements YeosamriService {
	
	@Autowired
	private YeosamriDAO dao;
	
	@Override
	public int insertHistory(HashMap<String, Object> requestMap) {
		return dao.insertHistory(requestMap);
	}

	@Override
	public List<HistoryVO> selectHistory() {
		return dao.selectHistory();
	}

	@Override
	public HistoryVO selectHistoryDetail(HashMap<String, Object> requestMap) {
		return dao.selectHistoryDetail(requestMap);
	}

	@Override
	public int updateHistory(HashMap<String, Object> requestMap) {
		return dao.updateHistory(requestMap);
	}

}
