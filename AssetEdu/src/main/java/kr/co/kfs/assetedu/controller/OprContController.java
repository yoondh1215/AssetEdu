package kr.co.kfs.assetedu.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Objects;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.kfs.assetedu.model.Opr01Cont;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.service.Com02CodeService;
import kr.co.kfs.assetedu.service.Opr01ContService;
import kr.co.kfs.assetedu.servlet.exception.AssetException;
import kr.co.kfs.assetedu.utils.AssetUtil;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/opr")
public class OprContController {

	@Autowired
	private Opr01ContService contService;

	@Autowired
	private Com02CodeService codeService;

	@GetMapping("buy_list")
	public String buyList(String frDate, String toDate, String searchText,  Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("주식매수거래 리스트");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		model.addAttribute("pageTitle","주식매수거래-리스트");
		
		if (Objects.isNull(frDate)) {
			frDate = AssetUtil.today();
		} else {
			frDate = AssetUtil.removeDash(frDate);	//날짜 포맷으로 sql에 넣어야 해서 대쉬 다 없애줘야 함
		}
		if(Objects.isNull(toDate)) {
			toDate = AssetUtil.today();
		} else {
			toDate = AssetUtil.removeDash(toDate);
		}

		QueryAttr condition = new QueryAttr();
		condition.put("frDate"    , frDate);
		condition.put("toDate"    , toDate);
		condition.put("searchText", searchText);
		condition.put("trType"    , "BUY");
		condition.put("pageType","BUY");
		

		List<Opr01Cont> list = contService.selectList(condition);
		model.addAttribute("list"  , list);
		model.addAttribute("frDate", AssetUtil.displayYmd(frDate));	//반대로 sql에서 받을 땐 또 대쉬를 넣어줘야 함. 8자리에 대쉬 부텨서 10자리 만들어줌
 		model.addAttribute("toDate", AssetUtil.displayYmd(toDate));

		return "/opr/buy_list";
	}

	@GetMapping("buy_insert")
	public String buyInsert(Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("주식매수 등록 Form화면");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		model.addAttribute("pageTitle","주식매수 체결내역 등록 및 처리");
		
		Opr01Cont cont = new Opr01Cont();
		cont.setOpr01ContDate(AssetUtil.ymd());	//체결일자 초시SET = 당일 
		model.addAttribute("cont",cont);
		
		
		model.addAttribute("trCdList", codeService.selectTrList("BUY"));
//		SELECT jnl12_tr_cd         AS com02_dtl_cd        /* 거래코드 */                   
//        , jnl12_tr_nm         AS com02_code_nm        /* 거래명 */                    
//        FROM jnl12_tr
//        WHERE jnl12_use_page_type = 'BUY'
//        AND jnl12_use_yn        = 'true'
		//코드맵퍼에 이렇게 조회되서 장외매수 만 나오더라. 

		return "/opr/buy_insert_form";
	}

	@PostMapping("buy_insert")
	public String buyInsert(@Valid @ModelAttribute("cont") Opr01Cont cont, BindingResult bindingResult, RedirectAttributes redirectAttr, Model model) throws UnsupportedEncodingException {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("주식매수처리");
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("cont: {}", cont);

		if(bindingResult.hasErrors()) {
			model.addAttribute("trCdList", codeService.selectTrList("BUY"));
			return "/opr/buy_insert_form";			
		}

		String msg;
		String resultMsg;
		
		try {
			resultMsg = contService.insert(cont);
		}
		catch (AssetException e) {
			resultMsg = e.getMessage();
		}
		catch (Exception e) {
			resultMsg = e.getMessage();
		}
		

		if("Y".equals(resultMsg)) {
			msg = String.format("\"%s %s주\" 매수처리가 완료되었습니다.", cont.getOpr01ItemNm(), cont.getOpr01Qty());
			redirectAttr.addAttribute("mode", "insert");
			redirectAttr.addAttribute("msg" , msg);
			return "redirect:/opr/buy_success";
		} else {
			model.addAttribute("trCdList", codeService.selectTrList("BUY"));			
			bindingResult.addError(new FieldError("", "", resultMsg));			
			return "/opr/buy_insert_form";
		}
	}

	@GetMapping("buy_delete")
	public String buyDelete(@ModelAttribute("cont") Opr01Cont cont, Model model) throws UnsupportedEncodingException {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("매수내역 상세조회 및 취소 Form화면");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("cont: {}", cont);

		cont = contService.selectOne(cont);
		model.addAttribute("cont", cont);

		return "/opr/buy_delete_form";
	}

	@PostMapping("buy_delete")
	public String buyDelete(@ModelAttribute("cont") Opr01Cont cont, BindingResult bindingResult, RedirectAttributes redirectAttr, Model model) throws UnsupportedEncodingException {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("주식매수 취소처리");
		log.debug("★★★★★☆☆☆☆☆k☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("cont: {}", cont);

		String msg;
		String resultMsg;
			
		try {
			cont = contService.selectOne(cont);
			resultMsg = contService.delete(cont);
		}
		catch (AssetException e) {
			resultMsg = e.getMessage();
		}
		catch (Exception e) {
			resultMsg = e.getMessage();
		}
		
		if("Y".equals(resultMsg)) {
			msg = String.format("\"%s %s주\" 매수취소가 완료되었습니다.", cont.getOpr01ItemNm(), cont.getOpr01Qty());
			redirectAttr.addAttribute("mode", "delete");
			redirectAttr.addAttribute("msg" , msg);
			return "redirect:/opr/buy_success";
		} else {
    		bindingResult.addError(new FieldError("", "", resultMsg));			
			return "/opr/buy_delete_form";
		}
	}

	@GetMapping("buy_success")
	public String buySuccess(String msg, String mode, Long contId, Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("매수처리 완료 화면");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		model.addAttribute("pageTitle","매수처리");
		model.addAttribute("msg", msg);
		model.addAttribute("mode", mode);
		model.addAttribute("contId", contId);
		return "/opr/buy_success";
	}

	@GetMapping("sell_list")
	public String sellList(String frDate, String toDate, String searchText,  Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("주식매도거래 리스트");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		model.addAttribute("pageTitle","주식매도거래-리스트");
		
		if(Objects.isNull(frDate)) {
			frDate = AssetUtil.today();
		} else {
			frDate = AssetUtil.removeDash(frDate);
		}

		if(Objects.isNull(toDate)) {
			toDate = AssetUtil.today();
		} else {
			toDate = AssetUtil.removeDash(toDate);
		}

		QueryAttr condition = new QueryAttr();
		condition.put("frDate"    , frDate);
		condition.put("toDate"    , toDate);
		condition.put("searchText", searchText);
		condition.put("trType"    , "SELL");

		List<Opr01Cont> list = contService.selectList(condition);
		model.addAttribute("list"  , list);
		model.addAttribute("frDate", AssetUtil.displayYmd(frDate));
		model.addAttribute("toDate", AssetUtil.displayYmd(toDate));

		return "/opr/sell_list";
	}

	@GetMapping("sell_insert")
	public String sellInsert(Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("주식매도 등록 Form화면");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		model.addAttribute("pageTitle","주식매도 체결내역 등록 및 처리");
		Opr01Cont cont = new Opr01Cont();
		cont.setOpr01ContDate(AssetUtil.ymd());
		model.addAttribute("cont",cont);
		model.addAttribute("trCdList", codeService.selectTrList("SELL"));

		return "/opr/sell_insert_form";
	}

	@PostMapping("sell_insert")
	public String sellInsert(@Valid @ModelAttribute("cont") Opr01Cont cont, BindingResult bindingResult, RedirectAttributes redirectAttr, Model model) throws UnsupportedEncodingException {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("주식매도처리");
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("cont: {}", cont);
		
		if(bindingResult.hasErrors()) {
			model.addAttribute("trCdList", codeService.selectTrList("SELL"));
			return "/opr/sell_insert_form";			
		}

		String msg;
		String resultMsg;
		
		try {
			resultMsg = contService.insert(cont);
		}
		catch (AssetException e) {
			resultMsg = e.getMessage();
		}
		catch (Exception e) {
			resultMsg = e.getMessage();
		}

		if("Y".equals(resultMsg)) {
			msg = String.format("\"%s %s주\" 매도처리가 완료되었습니다.", cont.getOpr01ItemNm(), cont.getOpr01Qty());
			redirectAttr.addAttribute("mode", "insert");
			redirectAttr.addAttribute("msg" , msg);
			return "redirect:/opr/sell_success";
		} else {
			model.addAttribute("trCdList", codeService.selectTrList("SELL"));			
			bindingResult.addError(new FieldError("", "", resultMsg));			
			return "/opr/sell_insert_form";
		}
	}

	@GetMapping("sell_delete")
	public String sellDelete(@ModelAttribute("cont") Opr01Cont cont, Model model) throws UnsupportedEncodingException {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("매도내역 상세조회 및 취소 Form화면");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("cont: {}", cont);

		cont = contService.selectOne(cont);
		model.addAttribute("cont", cont);

		return "/opr/sell_delete_form";
	}

	@PostMapping("sell_delete")
	public String sellDelete(@ModelAttribute("cont") Opr01Cont cont, BindingResult bindingResult, RedirectAttributes redirectAttr, Model model) throws UnsupportedEncodingException {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("주식매도 취소처리");
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("cont: {}", cont);

		String msg;
		String resultMsg;
		
		try {
			cont = contService.selectOne(cont);
			resultMsg = contService.delete(cont);
		}
		catch (AssetException e) {
			resultMsg = e.getMessage();
		}
		catch (Exception e) {
			resultMsg = e.getMessage();
		}
		
		if("Y".equals(resultMsg)) {
			msg = String.format("\"%s %s주\" 매도취소가 완료되었습니다.", cont.getOpr01ItemNm(), cont.getOpr01Qty());
			redirectAttr.addAttribute("mode", "delete");
			redirectAttr.addAttribute("msg" , msg);
			return "redirect:/opr/sell_success";
		} else {
    		bindingResult.addError(new FieldError("", "", resultMsg));			
			return "/opr/sell_delete_form";
		}
	}

	@GetMapping("sell_success")
	public String sellSuccess(String msg, String mode, Long contId, Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("매도처리 완료 화면");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		model.addAttribute("pageTitle","매도처리");
		model.addAttribute("msg", msg);
		model.addAttribute("mode", mode);
		model.addAttribute("contId", contId);
		return "/opr/sell_success";
	}
	
}