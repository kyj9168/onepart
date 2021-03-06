package com.kh.onepart.resident.mypage.modify_information.controller;

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
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.onepart.account.model.service.AccountService;
import com.kh.onepart.account.model.vo.ResidentVO;
import com.kh.onepart.resident.superintend_vote.model.service.SuperintendVoteService;

@Controller
	public class ModifyInformationController {
	@Autowired
	private AccountService accountService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	@Autowired
	private DataSourceTransactionManager transactionManager;


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

	//?????? ??????????????????
	@RequestMapping("/resident/menuModifyInformation")
	public String menuModifyInformation() {
		System.out.println("/resident/menuModifyInformation");
		return "/resident/my_page/modify_information/modifyInformation";
	}

	//???????????????????????? ???????????? ???????????? ?????????
	@RequestMapping("/resident/setNewPwd2")
	public ModelAndView setNewPwd(ModelAndView mv, HttpSession session, String residentId, String oldResidentPwd, String residentPwd) {
		System.out.println("oldResidentPwd ::C:: " + oldResidentPwd);

		String encPassword = passwordEncoder.encode(residentPwd);
		System.out.println("residentPwd through encPassword ::C:: " + encPassword);

		System.out.println("residentId ::C:: " + residentId);
		ResidentVO requestResidentVO = (ResidentVO) session.getAttribute("loginUser");
		requestResidentVO.setResidentId(residentId);
		requestResidentVO.setResidentPwd(encPassword);

		int result = accountService.setNewPwd2(oldResidentPwd, requestResidentVO);
		System.out.println("result in ctr : " + result);

		if(result > 0) {
			mv.addObject("result", result);
			mv.setViewName("jsonView");
		}else {
			System.out.println("???????????? ????????? ??????");
			mv.addObject("result", result);
			mv.setViewName("jsonView");
//			mv.addObject("msg", "???????????? ????????? ??????");
//			mv.setViewName("common/errorPage");

		}
		return mv;
	}


	//????????? ???????????? ??????
		@RequestMapping("/resident/moveSmssendInResident")
		public ModelAndView phoneMe(ModelAndView mv , HttpServletRequest request) throws IOException, Exception {


		      String msg2 = "";

		       String  action  = nullcheck(request.getParameter("action"), "");

		       String msgRnd = request.getParameter("msg");
		       msg2 = "????????? ?????? ?????? ?????????. " + msgRnd;

		       System.out.println("msg :::" + msg2);

		       if(action.equals("go")) {


		           String sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS ???????????? URL
		           String user_id = base64Encode("ho6132"); // SMS?????????
		           String secure = base64Encode("b8757f7462341bd8911014e4557741b9");//?????????
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

		           // ????????? ?????? ?????? ??????
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

		           // ?????? ??????
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
		           // ?????? ??????
		           BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), "UTF-8"));
		           wr.write("POST "+path+" HTTP/1.0\r\n");
		           wr.write("Content-Length: "+data.length()+"\r\n");
		           wr.write("Content-type: multipart/form-data, boundary="+boundary+"\r\n");
		           wr.write("\r\n");

		           // ????????? ??????
		           wr.write(data);
		           wr.flush();

		           // ????????? ??????
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
		           String Result= rMsg[0]; //????????????
		           String Count= ""; //????????????
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

		      System.out.println("??????????????? mv ??? : " + mv);
		      return mv;
		   }


		//???????????????????????? ?????????????????? ???????????? ?????????
		@RequestMapping("/resident/setNewHP")
		public ModelAndView setNewHP(ModelAndView mv, HttpSession session, String residentId, String residentPhone) {
			System.out.println("residentId ::C:: " + residentId);
			System.out.println("residentPhone ::C:: " + residentPhone);

			ResidentVO requestResidentVO = (ResidentVO) session.getAttribute("loginUser");
			requestResidentVO.setResidentId(residentId);
			requestResidentVO.setResidentPhone(residentPhone);

			int result = accountService.setNewHP(requestResidentVO);
			System.out.println("result in ctr : " + result);

			if(result > 0) {
				mv.addObject("result", result);
				mv.addObject("residentPhone", residentPhone);
				mv.setViewName("jsonView");
			}else {
				System.out.println("??????????????? ?????? ??????");
				mv.addObject("result", result);
				mv.setViewName("jsonView");
			}
			return mv;
		}


		//????????? ??????
		@RequestMapping("/resident/emailSend2")
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
		//??????????????? ???????????? ?????????
			public static void sendEmail(String rEmail, String authNum) {
			String host = "smtp.naver.com"; // ???????????? ?????? ????????? ??????, gmail?????? gmail ??????
			String subject = "????????? ???????????? ??????";
			String fromName = "????????? ?????????";	//????????? ?????? ??????
			String from = "onepart@naver.com"; // ????????????
			String to1 = rEmail; //?????? ?????? ?????? ??????

			String password = "ghkdwlswn";      // SMTP ?????? ????????? ????????????.

			String content = "???????????? [" + authNum + "]"; //????????? ??????


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
				msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B"))); //????????? ?????? ??????
//				msg.addRecipient(Message.RecipientType.TO, new InternetAddress("ktko@ktko.com"));
				InternetAddress[] address1 = { new InternetAddress(to1)};
				msg.setRecipients(Message.RecipientType.TO, address1); //???????????? ??????1
				msg.setSubject(subject); // ?????? ??????
				msg.setSentDate(new java.util.Date()); //????????? ?????? ??????
				msg.setContent(content, "text/html;charset=euc-kr"); //?????? ??????(HTML ??????)
//				msg.setText("??????????????? " );

				// send the message
				Transport.send(msg);
				System.out.println("Success Message Send");

			} catch (MessagingException | UnsupportedEncodingException e) {
				e.printStackTrace();
				}
			}

			//?????? ??????????????? ?????????
			public String RandomNum() {
				StringBuffer buffer = new StringBuffer();
				for(int i = 0; i <= 5; i++) {
					int n = (int) (Math.random() * 10);
					buffer.append(n);
				}
				return buffer.toString();
			}

		//???????????????????????? ??????????????? ???????????? ?????????
		@RequestMapping("/resident/setNewEmail")
		public ModelAndView setNewEmail(ModelAndView mv, HttpSession session, String residentId, String residentEmail) {
			System.out.println("residentId ::C:: " + residentId);
			System.out.println("residentPhone ::C:: " + residentEmail);

			ResidentVO requestResidentVO = (ResidentVO) session.getAttribute("loginUser");
			requestResidentVO.setResidentId(residentId);
			requestResidentVO.setResidentEmail(residentEmail);

			int result = accountService.setNewEmail(requestResidentVO);
			System.out.println("result in ctr : " + result);

			if(result > 0) {
				mv.addObject("result", result);
				mv.addObject("residentEmail", residentEmail);
				mv.setViewName("jsonView");
			}else {
				System.out.println("????????? ?????? ?????? ??????");
				mv.addObject("result", result);
				mv.setViewName("jsonView");
			}
			return mv;
		}


}
