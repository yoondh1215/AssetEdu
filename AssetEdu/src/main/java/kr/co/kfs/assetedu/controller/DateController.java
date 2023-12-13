package kr.co.kfs.assetedu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.kfs.assetedu.model.ApiData;
import kr.co.kfs.assetedu.model.Condition;
import kr.co.kfs.assetedu.service.Com03DateService;
import lombok.extern.slf4j.Slf4j;

/**
 * 일자관리 Controller
 *
 */
@Controller
@Slf4j
@RequestMapping("/date")
public class DateController {

	@Autowired
	private Com03DateService service;

	/**
	 * ajax로 호출됨
	 * 일자관리테이블에서 D+days 영업일을 가져와 리턴해준다.
	 * @param stdDate
	 * @param days
	 * @return
	 */
	@ResponseBody
	@GetMapping("getBizDate")
	public String list(
			@RequestParam(value="stdDate",required=true) String stdDate,
			@RequestParam(value="days"   ,required=true) Number days){

		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		log.debug(" D+days 영업일 가져오기");
		log.debug("★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★");
		Condition condition = new Condition();
		condition.put("stdDate", stdDate);
		condition.put("days", days);
		String bizDate = service.selectBizDate(condition);
		
		ApiData apiData = new ApiData();
		apiData.put("bizDate", bizDate);
		
		String json = apiData.toJson();
		return json;
	}

}
