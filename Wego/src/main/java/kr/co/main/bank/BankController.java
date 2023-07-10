package kr.co.main.bank;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/bank")
public class BankController {
	@Autowired
	BankService Service;
	
	List<BankPlanVO> planList;
	
	// test: jsp만 띄우기
	@GetMapping("/index.do")
	public String test() {
		return "bank/index";
	}
	
	@GetMapping("/updatePlanState.do")
	@ResponseBody
	public Map<String, Object> updatePlanState() {
		Map<String, Object> map = new HashMap<>();
		map.put("updatePlanState", Service.updatePlanState());
		map.put("insertBankPlanChk", Service.insertBankPlanChk());
		
		return map;
	}
	
	@GetMapping("/selectEndPlan.do")
	@ResponseBody
	public List<BankPlanVO> selectEndPlan() {
		planList = Service.selectEndPlan();
		return planList;
	}
	
	@GetMapping("/randomAccount.do")
	@ResponseBody
	public Map<String, Object> randomAccount() {
		Map<String, Object> outputMap = Service.randomAccount(planList);
		return outputMap;
	}
	
	@GetMapping("/insertAccountList.do")
	@ResponseBody
	public void insertAccountList() {
		Service.insertAccountList(planList);
	}
}
