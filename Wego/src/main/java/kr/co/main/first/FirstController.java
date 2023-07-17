package kr.co.main.first;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.main.first.jwt.JWTUtil;

@Controller
public class FirstController {
	@Autowired
	FirstService fService;
	//처음 약관 동의 페이지 이동
	@GetMapping("/firstLogin.do")
	public String firstLogin() {
		return "login/firstLogin";
	}
	//닉네임 중복 확인
	@ResponseBody
	@GetMapping("/check.do")
	public int checkNickName(@RequestParam("nickName")String nickName) {
		return fService.checkNickName(nickName);
	}
	//약관 동의 및 닉네임 유효성 검사 후 사용자 정보 등록
	@ResponseBody
	@PostMapping("/register.do")
	public String registerName(@RequestParam("nickName")String nickName,  HttpSession sess){
//		fService.register(nickName);

		int pk = (Integer)sess.getAttribute("pk");
		return "index.do";
	}
	// 통합 로그인 폼 이동
	@GetMapping("/login.do")
	public String Login() {
		return "login/userLogin";
	}
//	토큰 값 파싱 후  pk 가져오기
	@ResponseBody
	@PostMapping("/tokenCheck.do")
	public String tokenCheck(@RequestParam("accessToken")String accessToken, HttpSession sess) {
		JWTUtil jwt= new JWTUtil();
		String id = jwt.validateToken(accessToken);
		UserVO user = fService.findUser(id);
		
		sess.setAttribute("loginSession", user);
		if(user==null) {
			return "firstLogin";
		}else {
			return "index";
		}
	}
//	로그 아웃
	@GetMapping("/logout.do")
	public String logout(HttpSession sess) {
		sess.invalidate();
		return "login/userLogin";
	}
	
	
}
