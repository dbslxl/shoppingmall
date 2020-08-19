package com.test.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.beans.BoardCategoryBean;
import com.test.beans.ContentBean;
import com.test.beans.PageBean;
import com.test.dao.BoardDAO;

@Service
public class BoardService {

	@Autowired
	private BoardDAO boardDao;
	
	public BoardCategoryBean getBoardCategoryInfo(int board_category_idx) {
		BoardCategoryBean bean = boardDao.getBoardCategoryInfo(board_category_idx);
		return bean;
	}
	public List<ContentBean> getContentList(int board_category_idx, int page){
		int count=PageBean.getCountPerPage();
		int start=(page-1)*count+1;		
		List<ContentBean> list = boardDao.getContentList(board_category_idx, start, count);
		return list;
	}
	public PageBean getPageBean(int board_category_idx, int page) {
		int totalCount=boardDao.getContentCount(board_category_idx);
		PageBean pageBean= new PageBean(page, totalCount);
		return pageBean;
	}
	public ContentBean getContent(int content_idx) {
		ContentBean contentBean = boardDao.getContent(content_idx);
		return contentBean;
	}
	public void incrementReadCnt(int content_idx) {
		boardDao.incrementReadCnt(content_idx);
	}
	public void addContent(ContentBean contentBean) {
		boardDao.addContent(contentBean);
	}
}
