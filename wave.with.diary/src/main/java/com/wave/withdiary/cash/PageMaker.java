package com.wave.withdiary.cash;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	// 게시글 총 갯수
	private int totalCount;
	// 시작 페이지 번호 (1,11,21 ...)
	private int startPage;
	// 끝 페이지 (10,20,30 ....)
	private int endPage;
	// 이전 페이지로 이동하는 링크 존재 여부
	private boolean prev;
	// 다음 페이지로 이동하는 링크 존재 여부
	private boolean next;
	// 한 페이지당 보여지는 글 갯수
	private int displayPageNum = 10;

	private Criteria cri;

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	private void calcData() {
		endPage = (int) (Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		// 제일 마지막 페이지 계산
		int tempEndPage = (int) (Math.ceil(totalCount / (double)cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.build();

		return uriComponents.toUriString();
	}

}
