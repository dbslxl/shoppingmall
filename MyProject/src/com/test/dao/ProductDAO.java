package com.test.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
}
