package com.linker.direct.product.controller;

import com.linker.direct.product.dto.OrderItemVO;
import com.linker.direct.product.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping(value = "/product/*")	// url에서 /product로 시작하는 요청을 처리하는 컨트롤러
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private OrderItemVO OrderItemVO;
	
	@Inject
	private ProductService ProductService;
	
		
		// 상품 목록 조회 (id상관없이 다 가져옴)
		@RequestMapping(value = "/productList", method=RequestMethod.GET)
		public String productList(Model model) throws Exception {
		
			System.out.println("ProductController 상품 목록 조회 시작......");
		
			// 구매상품 전체 목록을 가져온다.
			List<OrderItemVO> productList = ProductService.productList();
			System.out.println("ProductController 상품 목록 조회 데이터 : " + productList);
		
			model.addAttribute("productLists", productList);
			return "user/myInfo";
		}
	
	
		// 상품번호에 해당하는 상품정보 추출하기
		@RequestMapping(value = "/productSelect", method=RequestMethod.GET)
		public ModelAndView selectProduct(@RequestParam(value = "item_id") Long item_id, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			
			System.out.println("ProductController 회원 정보 조회 product_no ==> " + item_id);
			
			//상품 no에 해당하는 정보를 찾는 일을 서비스에게 부탁한다.
			List<OrderItemVO> OrderItemVO = ProductService.selectProduct((long) Integer.parseInt((String)request.getParameter("item_id")));
			System.out.println("ProductController 상품 정보 조회 => " + OrderItemVO);
			
			// 찾아온 데이터를 가지고 해당 화면으로 넘어간다.
			ModelAndView mav = new ModelAndView("order/productSelect");
			mav.addObject("product", OrderItemVO);
			
			return mav;
			
		}
		
		// user_id에 해당하는 상품정보 추출하기
		@RequestMapping(value = "/productRefund", method=RequestMethod.GET)
		public ModelAndView productRefund(@RequestParam(value = "user_id") Long user_id, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			
			System.out.println("ProductController 회원 정보 조회 user_id ==> " + user_id);
			
			//상품 no에 해당하는 정보를 찾는 일을 서비스에게 부탁한다.
			List<OrderItemVO> OrderItemVO = ProductService.productRefund((long) Integer.parseInt((String)request.getParameter("user_id")));
			System.out.println("ProductController 상품 정보 조회 => " + OrderItemVO);
			
			// 찾아온 데이터를 가지고 해당 화면으로 넘어간다.
			ModelAndView mav = new ModelAndView("order/productRefund");
			mav.addObject("product", OrderItemVO);
			
			return mav;
			
		}


}
