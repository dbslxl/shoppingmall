package com.test.service;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.test.beans.BuyBean;
import com.test.beans.BuyTempBean;
import com.test.beans.CartBean;
import com.test.beans.ProductBean;
import com.test.dao.ProductDAO;

@Service
public class ProductService {
	@Autowired
	ProductDAO productDao;
	
	public List<ProductBean> getProductList(ProductBean categoryInfo){
		List<ProductBean> list = productDao.getProductList(categoryInfo);
		return list;
	}
	public List<ProductBean> getNewProductList(){
		RowBounds rowBounds = new RowBounds(0, 10);
		List<ProductBean> list = productDao.getNewProductList();
		return list;
	}
	public List<ProductBean> getBestProductList(){
		List<ProductBean> list = productDao.getBestProductList();
		return list;
	}
	public void addProduct(ProductBean productBean) {
		productDao.addProduct(productBean);
	}
	
	public String saveUploadFile(MultipartFile upload_file, String path) {		
		//서버상의 파일 이름을 만들어 준다.
		String file_name = System.currentTimeMillis()+"_"+upload_file.getOriginalFilename();		
		//저장한다.
		try {
			upload_file.transferTo(new File(path+"/"+file_name));
		}catch (Exception e) {
			e.printStackTrace();
		}
		return file_name;
	}
	public ProductBean getProductOne (int product_idx) {
		ProductBean bean = productDao.getProductOne(product_idx);
		return bean;
	}
	public void addCart(CartBean cartBean) {
		productDao.addCart(cartBean);
	}
	public List<CartBean> getCartList(int user_idx){
		List<CartBean> list = productDao.getCartList(user_idx);
		return list;
	}
	public void addBuyTemp(BuyTempBean buyTempBean) {
		productDao.addBuyTemp(buyTempBean);
	}
	public void deleteBuyTemp(int user_idx) {
		productDao.deleteBuyTemp(user_idx);
	}
	public List<BuyTempBean> getBuyTempList(int user_idx){
		List<BuyTempBean> list = productDao.getBuyTempList(user_idx);
		return list;
	}
	public int getTotalPrice(int user_idx) {
		int total=productDao.getTotalPrice(user_idx);
		return total;
	}
	public void addBuyInfo(BuyBean buyBean) {
		productDao.addBuyInfo(buyBean);
	}
	public List<BuyBean> getBuyList(int user_idx) {
		List<BuyBean> list = productDao.getBuyList(user_idx);
		return list;
	}
}
