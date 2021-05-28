package com.wave.withdiary.board;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAO implements IBoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private String nameSpace = "wave.withdiary.board.";
	
	@Override //글 작성하기
	public void create(BoardVO vo) {
		sqlSession.insert(nameSpace + "insert", vo);
	}

	@Override //글 상세보기
	public BoardVO read(int d_articlenumber) {
		return sqlSession.selectOne(nameSpace + "view", d_articlenumber);
	}

	@Override //글 수정하기
	public void update(BoardVO vo) {
		sqlSession.update(nameSpace + "updateArticle", vo);
	}

	@Override //글 삭제하기
	public void delete(int d_articlenumber) {
		sqlSession.delete(nameSpace + "deleteArticle", d_articlenumber);
	}

	@Override //글 목록 조회
	public List<BoardVO> listAll() {
		return sqlSession.selectList(nameSpace + "listAll");
	}

	@Override //글 조회수 증가
	public void increaseViewcnt(int d_articlenumber) {
		sqlSession.update(nameSpace + "increaseViewcnt", d_articlenumber);
		
	}

	@Override
	public void insert(BoardVO vo) {
		sqlSession.insert(nameSpace + "insert", vo);
	}
	
}








