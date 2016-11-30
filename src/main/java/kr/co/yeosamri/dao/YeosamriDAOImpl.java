package kr.co.yeosamri.dao;

import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

@Repository
public class YeosamriDAOImpl implements YeosamriDAO {

	@Autowired
	private SqlSession mapper;
	
	@Override
	public int insertHistory(HashMap<String, Object> requestMap) {
		return mapper.insert("Yeosamri.insertHistory", requestMap);
	}
	
}
