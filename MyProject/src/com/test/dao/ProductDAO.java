package com.test.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.beans.BuyBean;
import com.test.beans.BuyTempBean;
import com.test.beans.CartBean;
import com.test.beans.ProductBean;

@Repository
public class ProductDAO {
	@Autowired
	SqlSessionTemplate sql;
	
	public List<ProductBean> getProductList(ProductBean categoryInfo){
		List<ProductBean> list = sql.selectList("product_mapper.getProductList",categoryInfo);
		return list;
	}
	public List<ProductBean> getNewProductList(){
		RowBounds rowBounds = new RowBounds(0, 8);
		List<ProductBean> list = sql.selectList("product_mapper.getNewProductList",0,rowBounds);
		return list;
	}
	public List<ProductBean> getBestProductList(){
		RowBounds rowBounds = new RowBounds(0, 8);
		List<ProductBean> list = sql.selectList("product_mapper.getBestProductList",0,rowBounds);
		return list;
	}
	public void addProduct(ProductBean productBean) {
		sql.insert("product_mapper.addProduct",productBean);
	}
	public ProductBean getProductOne(int product_idx) {
		ProductBean bean = sql.selectOne("product_mapper.getProductOne",product_idx);
		return bean;
	}
	public void addCart(CartBean cartBean) {
		sql.insert("product_mapper.addCart",cartBean);
	}
	public List<CartBean> getCartList(int user_idx){
		List<CartBean> list = sql.selectList("product_mapper.getCartList", user_idx);
		return list;
	}
	public void addBuyTemp(BuyTempBean buyTempBean) {
		sql.insert("product_mapper.addBuyTemp",buyTempBean);
	}
	public void deleteBuyTemp(int user_idx) {
		sql.delete("product_mapper.deleteBuyTemp",user_idx);
	}
	public List<BuyTempBean> getBuyTempList(int user_idx){
		List<BuyTempBean> list = sql.selectList("product_mapper.getBuyTempList",user_idx);
		return list;
	}
	public int getTotalPrice(int user_idx) {
		int totalPrice = sql.selectOne("product_mapper.getTotalPrice",user_idx);
		return totalPrice;		
	}
	public void addBuyInfo(BuyBean buyBean) {
		sql.insert("product_mapper.addBuyInfo",buyBean);
	}
	public List<BuyBean> getBuyList(int user_idx) {
		List<BuyBean> list = sql.selectList("product_mapper.getBuyList",user_idx);
		return list;
	}
}
