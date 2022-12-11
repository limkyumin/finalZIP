package com.kh.zip.userinfo.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Random;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.kh.zip.common.model.vo.userPageInfo;
import com.kh.zip.common.template.userPagination;
import com.kh.zip.noticelist.model.service.Noticelistservice;
import com.kh.zip.roomlist.model.service.Roomlistservice;
import com.kh.zip.roomlist.model.vo.Wishlist;
import com.kh.zip.userinfo.model.service.Userinfoservice;
import com.kh.zip.userinfo.model.vo.Naver;
import com.kh.zip.userinfo.model.vo.Userinfo;


@Controller
public class Userinfocontroller {
	
@Autowired
private Userinfoservice userinfoservice;

@Autowired
private Roomlistservice roomlistservice;

@Autowired
Noticelistservice noticelistservice;

@Autowired
private BCryptPasswordEncoder bcryptPasswordEncoder;

@Autowired
private JavaMailSender mailSender;


//	//로그인/회원가입 시작
//	@RequestMapping("loginandnewuser.ui")
//	public String loginandnewuser() {
//	
//	return "userinfo/loginandnewuser";
//	}
	
	@RequestMapping(value = "loginandnewuser.ui", method = { RequestMethod.GET, RequestMethod.POST })	
	public String login(Model model, HttpSession session) {				
		
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);				
		//https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&		
		//redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125		
		model.addAttribute("url", naverAuthUrl); 		
		return "userinfo/loginandnewuser";	
		}
	//로그인/회원가입 끝
	
	//로그인 시작
	@RequestMapping("loginuser.ui")
	public ModelAndView loginuser(Userinfo u, HttpSession session, ModelAndView mv) {
	
		Userinfo loginUser = userinfoservice.loginuser(u);
		
		if(loginUser != null && bcryptPasswordEncoder.matches(u.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("alertMsg", loginUser.getUserName()+"님 안녕하세요!");
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}else {
			session.setAttribute("alertMsg","아이디 또는 비밀번호를 다시 입력해 주세요.");
			mv.setViewName("userinfo/loginandnewuser");
			}
		
		return mv;
	}
	//로그인 끝
	
	//로그아웃 시작
	@RequestMapping("logout.ui")
	public String logoutMember(HttpSession session) {
		
		session.invalidate();
		return "redirect:/";
	}
	//로그아웃 끝
	
	//회원가입 페이지 이동 시작
	@RequestMapping("insertuserpage.ui")
	public String insertuserpage() {
		
		return "userinfo/insertuserpage";
	}
	//회원가입 페이지 이동 끝
	
	//회원가입 입력 양식 이동 시작
	@RequestMapping("newuserpage.ui")
	public String newuserpage() {
		
		return "userinfo/newuserpage";
	}
	//회원가입 입력 양식 이동 끝
	
	//회원가입 시작
	@RequestMapping("insertuser.ui")
	public String insertuser(Userinfo u,HttpSession session,Model model) {
		String encPwd = bcryptPasswordEncoder.encode(u.getUserPwd());
		u.setUserPwd(encPwd);
		
		int result = userinfoservice.insertuser(u);
		
		if(result>0) {
			session.setAttribute("alertMsg", "회원가입을 성공하였습니다.");
			return "redirect:/";
		} else {
			session.setAttribute("alertMsg", "회원가입을 실패하였습니다");
			return "redirect:/";
			}
	}
	//회원가입 끝
	
	//아이디 중복체크 시작
	@ResponseBody
	@RequestMapping(value="idCheck.ui",produces="text/html; charset=UTF-8")
	public void idCheck(Model model,HttpServletResponse response,String checkId) throws IOException {	
		
		int count = userinfoservice.idCheck(checkId);
		
		if(count>0) { 
			response.getWriter().print("NNNNN");
		} else { 
			response.getWriter().print("NNNNY");
		}
	}
	//아이디 중복체크 끝
	
	//이메일 중복체크 시작
	@ResponseBody
	@RequestMapping(value="mailCheck.ui",produces="text/html; charset=UTF-8")
	public void mailCheck(Model model,HttpServletResponse response,String checkId) throws IOException {	
		
		int count = userinfoservice.mailCheck(checkId);
		
		if(count>0) { 
			response.getWriter().print("NNNNN");
		} else { 
			response.getWriter().print("NNNNY");
		}
	}
	//이메일 중복체크 끝
	
	//아이디/비밀번호 찾기 시작
	@RequestMapping("idpwsearch.ui")
	public String idpwsearch(HttpSession session) {
		
		return "userinfo/idpwsearch";
	}
	//아이디/비밀번호 찾기 끝
	
	//아이디 찾기 시작
	@RequestMapping(value = "idsearch.ui", method = RequestMethod.POST)
	@ResponseBody
	public String idsearch(String userEmail,Userinfo u, Model model,HttpSession session) {
		
		String result = userinfoservice.idsearch(u);
		
		if(result != null) { 
			String setFrom = "amiq3@naver.com";
	        String toMail = userEmail;
	        String title = "ZIP 아이디 찾기 이메일 입니다.";
	        String content = 
	                "ZIP 아이디 찾기 이메일 입니다." +
	                "<br><br>" + 
	                "회원님의 아이디는 " + result + "입니다.";
	        try {
	            
	        	MimeMessage message = mailSender.createMimeMessage();
	            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
	            helper.setFrom(new InternetAddress(setFrom,"ZIP","UTF-8"));
	            helper.setTo(toMail);
	            helper.setSubject(title);
	            helper.setText(content,true);
	            mailSender.send(message);
	            
	        }catch(Exception e) {
	            e.printStackTrace();
	        }
	        
	        return content;
	 
		} else {
			session.setAttribute("alertMsg","아이디찾기에 실패하였습니다. 다시 입력해 주세요");
			return "userinfo/idpwsearch";
	}
	
	}
	//아이디 찾기 끝
	
	//비밀번호 찾기 시작
		@RequestMapping(value = "pwsearch.ui", method = RequestMethod.POST)
		@ResponseBody
		public String pwsearch(String userEmail,Userinfo u, Model model,HttpSession session) {
			Random random = new Random();
			int checkNum = random.nextInt(888888) + 111111;

			String result = userinfoservice.pwsearch(u);

			if(result != null) { 
				String setFrom = "amiq3@naver.com";
		        String toMail = userEmail;
		        String title = "ZIP 임시 비밀번호 발급 이메일 입니다.";
		        String content = 
		                "ZIP 임시 비밀번호 발급 이메일 입니다." +
		                "<br><br>" + 
		                "회원님의 임시비밀번호는 " + checkNum + "입니다." +
		                "<br><br>" +
		                "임시비밀번호 발급 받으신 후에 비밀번호를 변경해주세요.";
		        try {
		            
		        	MimeMessage message = mailSender.createMimeMessage();
		            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
		            helper.setFrom(new InternetAddress(setFrom,"ZIP","UTF-8"));
		            helper.setTo(toMail);
		            helper.setSubject(title);
		            helper.setText(content,true);
		            mailSender.send(message);
		            
		        }catch(Exception e) {
		            e.printStackTrace();
		        }
		        
		        Userinfo u2 = new Userinfo();
		        
		        u2.setUserId(u.getUserId());
		        
		        u2.setUserPwd(Integer.toString(checkNum));
		        
		        String encPwd = bcryptPasswordEncoder.encode(u2.getUserPwd());
		        u2.setUserPwd(encPwd);

		        int result2 = userinfoservice.updateuserpwd(u2);
		        
		        if(result2>0) {
		        	Userinfo updatpw = userinfoservice.loginuser(u2);
					session.setAttribute("loginUser", updatpw);
		        }
		        
		        return Integer.toString(checkNum);
		 
			} else {
				session.setAttribute("alertMsg","비밀번호찾기에 실패하였습니다. 다시 입력해 주세요");
				return "userinfo/idpwsearch";
		}
		
	}
	//비밀번호 찾기 끝
	
	//마이페이지 시작
	@RequestMapping("mypage.ui")
	public String mypage() {
		
		return "userinfo/mypage";
	}
	//마이페이지 끝
	
	//회원정보 변경 페이지 시작
	@RequestMapping("userinfochange.ui")
	public String userinfochange() {
		
		return "userinfo/userinfochange";
	}
	//회원정보 변경 페이지 끝
	
	//회원정보 변경 - 이름
	@RequestMapping("updateusername.ui")
	public String updateusername(Userinfo u,HttpSession session,Model model) {
		
		int result = userinfoservice.updateusername(u);
		
		if(result>0) {
			Userinfo updateid = userinfoservice.loginuser(u);
			session.setAttribute("loginUser", updateid);
			session.setAttribute("alertMsg", "이름 변경에 성공하였습니다");
			return "userinfo/userinfochange";
		} else {
			session.setAttribute("alertMsg","이름 변경에 실패하였습니다");
			return "userinfo/userinfochange";
		}
	}
	
	//회원정보 변경 - 전화번호
	@RequestMapping("updateuserphone.ui")
	public String updateuserphone(Userinfo u,HttpSession session,Model model) {

		int result = userinfoservice.updateuserphone(u);

		if(result>0) {
			Userinfo updateph = userinfoservice.loginuser(u);
			session.setAttribute("loginUser", updateph);
			session.setAttribute("alertMsg", "전화번호 변경에 성공하였습니다");
			return "userinfo/userinfochange";
		} else {
			session.setAttribute("alertMsg","전화번호 변경에 실패하였습니다");
			return "userinfo/userinfochange";
		}
	}
	
	//회원정보 변경 - 이메일
	@RequestMapping("updateuseremail.ui")
	public String updateuseremail(Userinfo u,HttpSession session,Model model) {
		 
		int result = userinfoservice.updateuseremail(u);
		
		if(result>0) {
			Userinfo updatema = userinfoservice.loginuser(u);
			session.setAttribute("loginUser", updatema);
			session.setAttribute("alertMsg", "이메일 변경에 성공하였습니다");
			return "userinfo/userinfochange";
		} else {
			session.setAttribute("alertMsg","이메일 변경에 실패하였습니다");
			return "userinfo/userinfochange";
		}
	}
	
	//회원정보 변경 - 비밀번호
		@RequestMapping("updateuserpwd.ui")
		public String updateuserpwd(Userinfo u,HttpSession session,Model model) {
			 
			String encPwd = bcryptPasswordEncoder.encode(u.getUserPwd());
			u.setUserPwd(encPwd);
			
			int result = userinfoservice.updateuserpwd(u);
			
			if(result>0) {
				Userinfo updatpwd = userinfoservice.loginuser(u);
				session.setAttribute("loginUser", updatpwd);
				session.setAttribute("alertMsg", "비밀번호 변경에 성공하였습니다");
				return "userinfo/userinfochange";
			} else {
				session.setAttribute("alertMsg","비밀번호 변경에 실패하였습니다");
				return "userinfo/userinfochange";
			}
		}
		
	//회원탈퇴 페이지로 이동 시작
	@RequestMapping("deleteuserpage.ui")
	public String deleteuserpage() {
		
		return "userinfo/deleteuserpage";
	}	
	//회원탈퇴 페이지로 이동 끝
		
	//회원탈퇴 시작
	@RequestMapping("deleteuser.ui")
	public String userdelete(String userPwd,HttpSession session,Model model) {
		
		String encPwd = ((Userinfo)session.getAttribute("loginUser")).getUserPwd();
		String userId = ((Userinfo)session.getAttribute("loginUser")).getUserId();
		
		if(bcryptPasswordEncoder.matches(userPwd, encPwd)) {
			int result = userinfoservice.deleteuser(userId);
			
			if(result>0) { 
				session.removeAttribute("loginUser");
				session.setAttribute("alertMsg", "회원탈퇴를 성공했습니다.");
				
				return "redirect:/";
				
			} else { 
				session.setAttribute("alertMsg","회원탈퇴를 실패하셨습니다.");
				return "userinfo/deleteuserpage";
			}
			}else {
				session.setAttribute("alertMsg", "비밀번호 입력을 잘못하셨습니다.");
				return "userinfo/deleteuserpage";
			}
	}
	//회원탈퇴 끝
	
	//관심목록 시작
	@RequestMapping(value="wishlist.ro")
	public String roomenroll(@RequestParam(value="upage",defaultValue="1") int currentPage,Integer userNo, Model model) {
		
		int pageLimit = 10;
		int wishLimit = 5;
		
		int listCount = roomlistservice.wishListCount(userNo);
		
		userPageInfo pi = userPagination.getPageInfo(listCount, currentPage, pageLimit, wishLimit);
		
		ArrayList<Wishlist> list = roomlistservice.mywishlist(userNo, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "userinfo/mywishlist";
	}
	//관심목록 끝
	
	//이메일 인증 시작
	@ResponseBody
	@RequestMapping(value = "email.ui", method = RequestMethod.POST)
	public String emailAuth(String email) {		
		Random random = new Random();
		int checkNum = random.nextInt(888888) + 111111;

		/* 이메일 보내기 */
        String setFrom = "amiq3@naver.com";
        String toMail = email;
        String title = "회원가입 인증 이메일 입니다.";
        String content = 
                "홈페이지를 방문해주셔서 감사합니다." +
                "<br><br>" + 
                "인증 번호는 " + checkNum + "입니다." + 
                "<br>" + 
                "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
        
        try {
            
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(new InternetAddress(setFrom,"ZIP","UTF-8"));
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return Integer.toString(checkNum);
 
	}
	//이메일 인증 끝
	

 	
	
		private Naverloginbo naverLoginBO;	
		private String apiResult = null;		
		
		@Autowired	
		private void setNaverLoginBO(Naverloginbo naverLoginBO) {		
			this.naverLoginBO = naverLoginBO;	
			} 	
		
		 	
		
		//네이버 로그인 성공시 callback호출 메소드	
	@RequestMapping(value = "/callback", method = { RequestMethod.GET, RequestMethod.POST })	
	public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException, ParseException {				
			
		System.out.println("여기는 callback");		
			
		OAuth2AccessToken oauthToken;      
			
		oauthToken = naverLoginBO.getAccessToken(session, code, state);         
		//1. 로그인 사용자 정보를 읽어온다.		
		apiResult = naverLoginBO.getUserProfile(oauthToken);  
		//String형식의 json데이터				
			
			/** apiResult json 구조		
			 * {"resultcode":"00",		 "message":"success",		 
			 * "response":{"id":"33666449","nickname":"shinn****",
			 * "age":"20-29","gender":"M","email":"sh@naver.com","name":"\uc2e0\ubc94\ud638"}}		**/
			
		//2. String형식인 apiResult를 json형태로 바꿈		
		JSONParser parser = new JSONParser();		
		Object obj = parser.parse(apiResult);		
		JSONObject jsonObj = (JSONObject) obj;				
			
		//3. 데이터 파싱 		
		//Top레벨 단계 _response 파싱		
		JSONObject response_obj = (JSONObject)jsonObj.get("response");		
			
		//response의 nickname값 파싱		
		String nickname = (String)response_obj.get("nickname"); 		
			
		System.out.println(nickname);				
			
		//4.파싱 닉네임 세션으로 저장		
		session.setAttribute("sessionId",nickname); //세션 생성				
		model.addAttribute("result", apiResult);	     		
		System.out.println("여기찍힙니까???");		
		return "main";	
	}	
		
		//로그아웃	
		@RequestMapping(value = "/logout", method = { RequestMethod.GET, RequestMethod.POST })	public String logout(HttpSession session)throws IOException {			
			
			System.out.println("여기는 logout");			
			
			session.invalidate(); 	        			
			
			return "redirect:/";		
			}	
		

}