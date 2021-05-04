package com.kh.onepart.account.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.Socket;
import java.net.URL;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.security.auth.login.LoginException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.account.model.exception.ManagerLoginException;
import com.kh.onepart.account.model.exception.findIdException;
import com.kh.onepart.account.model.exception.findPwdException;
import com.kh.onepart.account.model.service.AccountService;
import com.kh.onepart.account.model.vo.ManagerVO;
import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.superintend_vote.model.service.SuperintendVoteService;

@Controller
//자동 세션 등록 어노테이션
@SessionAttributes("loginUser")
public class AccountController {

	 public static String nullcheck(String str,  String Defaultvalue ) throws Exception
     {
          String ReturnDefault = "" ;
          if (str == null)
          {
              ReturnDefault =  Defaultvalue ;
          }
          else if (str == "" )
         {
              ReturnDefault =  Defaultvalue ;
          }
          else
          {
                      ReturnDefault = str ;
          }
           return ReturnDefault ;
     }
     /**
     * BASE64 Encoder
     * @param str
     * @return
     */
    public static String base64Encode(String str)  throws java.io.IOException {
        sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
        byte[] strByte = str.getBytes();
        String result = encoder.encode(strByte);
        return result ;
    }

    /**
     * BASE64 Decoder
     * @param str
     * @return
     */
    public static String base64Decode(String str)  throws java.io.IOException {
        sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
        byte[] strByte = decoder.decodeBuffer(str);
        String result = new String(strByte);
        return result ;
    }

	@Autowired
	private AccountService accountService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private DataSourceTransactionManager transactionManager;
	@Autowired
	private SuperintendVoteService svs;

	/**
	 * 로그인 페이지 이동
	 * @return
	 */
	@RequestMapping("/moveAccount")
	public String moveAccountPage(HttpServletRequest request) {
		System.out.println("in account");
		System.out.println("after : " + request.getSession().getAttribute("loginUser"));

		return "account/login";
	}
	/**
	 * 로그인 요청 계정 확인 및 로그인
	 * @param requestResidentVO
	 * @return
	 */
	//이동 로그인 화면
	@RequestMapping("/moveLogin")
	public String moveLogin() {
		System.out.println("in moveLogin");
		return "account/login";
	}
	//이동 회원가입 화면
	@RequestMapping("/moveRegister")
	public String moveRegister() {
		System.out.println("in moveRegister");
		return "account/register";
	}
	//이동 아이디찾기 화면
	@RequestMapping("/moveFindId")
	public String moveFindId() {
		System.out.println("in moveFindId");
		return "account/findId";
	}
	//이동 비밀번호 찾기 화면
	@RequestMapping("/moveFindPwd")
	public String moveFindPwd() {
		System.out.println("in moveFindPwd");
		return "account/findPwd";
	}
	//이동 관리자 로그 화면
	@RequestMapping("/moveManagerAccount")
	public String moveManagerAccount(HttpServletRequest request) {
		System.out.println("in moveManagerAccount");
		System.out.println("after : " + request.getSession().getAttribute("managerLoginUser"));
		return "account/managerLogin";
	}

//	//로그인용 메소드
//	@RequestMapping(value="/loginCheck", method=RequestMethod.POST)
//	public String loginCheck(ResidentVO requestResidentVO, Model model) {
//		System.out.println("/loginCheck");
//		System.out.println("requestResidentVO ::C:: " + requestResidentVO);
//
//		try {
//			ResidentVO loginUser = accountService.loginCheck(requestResidentVO);
//			model.addAttribute("loginUser", loginUser);
//			System.out.println("loginUser ::C:: " + loginUser);
//			return "redirect:resident/main";
//		} catch (LoginException e) {
//			model.addAttribute("msg", e.getMessage());
//			return "common/errorPage";
//		}
//	}


	//로그인용 메소드
	@RequestMapping(value="/loginCheck", method=RequestMethod.POST)
	public ModelAndView loginCheck(ResidentVO requestResidentVO, ModelAndView mv, HttpSession session, String residentId, String residentPwd) {
		System.out.println("/loginCheck");
		requestResidentVO.setResidentId(residentId);
		requestResidentVO.setResidentPwd(residentPwd);
		System.out.println("requestResidentVO ::C:: " + requestResidentVO);

		try {
			ResidentVO loginUser = accountService.loginCheck(requestResidentVO);
			System.out.println("loginUser ::C:: " + loginUser);
			mv.addObject("loginUser", loginUser);
			mv.setViewName("redirect:resident/main");
		} catch (LoginException e) {
			System.out.println("아이디나 비밀번호가 맞지 않습니다. 다시 시도해주세요");
			mv.addObject("msg", "아이디나 비밀번호가 맞지 않습니다. 다시 시도해주세요.");
			mv.setViewName("jsonView");
		}
		return mv;
	}


	//로그아웃
	@RequestMapping("/logout")
	public String logout(SessionStatus status, HttpSession session) {
		System.out.println("in resident");
		//System.out.println("before : " + request.getSession().getAttribute("loginUser"));
		session.invalidate();
		status.setComplete();

		return "redirect:resident/main";
	}

//	//관리자 로그인용 메소드
//	@RequestMapping(value="/managerLoginCheck", method=RequestMethod.POST)
//	public String managerLoginCheck(ManagerVO requestManagerVO, Model model) {
//		System.out.println("/managerLoginCheck");
//		System.out.println("requestManagerVO ::C:: " + requestManagerVO);
//
//		try {
//			ManagerVO managerLoginUser = accountService.managerLoginCheck(requestManagerVO);
//			model.addAttribute("loginUser", managerLoginUser);
//			System.out.println("loginUser ::C:: " + managerLoginUser);
//			return "redirect:manager/main";
//		} catch (ManagerLoginException e) {
//			model.addAttribute("msg", e.getMessage());
//			return "common/errorPage";
//		}
//	}

	//관리자 로그인용 메소드
	@RequestMapping(value="/managerLoginCheck", method=RequestMethod.POST)
	public ModelAndView managerLoginCheck(ManagerVO requestManagerVO, ModelAndView mv, HttpSession session, String managerId, String managerPwd) {

		System.out.println("/managerLoginCheck");
		requestManagerVO.setManagerId(managerId);
		requestManagerVO.setManagerPwd(managerPwd);
		System.out.println("requestManagerVO ::C:: " + requestManagerVO);

		try {
			ManagerVO loginUser = accountService.managerLoginCheck(requestManagerVO);
			System.out.println("loginUser ::C:: " + loginUser);
			mv.addObject("loginUser", loginUser);
			mv.setViewName("redirect:manager/main");
		} catch (ManagerLoginException e) {
			System.out.println("아이디나 비밀번호가 맞지 않습니다. 다시 시도해주세요");
			mv.addObject("msg", "아이디나 비밀번호가 맞지 않습니다. 다시 시도해주세요.");
			mv.setViewName("jsonView");
		}
		return mv;
	}


//	//관리자 로그아웃
//	@RequestMapping("/managerLogout")
//	public String managerLogout(SessionStatus status) {
//		System.out.println("in managerLogout");
//		//System.out.println("before : " + request.getSession().getAttribute("loginUser"));
//		status.setComplete();
//
//		return "redirect:manager/main";
//	}

	//관리자 로그아웃
	@RequestMapping("/mLogout")
	public String mLogout(SessionStatus status, HttpSession session) {
		System.out.println("in resident");
		//System.out.println("before : " + request.getSession().getAttribute("loginUser"));
		session.invalidate();
		status.setComplete();

		return "redirect:manager/main";
	}
	//회원 가입용 메소드
	@RequestMapping("/register")
	public String register(ResidentVO requestResidentVO, Model model) {
		String encPassword = passwordEncoder.encode(requestResidentVO.getResidentPwd());
		System.out.println("encPassword ::C:: " + encPassword);
		requestResidentVO.setResidentPwd(encPassword);

		if(requestResidentVO.getResidentGender().equals("1") || requestResidentVO.getResidentGender().equals("3")) {
			requestResidentVO.setResidentGender("M");
		}else {
			requestResidentVO.setResidentGender("F");
		}
		System.out.println("requestResidentVO ::C:: " + requestResidentVO);
		int result = accountService.insertResident(requestResidentVO);
		System.out.println("result ::C:: " + result);

		if(result > 0) {
			return "redirect:moveAccount";
		}else {
			model.addAttribute("msg", "회원 가입 실패!");
			return "common/errorPage";
		}
	}

	//아이디 찾기용 메소드
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public ModelAndView findId(ResidentVO requestResidentVO, ModelAndView mv, HttpSession session) {
		System.out.println("/findId");
		System.out.println("requestResidentVO in Controller:::" + requestResidentVO);

		ResidentVO findId;
		try {
			findId = accountService.findId(requestResidentVO);
			System.out.println("findId in ctr: " + findId);
			if(findId != null) {
				mv.addObject("findId", findId);
				mv.setViewName("jsonView");
			}else {
				return null;
			}

		} catch (findIdException e) {
			mv.addObject("msg", e.getMessage());
			mv.setViewName("common/errorPage");
		}

		return mv;
	}

	//비밀번호 찾기용 정보조회 메소드
	@RequestMapping(value="/findPwd", method=RequestMethod.POST)
	public ModelAndView findPwd(ResidentVO requestResidentVO, ModelAndView mv, HttpSession session) {
		System.out.println("/findPwd");
		System.out.println("requestResidentVO in Controller:::" + requestResidentVO);

		ResidentVO findPwd;
		try {
			findPwd = accountService.findPwd(requestResidentVO);
			System.out.println("findPwd in ctr: " + findPwd);
			if(findPwd != null) {
				mv.addObject("findPwd", findPwd);
				mv.setViewName("jsonView");
			}else {
				mv.addObject("findPwd", findPwd);
				mv.setViewName("jsonView");
			}

		} catch (findPwdException e) {
			mv.addObject("msg", e.getMessage());
			System.out.println("아이디없음!");
			mv.setViewName("common/errorPage");
		}

		return mv;
	}

	//비밀번호 재설정용 메소드
	@RequestMapping("/setNewPwd")
	public ModelAndView setNewPwd(ResidentVO requestResidentVO, ModelAndView mv) {
		String encPassword = passwordEncoder.encode(requestResidentVO.getResidentPwd());
		System.out.println("encPassword in ctr: " + encPassword);
		requestResidentVO.setResidentPwd(encPassword);

		System.out.println("requestResidentVO in ctr : " + requestResidentVO);

		int result = accountService.setNewPwd(requestResidentVO);
		System.out.println("result in ctr : " + result);

		if(result > 0) {
			mv.addObject("result", result);
			mv.setViewName("jsonView");
		}else {
			System.out.println("비밀번호 재설정 오류");
			mv.addObject("msg", "비밀번호 재설정 오류");
			mv.setViewName("common/errorPage");

		}
		return mv;
	}


	//아파트 동에 따른 호수 셀렉트형으로 불러오는 메소드
	@RequestMapping("/resident/changeBdNm2")
	public ModelAndView changeBdNm(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/resident/changeBdNm2");
		int bdNm = Integer.parseInt(request.getParameter("bdNm"));
		System.out.println("controller bdNm : " + bdNm);

		//해당 선택동에 포함된 호 리스트 불러오는 메소드
		ArrayList hoList = svs.selectAllHoList(bdNm);

		mv.addObject("hoList", hoList);
		mv.setViewName("jsonView");

		return mv;
	}

	//아이디 중복 체크
	@RequestMapping("/resident/idcheck")
    public ModelAndView idcheck(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/resident/idcheck");
		String residentId = request.getParameter("residentId");
		System.out.println("residentId ::C:: " + residentId);
        int count = 0;
        count = accountService.idcheck(residentId);

        mv.addObject("cnt", count);
		mv.setViewName("jsonView");

        return mv;
    }

	//휴대폰 인증번호 체크
	@RequestMapping("/moveSmssend")
	public ModelAndView phoneMe(ModelAndView mv , HttpServletRequest request) throws IOException, Exception {


	      String msg2 = "";

	       String  action  = nullcheck(request.getParameter("action"), "");

	       String msgRnd = request.getParameter("msg");
	       msg2 = "원파트 인증 번호 입니다. " + msgRnd;

	       System.out.println("msg :::" + msg2);

	       if(action.equals("go")) {


	           String sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
	           String user_id = base64Encode("ho6132"); // SMS아이디
	           String secure = base64Encode("b8757f7462341bd8911014e4557741b9");//인증키
	           String msg = base64Encode(nullcheck(msg2 , ""));
	           String rphone = base64Encode(nullcheck(request.getParameter("rphone"), ""));
	           String sphone1 = base64Encode(nullcheck(request.getParameter("sphone1"), ""));
	           String sphone2 = base64Encode(nullcheck(request.getParameter("sphone2"), ""));
	           String sphone3 = base64Encode(nullcheck(request.getParameter("sphone3"), ""));
	           String rdate = base64Encode(nullcheck(request.getParameter("rdate"), ""));
	           String rtime = base64Encode(nullcheck(request.getParameter("rtime"), ""));
	           String mode = base64Encode("1");
	           String subject = "";

	           String testflag = base64Encode(nullcheck(request.getParameter("testflag"), ""));
	           String destination = base64Encode(nullcheck(request.getParameter("destination"), ""));
	           String repeatFlag = base64Encode(nullcheck(request.getParameter("repeatFlag"), ""));
	           String repeatNum = base64Encode(nullcheck(request.getParameter("repeatNum"), ""));
	           String repeatTime = base64Encode(nullcheck(request.getParameter("repeatTime"), ""));
	           String returnurl = nullcheck(request.getParameter("returnurl"), "");
	           String nointeractive = nullcheck(request.getParameter("nointeractive"), "");
	           String smsType = base64Encode(nullcheck(request.getParameter("smsType"), ""));

	           String[] host_info = sms_url.split("/");
	           String host = host_info[2];
	           String path = "/" + host_info[3];
	           int port = 80;

	           // 데이터 맵핑 변수 정의
	           String arrKey[]
	               = new String[] {"user_id","secure","msg", "rphone","sphone1","sphone2","sphone3","rdate","rtime"
	                           ,"mode","testflag","destination","repeatFlag","repeatNum", "repeatTime", "smsType", "subject"};
	           String valKey[]= new String[arrKey.length] ;
	           valKey[0] = user_id;
	           valKey[1] = secure;
	           valKey[2] = msg;
	           valKey[3] = rphone;
	           valKey[4] = sphone1;
	           valKey[5] = sphone2;
	           valKey[6] = sphone3;
	           valKey[7] = rdate;
	           valKey[8] = rtime;
	           valKey[9] = mode;
	           valKey[10] = testflag;
	           valKey[11] = destination;
	           valKey[12] = repeatFlag;
	           valKey[13] = repeatNum;
	           valKey[14] = repeatTime;
	           valKey[15] = smsType;
	           valKey[16] = subject;

	           String boundary = "";
	           Random rnd = new Random();
	           String rndKey = Integer.toString(rnd.nextInt(32000));
	           MessageDigest md = MessageDigest.getInstance("MD5");
	           byte[] bytData = rndKey.getBytes();
	           md.update(bytData);
	           byte[] digest = md.digest();
	           for(int i =0;i<digest.length;i++)
	           {
	               boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
	           }
	           boundary = "---------------------"+boundary.substring(0,11);

	           // 본문 생성
	           String data = "";
	           String index = "";
	           String value = "";
	           for (int i=0;i<arrKey.length; i++)
	           {
	               index =  arrKey[i];
	               value = valKey[i];
	               data +="--"+boundary+"\r\n";
	               data += "Content-Disposition: form-data; name=\""+index+"\"\r\n";
	               data += "\r\n"+value+"\r\n";
	               data +="--"+boundary+"\r\n";
	           }

	           //out.println(data);

	           InetAddress addr = InetAddress.getByName(host);
	           Socket socket = new Socket(host, port);
	           // 헤더 전송
	           BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), "UTF-8"));
	           wr.write("POST "+path+" HTTP/1.0\r\n");
	           wr.write("Content-Length: "+data.length()+"\r\n");
	           wr.write("Content-type: multipart/form-data, boundary="+boundary+"\r\n");
	           wr.write("\r\n");

	           // 데이터 전송
	           wr.write(data);
	           wr.flush();

	           // 결과값 얻기
	           BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(), "UTF-8"));
	           String line;
	           String alert = "";
	           ArrayList tmpArr = new ArrayList();
	           while ((line = rd.readLine()) != null) {
	               tmpArr.add(line);
	           }
	           wr.close();
	           rd.close();

	           String tmpMsg = (String)tmpArr.get(tmpArr.size()-1);
	           String[] rMsg = tmpMsg.split(",");
	           String Result= rMsg[0]; //발송결과
	           String Count= ""; //잔여건수
	           if(rMsg.length>1) {Count= rMsg[1]; }



	       }


	       try {
	              String apiUrl =  "https://sslsms.cafe24.com/smsSenderPhone.php";
	               String userAgent = "Mozilla/5.0";
	               String postParams = "userId=ho6132&passwd=b8757f7462341bd8911014e4557741b9";
	               URL obj = new URL(apiUrl);
	               HttpURLConnection con = (HttpURLConnection) obj.openConnection();
	               con.setRequestMethod("POST");
	               con.setRequestProperty("User-Agent", userAgent);

	               // For POST only - START
	               con.setDoOutput(true);
	               OutputStream os = con.getOutputStream();
	               os.write(postParams.getBytes());
	               os.flush();
	               os.close();
	               // For POST only - END

	               int responseCode = con.getResponseCode();

	               if (responseCode == HttpURLConnection.HTTP_OK) { //success
	                   BufferedReader in = new BufferedReader(new InputStreamReader(
	                           con.getInputStream()));
	                   String inputLine;
	                   StringBuffer buf = new StringBuffer();

	                   while ((inputLine = in.readLine()) != null) {
	                       buf.append(inputLine);
	                   }
	                   in.close();
	               } else {

	               }
	       } catch(IOException ex){

	       }

	      mv.addObject("msgRnd" , msgRnd);
	      mv.setViewName("jsonView");

	      System.out.println("넘어가기전 mv 값 : " + mv);
	      return mv;
	   }



	//이메일 인증
	@RequestMapping("/emailSend")
	public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception{
		String email = request.getParameter("rEmail");
		String authNum = "";

		authNum = RandomNum();

		sendEmail(email.toString(), authNum);

		ModelAndView mv = new ModelAndView();
		mv.addObject("email", email);
		mv.addObject("authNum", authNum);
		mv.setViewName("jsonView");

		return mv;

	}
	//네이버에서 인증메일 보내기
		public static void sendEmail(String rEmail, String authNum) {
		String host = "smtp.naver.com"; // 네이버일 경우 네이버 계정, gmail경우 gmail 계정
		String subject = "원파트 인증번호 전달";
		String fromName = "원파트 관리자";	//보내는 사람 이름
		String from = "onepart@naver.com"; // 패스워드
		String to1 = rEmail; //받는 사람 메일 주소

		String password = "ghkdwlswn";      // SMTP 서버 정보를 설정한다.

		String content = "인증번호 [" + authNum + "]"; //보내는 내용


		try {
			Properties props = new Properties();
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.host", host);
			props.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.port", 587);
			props.put("mail.smtp.user", from);
			props.put("mail.smtp.auth", "true");


			Session mailSession = Session.getDefaultInstance(props,
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(from, password);
					}
				});
			MimeMessage msg = new MimeMessage(mailSession);
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B"))); //보내는 사람 설정
//			msg.addRecipient(Message.RecipientType.TO, new InternetAddress("ktko@ktko.com"));
			InternetAddress[] address1 = { new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1); //받는사람 설정1
			msg.setSubject(subject); // 메일 제목
			msg.setSentDate(new java.util.Date()); //보내는 날짜 설정
			msg.setContent(content, "text/html;charset=euc-kr"); //내용 설정(HTML 형식)
//			msg.setText("인증번호는 " );

			// send the message
			Transport.send(msg);
			System.out.println("Success Message Send");

		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
			}
		}

		//난수 발생시키는 메소드
		public String RandomNum() {
			StringBuffer buffer = new StringBuffer();
			for(int i = 0; i <= 5; i++) {
				int n = (int) (Math.random() * 10);
				buffer.append(n);
			}
			return buffer.toString();
		}

}
