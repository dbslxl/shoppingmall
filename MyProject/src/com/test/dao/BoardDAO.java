package com.test.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.beans.BoardCategoryBean;
import com.test.beans.ContentBean;

@Repository
public class BoardDAO {
	@Autowired
	SqlSessionTemplate sql;
	
	public BoardCategoryBean getBoardCategoryInfo(int board_category_idx) {
		BoardCategoryBean bean = sql.selectOne("board_mapper.getBoardCategoryInfo",board_category_idx);
		return bean;
	}
	public List<ContentBean> getContentList(int board_category_idx, int start, int count){
		RowBounds rowBounds = new RowBounds(start, count);
		List<ContentBean> list = sql.selectList("board_mapper.getContentList",board_category_idx,rowBounds);
		return list;
	}
	public int getContentCount(int board_category_idx) {
		int count = sql.selectOne("board_mapper.getContentCount", board_category_idx);
		return count;
	}
	public ContentBean getContent(int content_idx) {
		ContentBean contentBean = sql.selectOne("board_mapper.getContent",content_idx);
		return contentBean;
	}
	public void incrementReadCnt(int content_idx) {
		sql.update("board_mapper.incrementReadCnt",content_idx);
	}
	public void addContent(ContentBean contentBean) {
		sql.insert("board_mapper.addContent",contentBean);
	}
}
