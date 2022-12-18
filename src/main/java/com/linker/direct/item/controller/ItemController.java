package com.linker.direct.item.controller;

// vo
import com.linker.direct.common.util.PageMaker;
import com.linker.direct.common.util.SearchCriteria;
import com.linker.direct.item.dto.ItemDTO;
import com.linker.direct.item.dto.ItemResultDTO;
import com.linker.direct.item.vo.ItemOptionVO;
import com.linker.direct.item.vo.ItemVO;
import com.linker.direct.user.constant.Role;
import com.linker.direct.user.vo.UserVO;
import com.linker.direct.category.CategoryVO;
// dto
import com.linker.direct.cart.dto.CartDTO;
import com.linker.direct.item.dto.ItemFormDTO;
// service
import com.linker.direct.item.service.ItemService;
import com.linker.direct.category.CategoryService;
// lombok
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
// springframework
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
// java
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@Controller
@RequestMapping("/item")
@RequiredArgsConstructor
public class ItemController {
    private final ItemService itemService;
    private final CategoryService categoryService;

    //==================================================================================================
    // 상품 등록 페이지
    //==================================================================================================
    @RequestMapping("/createForm")
    public String createForm(Model model) throws Exception {
        List<CategoryVO> categoryVOList = categoryService.listAll();
        model.addAttribute("categoryList", categoryVOList);
        return "/item/create";
    }

    //==================================================================================================
    // 상품 등록
    //==================================================================================================
    @ResponseBody
    @RequestMapping(value="/uploadAjax", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> uploadAjax(List<MultipartFile> uploadFiles, ItemFormDTO itemFormDto, HttpServletRequest request,/*추가*/ItemOptionVO
    itemOptionVO) throws Exception { // uploadFile : ajax를 호출한 javascript 함수 ( 자동 매핑 )

        // 로그인 여부 확인 ==================================================================================================
        // UserVO userVO = (UserVO) request.getSession().getAttribute("user");
        UserVO userVO = new UserVO();
        userVO.setUser_id(1L);
        userVO.setRole(Role.ADMIN);

        // 조건 확인 ==================================================================================================
        if(userVO == null) {
            return new ResponseEntity<>("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);
        } else if (userVO.getRole() != Role.ADMIN) {
            // 관리자가 아닌 경우
            return new ResponseEntity<>("관리자만 접근 가능합니다.", HttpStatus.UNAUTHORIZED);
        }
        // 사진 정보 확인 ==================================================================================================
        if(uploadFiles == null) { // 파일이 없을 경우 에러 발생
            return new ResponseEntity<>("fail_no_img", HttpStatus.BAD_REQUEST);
        }

        // item 저장 ==================================================================================================
        itemService.create(itemFormDto, uploadFiles, itemOptionVO); // item 테이블에 저장
        return new ResponseEntity<>("upload success", HttpStatus.OK);
    }


    //==================================================================================================
    // 상품 목록
    //==================================================================================================
    @RequestMapping(value = "/searchList", method = RequestMethod.GET)
    public ModelAndView searchList(SearchCriteria cri, CartDTO cartDTO) throws Exception {
        ModelAndView mav = new ModelAndView("/item/searchList");

        String subFilter = cri.getSubFilter();;
        // logger.info("subFilter ==> " + subFilter);
        if(subFilter == null){
            // 검색 조건이 없으면, 낮은 가격순으로 정렬
            subFilter  = "lowPrice";
        }

        String keyword = cri.getKeyword();
        Long category_id = cri.getCategory_id();
        if(category_id != null) {
            cri.setCategory_id(category_id);
        }

        PageMaker pageMaker = new PageMaker();
        pageMaker.setCri(cri);

        // 카테고리
        mav.addObject("categoryList", categoryService.listAll());

        // 상품 전체 개수를 구한다.
        pageMaker.setTotalCount(itemService.totalCount(cri));

        // cri에 해당하는 게시글을 가져와서 View에게 넘겨준다.
        List<ItemDTO> searchList = itemService.searchListPaging(cri);
        // 검색 결과 없을 경우
        if(searchList.size() == 0) {
            mav.setViewName("/item/noSearch");
            return mav;
        }

        mav.addObject("searchList", searchList);
        // 페이지 메뉴
        mav.addObject("pageMaker", pageMaker);

        // 장바구니
        mav.addObject("user_id", cartDTO.getUser_id());
        mav.addObject("item_id", cartDTO.getItem_id());
        mav.addObject("product_count", cartDTO.getCount());
        mav.addObject("cart_date", cartDTO.getCreated_at());

        // 검색 조건
        mav.addObject("subFilter", subFilter);
        mav.addObject("keyword", keyword);
        mav.addObject("perPageNum", cri.getPerPageNum());
        // mav.addObject("searchListAll", itemService.searchListAll(cri));


        System.out.println("mav ==> " + mav);
        return mav;
    }

    //==================================================================================================
    // 상품 상세 페이지
    //==================================================================================================
    @RequestMapping(value = "/detail", method = RequestMethod.GET)
    public ModelAndView detail(ItemVO itemVO) throws Exception {
        ModelAndView mav = new ModelAndView("/item/detail");
        ItemDTO itemDTO = itemService.read(itemVO);
        mav.addObject("itemDTO", itemDTO);
        return mav;
    }
}
