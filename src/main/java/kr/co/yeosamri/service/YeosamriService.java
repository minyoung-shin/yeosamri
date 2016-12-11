package kr.co.yeosamri.service;

import java.util.*;

import kr.co.yeosamri.vo.*;

public interface YeosamriService {
	int insertHistory(HashMap<String, Object> requestMap);
	List<HistoryVO> selectHistory();
	HistoryVO selectHistoryDetail(HashMap<String, Object> requestMap);
	int updateHistory(HashMap<String, Object> requestMap);
}
