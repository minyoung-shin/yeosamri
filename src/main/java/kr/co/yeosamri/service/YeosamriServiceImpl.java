package kr.co.yeosamri.service;

import java.util.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import kr.co.yeosamri.dao.*;

@Service
public class YeosamriServiceImpl implements YeosamriService {
	
	@Autowired
	private YeosamriDAO dao;
	
	@Override
	public int insertHistory(HashMap<String, Object> requestMap) {
		return dao.insertHistory(requestMap);
	}

}
