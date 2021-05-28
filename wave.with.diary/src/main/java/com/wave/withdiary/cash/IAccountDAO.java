package com.wave.withdiary.cash;

import java.util.List;
import java.util.Map;

public interface IAccountDAO {
	
	//카테고리1
	public List<CategoryDTO> category();
	//카테고리2
	public List<CategoryCtDTO> categoryct();
	//1. 글리스트
	public List<AccountDTO> getAllList();
	//2. 글추가하기 : insert문실행 --> 추가된 행의 개수만큼 숫자 반환--> 0보다 크면 true
	public boolean insertAccount(AccountDTO dto);
	//3. 글상세보기
	public AccountDTO getAccount(int num);
	//4. 글수정하기
	public boolean updateAccount(AccountDTO dto);
	//5. 글삭제하기
	public boolean deleteAccount(int num);
	//6. 게시물 목록 페이징
	public List<AccountDTO> getAllListPage(Map<String, Object> map);
	//7. 게시물 총 갯수
	public int listCount(Map<String, Object> map);
	//8. ChartCT보기
	public List<ChartCT> chartCount(Map<String, Object> map);
	//9. ChartMoney보기
	public List<ChartMoney> chartMoney(Map<String, Object> map);
	//글목록 페이지에서 여러글 삭제 요청시 처리할 메서드
	public boolean mulDelAccount(String[] chks);

}
