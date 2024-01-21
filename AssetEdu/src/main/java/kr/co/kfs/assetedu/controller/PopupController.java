package kr.co.kfs.assetedu.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.kfs.assetedu.model.Bok01Book;
import kr.co.kfs.assetedu.model.Com01Corp;
import kr.co.kfs.assetedu.model.Fnd01Fund;
import kr.co.kfs.assetedu.model.Itm01Item;
import kr.co.kfs.assetedu.model.Jnl10Acnt;
import kr.co.kfs.assetedu.model.Jnl11ReprAcnt;
import kr.co.kfs.assetedu.model.PageAttr;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.service.Bok01BookService;
import kr.co.kfs.assetedu.service.Com01CorpService;
import kr.co.kfs.assetedu.service.Fnd01FundService;
import kr.co.kfs.assetedu.service.Itm01ItemService;
import kr.co.kfs.assetedu.service.Jnl10AcntService;
import kr.co.kfs.assetedu.service.Jnl11ReprAcntService;
import kr.co.kfs.assetedu.utils.AssetUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("popup")
@Slf4j
public class PopupController {

	@Autowired
	Com01CorpService corpService;
	@Autowired
	Fnd01FundService fundService;
	@Autowired
	Jnl10AcntService jnlAcntService;
	@Autowired
	Jnl11ReprAcntService jnlReprAcntService;
	@Autowired
	Itm01ItemService itemService;
	@Autowired
	Bok01BookService bookService;
	
	
	
	@GetMapping("corp")
	public String corp(String searchText, String codeCd, String codeNm, 
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize,
			@RequestParam(value="currentPageNumber", required=false, defaultValue="1") Integer currentPageNumber,			
			Model model, 
			//이하 펀드컨트롤러에서 수탁사 운용사 신탁사 구분하기 위해 받아오는 쿼리 스트링으로 corpType 받겠음
			@RequestParam(value="corpType", required=false) String corpType) {
		
		//페이징을 위한 부분//
		QueryAttr queryAttr = new QueryAttr();
		queryAttr.put("searchText", searchText);
		
		Long totalCount = corpService.selectCount(queryAttr);
		
		PageAttr pageAttr = new PageAttr(totalCount, pageSize, currentPageNumber);
		queryAttr.putClass(pageAttr);
		log.debug("pageAttr:{}", pageAttr);
		
		//펀드정보 등록시 운용사/수탁사/사무수탁사를 구분해서 가져오기 위한 코드
		//현재 corp_type은 01이 회사, 02 은행, 03 증권사, 04 자산운용사, 05 사무수탁사로 구분중.
	    //펀드종목 insert_form 은 corpCd=fnd01TrustCoC... 어쩌고 할튼 많이 주는데 결국 corp_type만 있으면 쨌든 구분은 되니까 그걸로 하자.
		queryAttr.put("corpType", corpType);
			
		List<Com01Corp> list =  corpService.selectList(queryAttr);
		model.addAttribute("list",list);
		model.addAttribute("pageAttr", pageAttr);
		return "/common/popup_corp";
	}
	
	
	@GetMapping("fund")
	public String fund (String searchText, String fundCd, String fundNm, String parentYn,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize,
			@RequestParam(value="currentPageNumber", required=false, defaultValue="1") Integer currentPageNumber,			
			Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("searchText : {}, fundCd : {}, fundNm: {}, parentYn: {}", searchText, fundCd, fundNm, parentYn);
		log.debug("currentPageNumber : {}, pageSize : {}", currentPageNumber, pageSize);
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		
		QueryAttr queryAttr = new QueryAttr();
		queryAttr.put("searchText", searchText);
		queryAttr.put("parentYn"  , parentYn);
		Long totalCount = fundService.selectCount(queryAttr);
		PageAttr pageAttr = new PageAttr(totalCount, pageSize, currentPageNumber);
		log.debug("pageAttr:{}", pageAttr);
		
		queryAttr.putClass(pageAttr);
		
		List<Fnd01Fund> list;
		if(totalCount > 0) {
			list = fundService.selectList(queryAttr);
		} else {
			Fnd01Fund fundModel = new Fnd01Fund();
			fundModel.setFnd01FundNm("조회내역이 없습니다.");
			list = new ArrayList<>();
			list.add(fundModel);
		}
		model.addAttribute("list", list);
		model.addAttribute("pageAttr", pageAttr);
		return "/common/popup_fund";
	}
	
	
	//지금 insert_form 에서 url이  var url = '/popup/jnl/acnt/parent?acntCd=jnl10ParentCd&acntNm=jnl10ParentNm'; 이다.
	//이걸 @GetMapping("jnl/acnt/{parentCode}") 으로 받으면 변수PathVariable 인 parentCode = parent 가 되는거다.
	//즉 parentCode 는 parent 이므로 mapper 에서 조건을 parentCode == parent 라면 AND COALESCE(jnl10_slip_yn,'false') = 'false' 이렇게 쓰는 것이다.
	@GetMapping("jnl/acnt/{parentCode}")
	public String jnl (String searchText,  @PathVariable("parentCode") String parentCode,
			@RequestParam(value="acntCd") String acntCd,
			@RequestParam(value="acntNm") String acntNm,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize,
			@RequestParam(value="currentPageNumber", required=false, defaultValue="1") Integer currentPageNumber,
			Model model
			) {
		QueryAttr queryAttr = new QueryAttr();
		queryAttr.put("searchText",searchText);
		queryAttr.put("parentCode", parentCode);
		
		Long totalCount = (long) jnlAcntService.selectCount(queryAttr);
		PageAttr pageAttr = new PageAttr (totalCount, pageSize, currentPageNumber);
		queryAttr.put("pageAttr", pageAttr);
		
		List<Jnl10Acnt> list = jnlAcntService.selectList(queryAttr);
		model.addAttribute("list",list);
		model.addAttribute("pageAttr",pageAttr);
		
		return "/common/popup_jnl_acnt";
	}
	
	//대표계정 팝업
	@GetMapping("jnl/repr-acnt")
	public String reprAcnt(String searchText,
			@RequestParam(value="openerCdId", required=true ) String openerCdId,
			@RequestParam(value="openerNmId", required=true ) String openerNmId,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize,
			@RequestParam(value="currentPageNumber", required=false, defaultValue="1") Integer currentPageNumber,			
			Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("searchText : {}, acntCd:{}, acntNm:{}", searchText);
		log.debug("currentPageNumber : {}, pageSize : {}", currentPageNumber, pageSize);
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		
		QueryAttr queryAttr = new QueryAttr();
		queryAttr.put("searchText", searchText);
		
		
		Long totalCount = (long) jnlReprAcntService.selectCount(queryAttr);
		PageAttr pageAttr = new PageAttr(totalCount, pageSize, currentPageNumber);
		log.debug("pageAttr:{}", pageAttr);
		
		//condition.putClass(pageAttr);
		queryAttr.put("pageAttr", pageAttr);
		
		List<Jnl11ReprAcnt> list = jnlReprAcntService.selectList(queryAttr);
		model.addAttribute("list", list);
		model.addAttribute("pageAttr", pageAttr);
		
		return "/common/popup_jnl_repr_acnt";
	}
	
	
	
	@GetMapping("item")
	public String item(String searchText, String itemCd, String itemNm, 
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize,
			@RequestParam(value="currentPageNumber", required=false, defaultValue="1") Integer currentPageNumber,			
			Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("searchText : {}, itemCd : {}, itemNm: {}", searchText, itemCd, itemNm);
		log.debug("currentPageNumber : {}, pageSize : {}", currentPageNumber, pageSize);
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		
		QueryAttr condition = new QueryAttr();
		condition.put("searchText", searchText);
		//Long.valueOf(int타입머시기) 는 int를 롱으로 강제형변환 해준다. 여기선 기본 롱으로 받아와 필요없지만 참고용.
		Long totalCount = Long.valueOf(itemService.selectCount(condition))	;
		PageAttr pageAttr = new PageAttr(totalCount, pageSize, currentPageNumber);
		log.debug("pageAttr:{}", pageAttr);
		
		condition.putClass(pageAttr);
		
		List<Itm01Item> list;
		if(totalCount > 0) {
			list = itemService.selectList(condition);
		} else {
			Itm01Item itemModel = new Itm01Item();
			itemModel.setItm01ItemNm("조회내역이 없습니다.");
			list = new ArrayList<>();
			list.add(itemModel);
		}
		model.addAttribute("list", list);
		model.addAttribute("pageAttr", pageAttr);
		
		return "/common/popup_item";
	}
	
	
	@GetMapping("book")
	public String book(String searchText, 
			String bookId, 
			String fundCd,
			String fundNm,
			String itemCd,
			String itemNm,
			String holdQty,
			@RequestParam(value="pageSize", required=false, defaultValue="10") Integer pageSize,
			@RequestParam(value="currentPageNumber", required=false, defaultValue="1") Integer currentPageNumber,
			//펀드컨트롤러에서 수탁사 운용사 신탁사 구분하기 위해 받아오는 쿼리 스트링으로 corpType 받겠음
			@RequestParam(value="corpType", required=false) String corpType,
			Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("searchText : {}, bookId : {}, fundCd: {}, fundNm: {}, itemCd: {}, itemNm: {}, holdQty: {}", searchText, bookId ,fundCd, fundNm, itemCd, itemNm, holdQty);
		log.debug("currentPageNumber : {}, pageSize : {}", currentPageNumber, pageSize);
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		
		QueryAttr condition = new QueryAttr();
		condition.put("searchText", searchText);
		condition.put("holdDate", AssetUtil.ymd());
		
		Long totalCount = bookService.selectCount(condition);
		PageAttr pageAttr = new PageAttr(totalCount, pageSize, currentPageNumber);
		log.debug("pageAttr:{}", pageAttr);
		
		condition.putClass(pageAttr);

		condition.put("corpType", corpType);
		
		List<Bok01Book> list = bookService.selectList(condition);
		model.addAttribute("list", list);
		model.addAttribute("pageAttr", pageAttr);
		
		return "/common/popup_book";
	}
}
