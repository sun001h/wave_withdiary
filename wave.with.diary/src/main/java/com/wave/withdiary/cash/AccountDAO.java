package com.wave.withdiary.cash;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AccountDAO implements IAccountDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "wave.withdiary.cash.";

	@Override
	public List<CategoryDTO> category() {
		return sqlSession.selectList(nameSpace+"category");
	}

	@Override
	public List<CategoryCtDTO> categoryct() {
		return sqlSession.selectList(nameSpace+"categoryct");
	}

	@Override
	public List<AccountDTO> getAllList() {
		return sqlSession.selectList(nameSpace+"getAllList");
	}

	@Override
	public boolean insertAccount(AccountDTO dto) {
		int count=0;
		count=sqlSession.insert(nameSpace+"insertaccount",dto);
		return count>0?true:false;
	}

	@Override
	public AccountDTO getAccount(int num) {
		return sqlSession.selectOne(nameSpace+"getAccount",num);
	}

	@Override
	public boolean updateAccount(AccountDTO dto) {
		int count=0;
		count=sqlSession.update(nameSpace+"updateaccount",dto);
		return count>0?true:false;
	}

	@Override
	public boolean deleteAccount(int num) {
		int count=0;
		count=sqlSession.delete(nameSpace+"deleteaccount",num);
		return count>0?true:false;
	}

	@Override
	public List<AccountDTO> getAllListPage(Map<String, Object> map) {
		return sqlSession.selectList(nameSpace+"getAllListPage",map);
	}

	@Override
	public int listCount(Map<String, Object> map) {
		return sqlSession.selectOne(nameSpace+"listCount", map);
	}

	@Override
	public List<ChartCT> chartCount(Map<String, Object> map) {
		return sqlSession.selectList(nameSpace+"chartCount",map);
	}

	@Override
	public List<ChartMoney> chartMoney(Map<String, Object> map) {
		return sqlSession.selectList(nameSpace+"chartMoney",map);
	}

	@Override
	public boolean mulDelAccount(String[] chks) {
		int count=0;
		Map<String, String[]>map=new HashMap<>();
		map.put("chk", chks);
		count=sqlSession.delete(nameSpace+"muldel",map);
		return count>0?true:false;
	}

}
