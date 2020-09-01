package com.test.dao;

import java.util.List;

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
}
