package com.wave.withdiary.board;

import java.util.List;

public interface IBoardService {
	
	//글 작성하기
	public void create(BoardVO vo);
	//글 상세보기
	public BoardVO read(int d_articlenumber);
	//글 수정하기
	public void update(BoardVO vo);
	//글 삭제하기
	public void delete(int d_articlenumber);
	//글 목록
	public List<BoardVO> listAll();
	//글 조회수
	public void increaseViewcnt(int d_articlenumber);
	//글 폼?
	public void insert(BoardVO vo);



}
