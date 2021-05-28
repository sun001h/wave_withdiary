package com.wave.withdiary.cash;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccountService implements IAccountService{
	
	@Autowired
	private IAccountDAO dao;

	@Override
	public List<CategoryDTO> category() {
		return dao.category();
	}

	@Override
	public List<CategoryCtDTO> categoryct() {
		return dao.categoryct();
	}

	@Override
	public List<AccountDTO> getAllList() {
		return dao.getAllList();
	}

	@Override
	public boolean insertAccount(AccountDTO dto) {
		return dao.insertAccount(dto);
	}

	@Override
	public AccountDTO getAccount(int num) {
		return dao.getAccount(num);
	}

	@Override
	public boolean updateAccount(AccountDTO dto) {
		return dao.updateAccount(dto);
	}

	@Override
	public boolean deleteAccount(int num) {
		return dao.deleteAccount(num);
	}

	@Override
	public List<AccountDTO> getAllListPage(Map<String, Object> map) {
		return dao.getAllListPage(map);
	}

	@Override
	public int listCount(Map<String, Object> map) {
		return dao.listCount(map);
	}

	@Override
	public List<ChartCT> chartCount(Map<String, Object> map) {
		return dao.chartCount(map);
	}

	@Override
	public List<ChartMoney> chartMoney(Map<String, Object> map) {
		return dao.chartMoney(map);
	}

	@Override
	public boolean mulDelAccount(String[] chks) {
		return dao.mulDelAccount(chks);
	}
	

}
