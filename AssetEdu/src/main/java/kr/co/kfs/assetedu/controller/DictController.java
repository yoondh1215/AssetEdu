package kr.co.kfs.assetedu.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.kfs.assetedu.model.ApiData;
import kr.co.kfs.assetedu.model.Condition;
import kr.co.kfs.assetedu.model.Sys02Dict;
import kr.co.kfs.assetedu.service.Sys02DictService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/admin/dict")
public class DictController {
	
	@Autowired
	private Sys02DictService service;
	
	@GetMapping("list")
	public String list(String searchText, String lastDictId, Model model) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("용어사전 리스트");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		model.addAttribute("pageTitle","용어사전 리스트");
		
		Condition condition = new Condition();
		condition.put("searchText", searchText);
		List<Sys02Dict> list = service.selectList(condition);

		model.addAttribute("list"      , list);
		model.addAttribute("lastDictId", lastDictId);
		
		return "/admin/dict/list";
	}

	/**
	 * ajax로 insert 모달에서 처리함으로
	 * 
	 * @param data
	 * @return
	 */
	@ResponseBody
	@PostMapping("insert")
	public String insert(@Valid @RequestBody Sys02Dict dict)  {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("용어 Insert Controller");
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("dict: {}", dict);
		
		ApiData apiData = new ApiData();
		try {
			dict.setSys02DictId(service.getDictId());
			int count = service.insert(dict);

			apiData.put("count", count);
			apiData.put("result", "OK");
			apiData.put("lastDictId", dict.getSys02DictId());
			apiData.put("msg", "저장되었습니다.");
		}
		catch(Exception e) {
			apiData.put("result", "NK:" + e.getMessage());
		}
		
		return apiData.toJson();
	}

	/**
	 * ajax로 update 모달에서 처리함으로
	 * 
	 * @param data
	 * @return
	 */
	@ResponseBody
	@PostMapping("update")
	public String update(@Valid @RequestBody Sys02Dict dict)  {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("용어 update Controller");
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("dict: {}", dict);
		
		ApiData apiData = new ApiData();
		try {
			int count = service.update(dict);
			
			apiData.put("count", count);
			apiData.put("result", "OK");
			apiData.put("lastDictId", dict.getSys02DictId());
			apiData.put("msg", "저장되었습니다.");
		}
		catch(Exception e) {
			apiData.put("result", "NK:" + e.getMessage());
		}
		
		return apiData.toJson();
	}
	
	@GetMapping("delete")
	public String delete(@RequestParam(value="dictId", required=true) String dictId, RedirectAttributes rttr) {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("용어 delete Controller : dictId : " + dictId);
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");

		Sys02Dict dict = new Sys02Dict();
		dict.setSys02DictId(dictId);

		int deletedCount = service.delete(dict);
		if(deletedCount > 0) {
			log.warn("삭제되었습니다");
		}
		
		rttr.addAttribute("lastDictId", dictId);
		return "redirect:/admin/dict/list";
	}

}
