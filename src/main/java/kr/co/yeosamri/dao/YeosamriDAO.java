package kr.co.yeosamri.dao;

import java.util.*;

import kr.co.yeosamri.vo.*;

public interface YeosamriDAO {
	int insertHistory(HashMap<String, Object> requestMap);
	List<HistoryVO> selectHistory();
	HistoryVO selectHistoryDetail(HashMap<String, Object> requestMap);
	int updateHistory(HashMap<String, Object> requestMap);
}
