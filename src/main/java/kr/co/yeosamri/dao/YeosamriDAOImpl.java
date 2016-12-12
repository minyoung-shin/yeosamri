package kr.co.yeosamri.dao;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import kr.co.yeosamri.vo.*;

@Repository
public class YeosamriDAOImpl implements YeosamriDAO {

	@Autowired
	private SqlSession mapper;
	
	@Override
	public int insertHistory(HashMap<String, Object> requestMap) {
		return mapper.insert("Yeosamri.insertHistory", requestMap);
	}

	@Override
	public List<HistoryVO> selectHistory() {
		return mapper.selectList("Yeosamri.selectHistory");
	}

	@Override
	public HistoryVO selectHistoryDetail(HashMap<String, Object> requestMap) {
		return mapper.selectOne("Yeosamri.selectHistoryDetail", requestMap);
	}

	@Override
	public int updateHistory(HashMap<String, Object> requestMap) {
		return mapper.update("Yeosamri.updateHistory", requestMap);
	}

	@Override
	public int deleteHistory(HashMap<String, Object> requestMap) {
		return mapper.delete("Yeosamri.deleteHistory", requestMap);
	}
	
}
