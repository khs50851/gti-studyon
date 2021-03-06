package com.studyon.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.studyon.domain.So_MemberVO;
import com.studyon.persistence.So_MemberMapper;

import lombok.Setter;

@Service
public class MailSendServiceImpl implements MailSendService {
private static final Logger log = LoggerFactory.getLogger(MailSendServiceImpl.class);
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Setter(onMethod_=@Autowired)
	private So_MemberMapper mapper;
	
	@Override
	public String init() {
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;

		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	
	// 난수를 이용한 키 생성
		private boolean lowerCheck;
		private int size;
	
	@Override
	public String getKey(boolean lowerCheck, int size) {
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}
	
	@Override
	public void mailSendWithUserKey(String e_mail, String mem_id, HttpServletRequest request) {
		String key = getKey(false, 20);
		mapper.GetKey(mem_id,key); 
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 StudyOn 입니다!</h2><br><br>" 
				+ "<h3>" + mem_id + "님</h3>" + "<p>인증하기 버튼을 누르시면 로그인을 하실 수 있습니다 : " 
				+ "<a href='http://localhost:8090" + request.getContextPath() + "/SoMember/key_alter?mem_id="+ mem_id +"&user_key="+key+"'>인증하기</a></p>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[본인인증] StudyOn님의 인증메일입니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(e_mail));
			mailSender.send(mail);
		} catch (MessagingException e) {
			e.printStackTrace();
		}

	}
	
	@Override
	public void mailSendWithPassword(String e_mail, String mem_id, HttpServletRequest request) {

		// 비밀번호는 6자리로 보내고 데이터베이스 비밀번호를 바꿔준다
				String key = getKey(false, 6);
				
				// 회원 이름 꺼내는 코드
				So_MemberVO vo = mapper.So_Memname(mem_id);
				String name = vo.getMem_name();
						
				MimeMessage mail = mailSender.createMimeMessage();
				String htmlStr = "<h2>안녕하세요 '"+ name +"' 님</h2><br><br>" 
						+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
						+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + key +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
						+ "<a href='http://localhost:8090" + request.getContextPath() + "/SoMain/index'>홈페이지 접속</a></p>"
						+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
				try {
					mail.setSubject("[StudyOn] 임시 비밀번호가 발급되었습니다", "utf-8");
					mail.setText(htmlStr, "utf-8", "html");
					mail.addRecipient(RecipientType.TO, new InternetAddress(e_mail));
					mailSender.send(mail);
				} catch (MessagingException e) { 
					e.printStackTrace();
				}
				// 데이터 베이스 값은  저장시킨다.
				mapper.searchPassword(mem_id, e_mail, key);

		
		
	}
	
	
	
	@Override
	public int alter_userKey(String mem_id, String key) {
		int resultCnt = 0;
		resultCnt = mapper.alter_userKey(mem_id, key);
		return resultCnt;

	}
	
	
	
}
