package com.wave.withdiary.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BoardService implements IBoardService {
	
	@Autowired
	private IBoardDAO dao;
	//글 작성하기
	@Override
	public void create(BoardVO vo) {
		dao.create(vo);
		
	}

	@Override
	public BoardVO read(int d_articlenumber) {
		return dao.read(d_articlenumber);
	}

	@Override
	public void update(BoardVO vo) {
		dao.update(vo);
	}

	@Override
	public void delete(int d_articlenumber) {
		dao.delete(d_articlenumber);
	}

	@Override
	public List<BoardVO> listAll() {
		return dao.listAll();
	}

	public void increaseViewcnt(int d_articlenumber) {
		dao.increaseViewcnt(d_articlenumber);
	}

	public void insert(BoardVO vo) {
		dao.insert(vo);
		
	}




}
