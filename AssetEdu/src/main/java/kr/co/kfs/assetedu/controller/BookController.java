package kr.co.kfs.assetedu.controller;

import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kfs.assetedu.model.Bok01Book;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.service.Bok01BookService;
import kr.co.kfs.assetedu.service.Opr01ContService;
import kr.co.kfs.assetedu.servlet.exception.AssetException;
import kr.co.kfs.assetedu.utils.AssetUtil;
import lombok.extern.slf4j.Slf4j;

/**
 * 보유원장 Controller
 *
 */
@Controller
@Slf4j
@RequestMapping("/book")
public class BookController {

	@Autowired
	private Bok01BookService bookService;
	
	@Autowired
	private Opr01ContService contService;
	
	/**
	 * 보유원장 리스트 
	 * @param searchText 검색어
	 * @param frHoldDate 보유일자 범위시작일
	 * @param toHoldDate 보유일자 범위종료일
	 * @param model
	 * @return
	 */
	
	
	@GetMapping("list")
	public String list(String searchText, String frHoldDate, String toHoldDate, Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("주식 보유원장 리스트");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		model.addAttribute("pageTitle","주식보유원장-리스트");
		
		if(Objects.isNull(frHoldDate)) {
			frHoldDate = AssetUtil.today();
		} else {
			frHoldDate = AssetUtil.removeDash(frHoldDate);
		}

		if(Objects.isNull(toHoldDate)) {
			toHoldDate = AssetUtil.today();
		} else {
			toHoldDate = AssetUtil.removeDash(toHoldDate);
		}
		
		QueryAttr condition = new QueryAttr();
		condition.put("searchText", searchText);
		condition.put("frHoldDate", frHoldDate);
		condition.put("toHoldDate", toHoldDate);

		List<Bok01Book> list = bookService.selectList(condition);

		model.addAttribute("list"      , list);
		model.addAttribute("frHoldDate", AssetUtil.displayYmd(frHoldDate));
		model.addAttribute("toHoldDate", AssetUtil.displayYmd(toHoldDate));
		return "/book/list";
	}

	/**
	 * 보유주식 평가처리 리스트 
	 * @param searchText 검색어
	 * @param evalDate 평가일자
	 * @param model
	 * @return
	 */
	
	@GetMapping("eval_list")
	public String eval_list(String searchText, String evalDate, Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("보유주식 평가처리 리스트");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		model.addAttribute("pageTitle","보유주식-평가처리 리스트");
		
		if(Objects.isNull(evalDate)) {
			evalDate = AssetUtil.today();
		} else {
			evalDate = AssetUtil.removeDash(evalDate);
		}
		
		QueryAttr condition = new QueryAttr();
		condition.put("searchText", searchText);
		condition.put("evalDate"  , evalDate);
		
		List<Bok01Book> list = bookService.selectEvalList(condition);

		model.addAttribute("list"    , list);
		model.addAttribute("evalDate", AssetUtil.displayYmd(evalDate));
		return "/book/eval_list";
	}
	
	
	//이건 부장님꽈 함께 코딩한 부분. 포스트매핑에 이발 인서트로 표현함. 풀버전은 get매핑에 eval_process 임
	@GetMapping("eval_process")
	public String evalInsert(String searchText, String evalDate, Model model) {
		
		log.debug("평가일자 : {}", evalDate);
		
		String resultMsg = "";
		
		if(Objects.isNull(evalDate) || "".equals(evalDate)) {
			resultMsg = "평가일자를 입력하세요";
			model.addAttribute("resultMsg", resultMsg);
		} else {
			evalDate = AssetUtil.removeDash(evalDate);
		}
		
		//평가처리 
		try {
			resultMsg = contService.eval("P", evalDate);
		} catch (AssetException e) {
			model.addAttribute("resultErrMsg", e.getMessage());
		} catch (Exception e) {
			if (e.getMessage() == null) {
				model.addAttribute("resultErrMsg", e.toString());
			} else {
				model.addAttribute("resultErrMsg",e.getMessage());
			}
		}
		
		//처리결과 조회
		QueryAttr condition = new QueryAttr();
		condition.put("evalDate", evalDate);
		condition.put("searchText", searchText);
		
		List<Bok01Book> list = bookService.selectEvalList(condition);
		
		model.addAttribute("list",list);
		model.addAttribute("evalDate", AssetUtil.displayYmd(evalDate));
		return "/book/eval_list";
	}
	
	/*
	@GetMapping("eval_process")
	public String eval_process(String searchText, String evalDate, Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("보유주식 평가처리");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		model.addAttribute("pageTitle","보유주식-평가처리");
		
		String resultMsg;
		
		if(Objects.isNull(evalDate) || "".equals(evalDate)) {
			resultMsg = "평가일자를 선택하세요.";
			model.addAttribute("resultErrMsg", resultMsg);
			return "/book/eval_list"; 
		} else {
			evalDate = AssetUtil.removeDash(evalDate);
		}
		
		//평가처리
		try {
			//resultMsg = bookService.updateEval("P", evalDate);
			//우린 북서비스가 아니라 cont에 있다.
			resultMsg = contService.eval("P", evalDate);
		}
		catch (AssetException e) {
			model.addAttribute("resultErrMsg", e.getMessage());
		}
		catch (Exception e) {
			model.addAttribute("resultErrMsg", e.getMessage());
		}

		//처리결과 조회
		QueryAttr condition = new QueryAttr();
		condition.put("searchText", searchText);
		condition.put("evalDate"  , evalDate);
		
		List<Bok01Book> resultList = bookService.selectEvalList(condition);

		model.addAttribute("list"    , resultList);
		model.addAttribute("evalDate", AssetUtil.displayYmd(evalDate));
		return "/book/eval_list";
	}
	*/
	
	/**
	 * 보유주식 평가취소 
	 * @param evalDate 평가일자
	 * @param model
	 * @return
	 */
	@GetMapping("eval_cancel")
	public String eval_cancel(String searchText, String evalDate, Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("보유주식 평가취소");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		model.addAttribute("pageTitle","보유주식-평가취소");
		
		String resultMsg;
		
		if(Objects.isNull(evalDate) || "".equals(evalDate)) {
			resultMsg = "평가일자를 선택하세요.";
			model.addAttribute("resultErrMsg", resultMsg);
			return "/book/eval_list"; 
		} else {
			evalDate = AssetUtil.removeDash(evalDate);
		}
		
		//평가취소
		try {
			resultMsg = contService.eval("C", evalDate);
		}
		catch (AssetException e) {
			model.addAttribute("resultErrMsg", e.getMessage());
		}
		catch (Exception e) {
			model.addAttribute("resultErrMsg", e.getMessage());
		}

		//처리결과 조회
		QueryAttr condition = new QueryAttr();
		condition.put("searchText", searchText);
		condition.put("evalDate"  , evalDate);
		
		List<Bok01Book> resultList = bookService.selectEvalList(condition);

		model.addAttribute("list"    , resultList);
		model.addAttribute("evalDate", AssetUtil.displayYmd(evalDate));
		return "/book/eval_list";
	}
}
