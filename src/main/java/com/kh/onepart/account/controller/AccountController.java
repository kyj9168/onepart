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
//μλ μΈμ λ±λ‘ μ΄λΈνμ΄μ
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
	 * λ‘κ·ΈμΈ νμ΄μ§ μ΄λ
	 * @return
	 */
	@RequestMapping("/moveAccount")
	public String moveAccountPage(HttpServletRequest request) {
		System.out.println("in account");
		System.out.println("after : " + request.getSession().getAttribute("loginUser"));

		return "account/login";
	}
	/**
	 * λ‘κ·ΈμΈ μμ²­ κ³μ  νμΈ λ° λ‘κ·ΈμΈ
	 * @param requestResidentVO
	 * @return
	 */
	//μ΄λ λ‘κ·ΈμΈ νλ©΄
	@RequestMapping("/moveLogin")
	public String moveLogin() {
		System.out.println("in moveLogin");
		return "account/login";
	}
	//μ΄λ νμκ°μ νλ©΄
	@RequestMapping("/moveRegister")
	public String moveRegister() {
		System.out.println("in moveRegister");
		return "account/register";
	}
	//μ΄λ μμ΄λμ°ΎκΈ° νλ©΄
	@RequestMapping("/moveFindId")
	public String moveFindId() {
		System.out.println("in moveFindId");
		return "account/findId";
	}
	//μ΄λ λΉλ°λ²νΈ μ°ΎκΈ° νλ©΄
	@RequestMapping("/moveFindPwd")
	public String moveFindPwd() {
		System.out.println("in moveFindPwd");
		return "account/findPwd";
	}
	//μ΄λ κ΄λ¦¬μ λ‘κ·Έ νλ©΄
	@RequestMapping("/moveManagerAccount")
	public String moveManagerAccount(HttpServletRequest request) {
		System.out.println("in moveManagerAccount");
		System.out.println("after : " + request.getSession().getAttribute("managerLoginUser"));
		return "account/managerLogin";
	}

//	//λ‘κ·ΈμΈμ© λ©μλ
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


	//λ‘κ·ΈμΈμ© λ©μλ
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
			System.out.println("μμ΄λλ λΉλ°λ²νΈκ° λ§μ§ μμ΅λλ€. λ€μ μλν΄μ£ΌμΈμ");
			mv.addObject("msg", "μμ΄λλ λΉλ°λ²νΈκ° λ§μ§ μμ΅λλ€. λ€μ μλν΄μ£ΌμΈμ.");
			mv.setViewName("jsonView");
		}
		return mv;
	}


	//λ‘κ·Έμμ
	@RequestMapping("/logout")
	public String logout(SessionStatus status, HttpSession session) {
		System.out.println("in resident");
		//System.out.println("before : " + request.getSession().getAttribute("loginUser"));
		session.invalidate();
		status.setComplete();

		return "redirect:resident/main";
	}

//	//κ΄λ¦¬μ λ‘κ·ΈμΈμ© λ©μλ
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

	//κ΄λ¦¬μ λ‘κ·ΈμΈμ© λ©μλ
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
			System.out.println("μμ΄λλ λΉλ°λ²νΈκ° λ§μ§ μμ΅λλ€. λ€μ μλν΄μ£ΌμΈμ");
			mv.addObject("msg", "μμ΄λλ λΉλ°λ²νΈκ° λ§μ§ μμ΅λλ€. λ€μ μλν΄μ£ΌμΈμ.");
			mv.setViewName("jsonView");
		}
		return mv;
	}


//	//κ΄λ¦¬μ λ‘κ·Έμμ
//	@RequestMapping("/managerLogout")
//	public String managerLogout(SessionStatus status) {
//		System.out.println("in managerLogout");
//		//System.out.println("before : " + request.getSession().getAttribute("loginUser"));
//		status.setComplete();
//
//		return "redirect:manager/main";
//	}

	//κ΄λ¦¬μ λ‘κ·Έμμ
	@RequestMapping("/mLogout")
	public String mLogout(SessionStatus status, HttpSession session) {
		System.out.println("in resident");
		//System.out.println("before : " + request.getSession().getAttribute("loginUser"));
		session.invalidate();
		status.setComplete();

		return "redirect:manager/main";
	}
	//νμ κ°μμ© λ©μλ
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
			model.addAttribute("msg", "νμ κ°μ μ€ν¨!");
			return "common/errorPage";
		}
	}

	//μμ΄λ μ°ΎκΈ°μ© λ©μλ
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

	//λΉλ°λ²νΈ μ°ΎκΈ°μ© μ λ³΄μ‘°ν λ©μλ
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
			System.out.println("μμ΄λμμ!");
			mv.setViewName("common/errorPage");
		}

		return mv;
	}

	//λΉλ°λ²νΈ μ¬μ€μ μ© λ©μλ
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
			System.out.println("λΉλ°λ²νΈ μ¬μ€μ  μ€λ₯");
			mv.addObject("msg", "λΉλ°λ²νΈ μ¬μ€μ  μ€λ₯");
			mv.setViewName("common/errorPage");

		}
		return mv;
	}


	//μννΈ λμ λ°λ₯Έ νΈμ μλ νΈνμΌλ‘ λΆλ¬μ€λ λ©μλ
	@RequestMapping("/resident/changeBdNm2")
	public ModelAndView changeBdNm(ModelAndView mv, HttpServletRequest request) {
		System.out.println("/resident/changeBdNm2");
		int bdNm = Integer.parseInt(request.getParameter("bdNm"));
		System.out.println("controller bdNm : " + bdNm);

		//ν΄λΉ μ νλμ ν¬ν¨λ νΈ λ¦¬μ€νΈ λΆλ¬μ€λ λ©μλ
		ArrayList hoList = svs.selectAllHoList(bdNm);

		mv.addObject("hoList", hoList);
		mv.setViewName("jsonView");

		return mv;
	}

	//μμ΄λ μ€λ³΅ μ²΄ν¬
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

	//ν΄λν° μΈμ¦λ²νΈ μ²΄ν¬
	@RequestMapping("/moveSmssend")
	public ModelAndView phoneMe(ModelAndView mv , HttpServletRequest request) throws IOException, Exception {


	      String msg2 = "";

	       String  action  = nullcheck(request.getParameter("action"), "");

	       String msgRnd = request.getParameter("msg");
	       msg2 = "μννΈ μΈμ¦ λ²νΈ μλλ€. " + msgRnd;

	       System.out.println("msg :::" + msg2);

	       if(action.equals("go")) {


	           String sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS μ μ‘μμ²­ URL
	           String user_id = base64Encode("ho6132"); // SMSμμ΄λ
	           String secure = base64Encode("b8757f7462341bd8911014e4557741b9");//μΈμ¦ν€
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

	           // λ°μ΄ν° λ§΅ν λ³μ μ μ
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

	           // λ³Έλ¬Έ μμ±
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
	           // ν€λ μ μ‘
	           BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), "UTF-8"));
	           wr.write("POST "+path+" HTTP/1.0\r\n");
	           wr.write("Content-Length: "+data.length()+"\r\n");
	           wr.write("Content-type: multipart/form-data, boundary="+boundary+"\r\n");
	           wr.write("\r\n");

	           // λ°μ΄ν° μ μ‘
	           wr.write(data);
	           wr.flush();

	           // κ²°κ³Όκ° μ»κΈ°
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
	           String Result= rMsg[0]; //λ°μ‘κ²°κ³Ό
	           String Count= ""; //μμ¬κ±΄μ
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

	      System.out.println("λμ΄κ°κΈ°μ  mv κ° : " + mv);
	      return mv;
	   }



	//μ΄λ©μΌ μΈμ¦
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
	//λ€μ΄λ²μμ μΈμ¦λ©μΌ λ³΄λ΄κΈ°
		public static void sendEmail(String rEmail, String authNum) {
		String host = "smtp.naver.com"; // λ€μ΄λ²μΌ κ²½μ° λ€μ΄λ² κ³μ , gmailκ²½μ° gmail κ³μ 
		String subject = "μννΈ μΈμ¦λ²νΈ μ λ¬";
		String fromName = "μννΈ κ΄λ¦¬μ";	//λ³΄λ΄λ μ¬λ μ΄λ¦
		String from = "onepart@naver.com"; // ν¨μ€μλ
		String to1 = rEmail; //λ°λ μ¬λ λ©μΌ μ£Όμ

		String password = "ghkdwlswn";      // SMTP μλ² μ λ³΄λ₯Ό μ€μ νλ€.

		String content = "μΈμ¦λ²νΈ [" + authNum + "]"; //λ³΄λ΄λ λ΄μ©


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
			msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B"))); //λ³΄λ΄λ μ¬λ μ€μ 
//			msg.addRecipient(Message.RecipientType.TO, new InternetAddress("ktko@ktko.com"));
			InternetAddress[] address1 = { new InternetAddress(to1)};
			msg.setRecipients(Message.RecipientType.TO, address1); //λ°λμ¬λ μ€μ 1
			msg.setSubject(subject); // λ©μΌ μ λͺ©
			msg.setSentDate(new java.util.Date()); //λ³΄λ΄λ λ μ§ μ€μ 
			msg.setContent(content, "text/html;charset=euc-kr"); //λ΄μ© μ€μ (HTML νμ)
//			msg.setText("μΈμ¦λ²νΈλ " );

			// send the message
			Transport.send(msg);
			System.out.println("Success Message Send");

		} catch (MessagingException | UnsupportedEncodingException e) {
			e.printStackTrace();
			}
		}

		//λμ λ°μμν€λ λ©μλ
		public String RandomNum() {
			StringBuffer buffer = new StringBuffer();
			for(int i = 0; i <= 5; i++) {
				int n = (int) (Math.random() * 10);
				buffer.append(n);
			}
			return buffer.toString();
		}

}
