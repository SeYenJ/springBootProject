package com.example.service.Impl;

import com.example.vo.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

import java.text.DateFormat;
import java.text.FieldPosition;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

@Service
@EnableAsync
public class MailServiceImpl {
    private JavaMailSender mailSender;
    private static final String FROM_ADDRESS = "durupmailtester@gmail.com";
    private static final String WELCOME_TITLE = "WOORI COMMUNITY 가입을 축하드립니다";

    @Autowired
    public MailServiceImpl(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }

    @Async
    public void welcomeMailSend(MemberVO vo) {
        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(vo.getMember_email());
        message.setFrom(MailServiceImpl.FROM_ADDRESS);
        message.setSubject(MailServiceImpl.WELCOME_TITLE);

        // 현재 날짜/시간
        LocalDateTime now = LocalDateTime.now(); // 현재 날짜/시간 출력
        // 포맷팅
        String formatedNow = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
        // 포맷팅 현재 날짜/시간 출력
        System.out.println(formatedNow); // 2021년 12월 02일 18시 19분 36초


        String welcomeContent = vo.getMember_name() + "님 회원 가입을 축하드립니다\n" +
                "가입일자 : " + formatedNow;
        message.setText(welcomeContent);

        mailSender.send(message);
    }
}
