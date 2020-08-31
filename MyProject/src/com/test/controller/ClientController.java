package com.test.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.beans.BoardCategoryBean;
import com.test.beans.BuyTempBean;
import com.test.beans.CartBean;
import com.test.beans.CommentBean;
import com.test.beans.ContentBean;
import com.test.beans.LikeBean;
import com.test.beans.PageBean;
import com.test.beans.ProductBean;
import com.test.beans.UserBean;
import com.test.service.BoardService;
import com.test.service.ProductService;
import com.test.service.UserService;

@Controller
public class ClientController {
	@Resource(name="loginUserBean")
	@Lazy
	private UserBean loginUserBean;
	
	@Autowired
	private UserService userService;	
	@Autowired
	private BoardService boardService;
	@Autowired
	private ProductService productService;
	
	@GetMapping("/main")
	public String main() {
		return "client/main";
	}	
	@GetMapping("/user/join")
	public String user_join(@ModelAttribute("joinUserBean") UserBean bean) {
		return "client/user/join";
	}
	@GetMapping("/user/check_user_id")
	public String user_check_user_id(@RequestParam String new_id, Model model) {
		String id = userService.checkUserId(new_id);
		model.addAttribute("check",id);
		return "client/user/check_user_join_id";
	}
	@PostMapping("/user/join_pro")
	public String user_join_pro(@Valid @ModelAttribute("joinUserBean") UserBean bean, BindingResult result, HttpServletRequest request) {
		if(result.hasErrors()) {
			return "client/user/join";
		}
		bean.setUser_grade(1);
		bean.setUser_status(1);
		bean.setUser_ip(request.getRemoteAddr());
		
		userService.addUser(bean);
		
		return "client/user/join_pro";
	}
	@GetMapping("/user/login")
	public String user_login() {
		
		return "client/user/login";
	}
	@PostMapping("/user/login_pro")
	public String user_login_pro(UserBean bean) {
		userService.login(bean, loginUserBean);
		return "client/user/login_pro";
	}
	@GetMapping("/user/info")
	public String user_info(Model model) {
		UserBean userInfoBean =userService.getUserInfo(loginUserBean.getUser_idx());
		model.addAttribute("userInfoBean", userInfoBean);
		return "client/user/info";
	}
	@PostMapping("/user/modify_user_info")
	public String user_modify_info(@Valid @ModelAttribute("userInfoBean") UserBean bean, BindingResult result) {
		if(result.hasErrors()) {
			return "client/user/info";
		}
		bean.setUser_idx(loginUserBean.getUser_idx());
		userService.modifyUserInfo(bean);
		return "client/user/modify_user_info";
	}
	@GetMapping("/user/logout")
	public String user_logout(HttpSession session) {
		session.invalidate();
		return "client/user/logout";
	}
	
	@GetMapping("/board/list")
	public String board_list(@RequestParam(defaultValue="1") int board_category_idx, @RequestParam (defaultValue="1") int page, 
							 @RequestParam(defaultValue="new") String list_order ,Model model) {
		
		//get categoryBean
		BoardCategoryBean boardCategoryBean = boardService.getBoardCategoryInfo(board_category_idx);
		model.addAttribute("boardCategoryBean", boardCategoryBean);
		//get contentBean list
		List<ContentBean> contentList;
		System.out.println(list_order);
		if(list_order.equals("like")) {
			contentList= boardService.getContentListLike(board_category_idx, page);			
		}else {
			contentList = boardService.getContentList(board_category_idx, page);
		}				
		model.addAttribute("contentList",contentList);
		//get pageBean
		PageBean pageBean= boardService.getPageBean(board_category_idx, page);
		model.addAttribute("pageBean",pageBean);
		
		return "client/board/list";
	}
	@GetMapping("/board/read")
	public String borard_read(@RequestParam int board_category_idx, @RequestParam (defaultValue="1") int page, 
							  @RequestParam int content_idx, Model model) {
		//get categoryBean
		BoardCategoryBean boardCategoryBean = boardService.getBoardCategoryInfo(board_category_idx);
		model.addAttribute("boardCategoryBean", boardCategoryBean);
		//increment read count
		boardService.incrementReadCnt(content_idx);
		//get contentBean
		ContentBean contentBean = boardService.getContent(content_idx);
		model.addAttribute("contentBean",contentBean);
		//get comment list
		List<CommentBean> commentList = boardService.getCommentList(content_idx);
		model.addAttribute("commentList", commentList);		
		
		model.addAttribute("page",page);
		
		return "client/board/read";
	}
	@GetMapping("/board/write")
	public String board_write(@RequestParam int board_category_idx,Model model){
		model.addAttribute("board_category_idx",board_category_idx);
		return "client/board/write";
	}
	@PostMapping("/board/write_pro")
	public String board_write_pro(@ModelAttribute ContentBean contentBean, HttpServletRequest request) {
		contentBean.setContent_writer_idx(loginUserBean.getUser_idx());
		contentBean.setContent_ip(request.getRemoteAddr());
		boardService.addContent(contentBean);
		
		return "client/board/write_pro";
	}
	@PostMapping("/board/like_pro")
	public String board_like_pro(LikeBean likeBean, HttpServletRequest request,Model model) {
		String result;
		//checkLike
		LikeBean bean = boardService.checkLike(likeBean);				
		//update table
		if(bean==null) {
			likeBean.setLike_ip(request.getRemoteAddr());
			boardService.addLike(likeBean);
			result="up";
		}else if(bean.getLike_or_dislike()==likeBean.getLike_or_dislike()){
			boardService.removeLike(likeBean);
			result="down";
		}else {
			result="dislike";
		}
		model.addAttribute("result", result);		
		return "client/board/like_pro";				
	}
//	@PostMapping("/board/dislike_pro")
//	public String board_dislike_pro(LikeBean likeBean, HttpServletRequest request,Model model) {
//		String result;
//		//checkLike
//		LikeBean bean = boardService.checkLike(likeBean);				
//		//update table
//		if(bean==null) {
//			likeBean.setLike_ip(request.getRemoteAddr());
//			boardService.addDislike(likeBean);
//			result="up";
//		}else if(bean.getLike_or_dislike()==2){
//			boardService.removeLike(likeBean);
//			result="down";
//		}else {
//			result="like";
//		}
//		model.addAttribute("result", result);		
//		return "client/board/like_pro";				
//	}
	
	@PostMapping("/board/add_comment")
	public String board_add_comment(CommentBean commentBean, HttpServletRequest request, @RequestParam int board_category_idx,
									@RequestParam (defaultValue="1") int page, @RequestParam int content_idx, Model model){
		commentBean.setComment_content_idx(content_idx);
		commentBean.setComment_ip(request.getRemoteAddr());
		commentBean.setComment_user_idx(loginUserBean.getUser_idx());
		boardService.addComment(commentBean);
		
		//get boardCategoryBean
		BoardCategoryBean boardCategoryBean = boardService.getBoardCategoryInfo(board_category_idx);
		model.addAttribute("boardCategoryBean", boardCategoryBean);
		//get contentBean
		ContentBean contentBean = boardService.getContent(content_idx);
		model.addAttribute("contentBean",contentBean);
		//get comment list
		List<CommentBean> commentList = boardService.getCommentList(content_idx);
		model.addAttribute("commentList", commentList);		
		
		model.addAttribute("page",page);
		
		return "client/board/read";
	}
	@GetMapping("/board/delete_comment")
	public String board_delete_comment(CommentBean commentBean, @RequestParam int board_category_idx,
			@RequestParam (defaultValue="1") int page, @RequestParam int content_idx, Model model ) {
		
		String message;
		CommentBean bean = boardService.checkRemoveComment(commentBean);
		if(bean==null) {
			message="댓글 작성자만 삭제할수 있습니다.";			
		}else {
			boardService.removeComment(commentBean);
			message="삭제되었습니다.";
		}
		model.addAttribute("message",message);
		
		//get boardCategoryBean
		BoardCategoryBean boardCategoryBean = boardService.getBoardCategoryInfo(board_category_idx);
		model.addAttribute("boardCategoryBean", boardCategoryBean);
		//get contentBean
		ContentBean contentBean = boardService.getContent(content_idx);
		model.addAttribute("contentBean",contentBean);
		//get comment list
		List<CommentBean> commentList = boardService.getCommentList(content_idx);
		model.addAttribute("commentList", commentList);	
		
		return "client/board/read";
	}
	
	@GetMapping("/product/list")
	public String product_list(ProductBean categoryInfo, HttpServletRequest request, Model model) {
		
		if(request.getParameter("product_category2_idx")!=null) {
			categoryInfo.setProduct_category2_idx(Integer.parseInt(request.getParameter("product_category2_idx")));
		}		
		List<ProductBean> list = productService.getProductList(categoryInfo);
		model.addAttribute("productList", list);
		
		return "client/product/list";
		
	}
	@GetMapping("/product/detail")
	public String product_detail(@RequestParam int product_idx, Model model) {
		ProductBean productBean = productService.getProductOne(product_idx);
		model.addAttribute("productBean", productBean);
		
		return "client/product/detail";
	}
	@GetMapping("/product/add_cart")
	public String product_add_cart(CartBean cartBean) {
		cartBean.setCart_user_idx(loginUserBean.getUser_idx());
		productService.addCart(cartBean);
		return "client/product/add_cart";
	}
	@GetMapping("/product/cart_list")
	public String product_cart_list(Model model) {
		List<CartBean> cartList = productService.getCartList(loginUserBean.getUser_idx());
		model.addAttribute("cartList",cartList);
		return "client/product/cart_list";
	}
	@GetMapping("/product/add_temp")
	public String product_add_temp(@RequestParam int[] buy_temp_product_idx) {
		
		for(int a1 : buy_temp_product_idx) {
			//상품 정보를 가져온다.
			ProductBean bean1 = productService.getProductOne(a1);
			
			//저장한다.
			BuyTempBean bean2 = new BuyTempBean();
			bean2.setBuy_temp_product_idx(a1);
			bean2.setBuy_temp_product_name(bean1.getProduct_name());
			bean2.setBuy_temp_product_price(bean1.getProduct_price());
			bean2.setBuy_temp_user_idx(loginUserBean.getUser_idx());
			
			productService.addBuyTemp(bean2);
		}
		
		return "redirect:/client/product/buy";
	}
	@GetMapping("/product/buy")
	public String product_buy() {
		
		return "client/product/buy";
	}
	@GetMapping("/product/buy_pro")
	public String product_buy_pro() {
		
		return "client/product/buy_complete";
	}
	
}
