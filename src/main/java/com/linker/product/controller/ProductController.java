package com.linker.product.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.linker.product.dto.ProductDTO;
import com.linker.product.service.ProductService;

@Controller
@RequestMapping(value = "/product/*")	// url에서 /product로 시작하는 요청을 처리하는 컨트롤러
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductDTO ProductDTO;
	
	@Inject
	private ProductService ProductService;
	
		
		// 상품 목록 조회 (id상관없이 다 가져옴)
		@RequestMapping(value = "/productList", method=RequestMethod.GET)
		public String productList(Model model) throws Exception {
		
			System.out.println("ProductController 상품 목록 조회 시작......");
		
			// 회원 전체 목록을 가져온다.
			List<ProductDTO> productList = ProductService.productList();
			System.out.println("ProductController 상품 목록 조회 데이터 : " + productList);
		
			model.addAttribute("productLists", productList);
			return "main";
		}
	
	
		// 해당 아이디 상품 목록 조회
		@RequestMapping(value = "/productSelect", method=RequestMethod.GET)
		public ModelAndView selectProduct(@RequestParam(value = "id") String id, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			
			System.out.println("ProductController 회원 정보 조회 id ==> " + id);
			
			// 회원 전체 리스트 화면에서 id에 해당하는 정보를 찾는 일을 서비스에게 부탁한다.
			List<ProductDTO> ProductDTO = ProductService.selectProduct(id);
			System.out.println("ProductController 상품 정보 조회 => " + ProductDTO);
			
			// 찾아온 데이터를 가지고 해당 화면으로 넘어간다.
			ModelAndView mav = new ModelAndView("/product/productSelect");
			mav.addObject("product", ProductDTO);
			
			return mav;
			
		}
		

}
