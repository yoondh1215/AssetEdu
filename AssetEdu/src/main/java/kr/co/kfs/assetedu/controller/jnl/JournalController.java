package kr.co.kfs.assetedu.controller.jnl;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Objects;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.kfs.assetedu.model.Jnl01Journal;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.service.Jnl01JournalService;
import kr.co.kfs.assetedu.utils.AssetUtil;
import lombok.extern.slf4j.Slf4j;

/**
 * 분개장 콘트롤러
 *
 */
@Slf4j
@Controller
@RequestMapping("/jnl/journal")
public class JournalController {

	private final String baseUrl = "/jnl/journal";
	@Autowired
	private Jnl01JournalService service;
	
	
	@GetMapping("list")
	public String list(String searchText, String frDate, String toDate,  Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("분개장리스트");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		model.addAttribute("pageTitle","분개장");
		
		if(Objects.isNull(frDate)) {
			frDate = AssetUtil.today();
		}else {
			frDate = frDate.replaceAll("\\D", "");
		}
		if(Objects.isNull(toDate)) {
			toDate = AssetUtil.today();
		}else {
			toDate = toDate.replaceAll("\\D", "");
		}
		QueryAttr condition = new QueryAttr();
		condition.put("searchText", searchText);
		condition.put("frDate", frDate);
		condition.put("toDate", toDate);
		List<Jnl01Journal> list = service.selectList(condition);
		model.addAttribute("list", list);
		model.addAttribute("frDate", AssetUtil.displayYmd(frDate));
		model.addAttribute("toDate", AssetUtil.displayYmd(toDate));
		return baseUrl + "/list";
	}
	
	@GetMapping("insert")
	public String insert(Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("분개장 추가 화면");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		model.addAttribute("pageTitle","분개장추가");
		model.addAttribute("jourla"     ,new Jnl01Journal());

		return baseUrl + "/insert_form";
	}
	
	@PostMapping("insert")
	public String insert(@Valid @ModelAttribute Jnl01Journal journal, RedirectAttributes redirectAttr)  {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("분개장 저장 후 리스트로 이동");
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("journal: {}", journal);
		int affectedCount = 0;
		// 패스워드 암호화
		affectedCount = service.insert(journal);
		log.debug("DB에 적용된 갯수 : {}",affectedCount );
		String msg = String.format("분개장 %s 이 추가되었습니다", journal.getJnl01ContId());
		redirectAttr.addAttribute("mode", "insert");
		redirectAttr.addAttribute("msg", msg);
		return "redirect:" + baseUrl + "/success";
	}
	
	@GetMapping("update")
	public String update(@ModelAttribute("journal") Jnl01Journal journal, Model model)  {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("분개장 수정 form 표시");
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		journal = service.selectOne(journal);
		model.addAttribute("journal", journal);
		
		return baseUrl + "/update_form";
	}
	
	@PostMapping("update")
	public String update_form(@ModelAttribute("journal") Jnl01Journal journal, RedirectAttributes redirectAttr) throws UnsupportedEncodingException {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("분개장 수정");
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("journal: {}", journal);
		service.update(journal);	
		
		//성공화면을 redirect
		String msg = String.format("journal %s 이 수정되었습니다.", journal.getJnl01ContId());
		redirectAttr.addAttribute("mode", "update");
		redirectAttr.addAttribute("Jnl01ContId", journal.getJnl01ContId());
		redirectAttr.addAttribute("msg", msg);
		return "redirect:" + baseUrl +"/success"; 
	}
	
	@GetMapping("/delete")
	public String delete(@ModelAttribute Jnl01Journal journal) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("journal삭제할 id :" + journal.getJnl01ContId());
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		
		int deletedCount = service.delete(journal);
		if(deletedCount > 0) {
			
			log.warn("journal id : {}가 삭제되었습니다");
		}
		return "redirect:" + baseUrl + "/list";
	}

	@GetMapping("success")
	public String success(String msg, String mode, String userId, Model model) {
		model.addAttribute("pageTitle","사용자추가");
		model.addAttribute("msg", msg);
		model.addAttribute("mode", mode);
		model.addAttribute("userId", userId);
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("분개장 추가 화면");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		return "redirect:" + baseUrl +"/success";
	}
	
	
	
	
}
