package kr.co.kfs.assetedu.controller.jnl;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kfs.assetedu.model.Jnl12Tr;
import kr.co.kfs.assetedu.model.Jnl13TrMap;
import kr.co.kfs.assetedu.model.QueryAttr;
import kr.co.kfs.assetedu.service.Jnl12TrService;
import kr.co.kfs.assetedu.service.Jnl13TrMapService;
import kr.co.kfs.assetedu.servlet.exception.AssetJsonException;
import kr.co.kfs.assetedu.servlet.view.JsonView;
import lombok.extern.slf4j.Slf4j;

/**
 * 거래유형별 분개맵핑 Controller
 *
 */
@Slf4j
@Controller
@RequestMapping("/jnl/trmap")
public class TrMapController {
	
	private final String baseUrl = "/jnl/trmap";
	
	@Autowired
	private Jnl12TrService service12; //거래코드 서비스

	@Autowired
	private Jnl13TrMapService service13; //거래코드 맵핑 서비스
		
	@GetMapping("list")
	public ModelAndView list(@RequestHeader Map<String, String> headers, String searchText) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("거래유형별 분개맵핑");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		
		String viewType = headers.get("view-type");
		ModelAndView mav = new ModelAndView();
		mav.addObject("pageTitle","거래유형별 분개맵핑");
		if("json".equals(viewType)) {
			mav.setView(new JsonView());
		}else {
			mav.setViewName(baseUrl + "/list");
		}
		
		QueryAttr condition = new QueryAttr();
		condition.put("searchText", searchText);
		List<Jnl12Tr> list = service12.selectList(condition);
		mav.addObject("list12", list);
		
		return mav;
	}
	/**
	 * jnl12Tr에 추가
	 * @param tr12
	 * @param searchText
	 * @return
	 */
	@PostMapping("/tr12/insert")
	public ModelAndView insertJnl12Tr(@Valid @RequestBody Jnl12Tr jnl12Tr, String searchText)  {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("거래유형별  추가 {}, searchText: {}", jnl12Tr, searchText);
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		ModelAndView mav = new ModelAndView();
		mav.setView(new JsonView());
		
		try {
			Jnl12Tr already = service12.selectOne(jnl12Tr);
			if(already != null) {
				throw new AssetJsonException("중복오류입니다");
			}
			int i = service12.insert(jnl12Tr);
			
			QueryAttr condition = new QueryAttr();
			condition.put("searchText", searchText);
			
			List<Jnl12Tr> list = service12.selectList(condition);
			mav.addObject("list", list);
			
			if(i>0) {
				mav.addObject("result","OK");
			}else {
				mav.addObject("result","NK");
			}
			
		} catch (Exception e) {
			throw new AssetJsonException(e.getMessage());
		}
		return mav;
	}	
	@PostMapping("/tr12/update")
	public ModelAndView updateJnl12Tr(@Valid @RequestBody Jnl12Tr jnl12Tr, String searchText)  {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("거래유형별  수정 {}, searchText: {}", jnl12Tr, searchText);
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		ModelAndView mav = new ModelAndView();
		mav.setView(new JsonView());
		try {

			int i = service12.update(jnl12Tr);
			
			QueryAttr condition = new QueryAttr();
			condition.put("searchText", searchText);
			
			List<Jnl12Tr> list = service12.selectList(condition);
			mav.addObject("list", list);
			
			if(i>0) {
				mav.addObject("result","OK");
			}else {
				mav.addObject("result","NK");
			}
			return mav;
		} catch (Exception e) {
			throw new AssetJsonException(e.getMessage());
		}
		
		
	}	
	
	@DeleteMapping("/jnl12tr/{jnl12TrCd}")
	public ModelAndView deleteJnl12Tr(@PathVariable("jnl12TrCd") String jnl12TrCd, String searchText) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("trMap삭제할 id : {}",jnl12TrCd);
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		
		ModelAndView mav = new ModelAndView();
		mav.setView(new JsonView());

		int deletedCount = service12.delete(jnl12TrCd);
		if(deletedCount > 0) {			
			mav.addObject("result","OK");

			QueryAttr condition = new QueryAttr();
			condition.put("searchText", searchText);

			List<Jnl12Tr> list = service12.selectList(condition);
			mav.addObject("list", list);
			log.warn("trp id : {}가 삭제되었습니다", jnl12TrCd);
		}
		return mav;
	}	
	@GetMapping("/jnl12tr/{jnl12TrCd}")
	public ModelAndView getOneJnl12Tr(@PathVariable("jnl12TrCd") String jnl12TrCd) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("trMap get id : {}",jnl12TrCd);
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		
		ModelAndView mav = new ModelAndView();
		mav.setView(new JsonView());
		mav.addObject("result","NK");
		Jnl12Tr jnl12Tr = service12.selectOne(jnl12TrCd);
		if(jnl12Tr != null ) {			
			mav.addObject("result","OK");
			mav.addObject("jnl12Tr", jnl12Tr);
			log.debug("tr12  : {}", jnl12TrCd);
		}
		return mav;
	}	
	
	//========================================================================
	
	@GetMapping("/jnl13/{jnl13TrCd}")
	public ModelAndView listJnl13(@PathVariable("jnl13TrCd") String jnl13TrCd) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("jnl13 리스트  id : {}",jnl13TrCd);
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		ModelAndView mav = new ModelAndView();
		mav.setView(new JsonView());
		mav.addObject("result","NK");
		
		List<Jnl13TrMap> list = service13.selectList(jnl13TrCd);
		mav.addObject("result","OK");
		mav.addObject("list", list);
		
		return mav;
	}
	@PostMapping("/tr13/update")
	public ModelAndView updateJnl13Tr(@Valid @RequestBody Jnl13TrMap jnl13TrMap)  {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("거래유형별 분개맵핑 수정 form 표시");
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("jnl13TrMap: {}", jnl13TrMap);
		try {
			ModelAndView mav = new ModelAndView();
			mav.setView(new JsonView());
			
			int i = service13.update(jnl13TrMap);
			String result = "NK";
			if(i > 0) {
				result = "OK";
			}
			List<Jnl13TrMap>list = service13.selectList(jnl13TrMap.getJnl13TrCd());
			mav.addObject("list", list);
			mav.addObject("result", result);
			
			return mav;
			
		} catch (Exception e) {
			throw new AssetJsonException(e.getMessage());
		}
	}

	@PostMapping("/tr13/insert")
	public ModelAndView insertJnl13Tr(@Valid  @RequestBody Jnl13TrMap jnl13TrMap)  {
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("거래유형별 분개맵핑 추가 후 리스트로 이동");
		log.debug("★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆★★★★★☆☆☆☆☆☆");
		log.debug("jnl13TrMap: {}", jnl13TrMap);
		try {
			ModelAndView mav = new ModelAndView();
			mav.setView(new JsonView());
			
			Jnl13TrMap already = service13.selectOne(jnl13TrMap);
			if(already != null) {
				throw new AssetJsonException("중복오류: 이미 존재하는 데이터입니다1");
			}
			int i = service13.insert(jnl13TrMap);
			String result = "NK";
			if(i > 0) {
				result = "OK";
			}
			List<Jnl13TrMap>list = service13.selectList(jnl13TrMap.getJnl13TrCd());
			mav.addObject("list", list);
			mav.addObject("result", result);
			return mav;
			
		} catch (Exception e) {
			throw new AssetJsonException(e.getMessage());
		}
	}
	@GetMapping("/jnl13tr/{jnl13TrCd}/{jnl13Seq}")
	public ModelAndView getJnl13(@PathVariable("jnl13TrCd") String jnl13TrCd, @PathVariable("jnl13Seq") Integer jnl13Seq) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("trMap id : {},{}",jnl13TrCd, jnl13Seq);
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		ModelAndView mav = new ModelAndView();
		mav.setView(new JsonView());
		Jnl13TrMap jnl13 = service13.selectOne(jnl13TrCd, jnl13Seq);
		mav.addObject("jnl13TrMap", jnl13);
		return mav;
	}
	@DeleteMapping("/jnl13tr/{jnl13TrCd}/{jnl13Seq}")
	public ModelAndView deleteJnl13(@PathVariable("jnl13TrCd") String jnl13TrCd, @PathVariable("jnl13Seq") Integer jnl13Seq) {
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("trMap삭제할 id : {},{}",jnl13TrCd, jnl13Seq);
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		ModelAndView mav = new ModelAndView();
		mav.setView(new JsonView());
		
		Jnl13TrMap jnl13 = new Jnl13TrMap();
		jnl13.setJnl13TrCd(jnl13TrCd);
		jnl13.setJnl13Seq(jnl13Seq);
		int deletedCount = service13.delete(jnl13);
		if(deletedCount > 0) {
			log.warn("trMap id : {}가 삭제되었습니다");
		}
		List<Jnl13TrMap>list = service13.selectList(jnl13TrCd);
		mav.addObject("list", list);
		return mav;
	}
//
	@GetMapping("success")
	public String success(String msg, String mode, String jnl13TrCd, Model model) {
		model.addAttribute("pageTitle","거래유형별 분개맵핑 관리");
		model.addAttribute("msg", msg);
		model.addAttribute("mode", mode);
		model.addAttribute("jnl13TrCd", jnl13TrCd);
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug("거래유형별 분개맵핑 추가 화면");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		return baseUrl +"/success";
	}
}
