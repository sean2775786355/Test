package com.safewind.pms.util;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.mail.*;
import javax.mail.internet.*;
import javax.mail.util.ByteArrayDataSource;

import java.io.InputStream;
import java.util.Date;
import java.util.Properties;

import java.io.File;
import java.util.Properties;

import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import javax.mail.internet.MimeMessage;

/**
 * Created by lxy on 2017/4/19.
 */
public class EmaiUtil {

//    public static void sendMail(String subject, String toMail, String content )
//    {
//        JavaMailSenderImpl senderImpl = new JavaMailSenderImpl();
//
//        try {
//
//            // 建立邮件消息,发送简单邮件和html邮件的区别
//            MimeMessage mailMessage = senderImpl.createMimeMessage();
//            // 注意这里的boolean,等于真的时候才能嵌套图片，在构建MimeMessageHelper时候，所给定的值是true表示启用，
//            // multipart模式 为true时发送附件 可以设置html格式
//            MimeMessageHelper messageHelper = new MimeMessageHelper(mailMessage,
//                    true, "utf-8");
//
//            // 设置收件人，寄件人
//            messageHelper.setTo(toMail);
//
//            messageHelper.setSubject(subject);
//
//            messageHelper.setText(content);
//
//            FileSystemResource file = new FileSystemResource(
//                    new File("g:/test.rar"));
//            // 这里的方法调用和插入图片是不同的。
//            messageHelper.addAttachment("test.rar", file);
//
//            senderImpl.setUsername("username"); // 根据自己的情况,设置username
//            senderImpl.setPassword("password"); // 根据自己的情况, 设置password
//            Properties prop = new Properties();
//            prop.put("mail.smtp.auth", "true"); // 将这个参数设为true，让服务器进行认证,认证用户名和密码是否正确
//            prop.put("mail.smtp.timeout", "25000");
//            senderImpl.setJavaMailProperties(prop);
//            // 发送邮件
//            senderImpl.send(mailMessage);
//
//            System.out.println("邮件发送成功..");
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//    }






    /**
     *
     * 方法名: sendMail
     * 描述: 发送邮件
     * 创建人: lxy
     * 创建时间: 2017年4月19日 下午7:19:06
     * 版本号: v1.0
     * 抛出异常:
     * 参数: @param subject
     * 参数: @param toMail
     * 参数: @param content
     * 参数: @param files
     * 参数: @return
     * 返回类型: boolean
     */
    public static boolean sendMail(String subject, String toMail, String content, byte[] bytes) {
        boolean isFlag = false;
        try {
            String smtpFromMail = "pmsemail@163.com";  //账号
            String pwd = "pmspms123"; //密码
            int port = 25; //端口
            String host = "smtp.163.com"; //端口

            Properties props = new Properties();
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.auth", "true");
            Session session = Session.getDefaultInstance(props);
            session.setDebug(false);

            MimeMessage message = new MimeMessage(session);
            try {
                message.setFrom(new InternetAddress(smtpFromMail, "物料询价单"));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(toMail));
                message.setSubject(subject);
                message.addHeader("charset", "UTF-8");

                /*添加正文内容*/
                Multipart multipart = new MimeMultipart();
                BodyPart contentPart = new MimeBodyPart();
                contentPart.setText(content);

                contentPart.setHeader("Content-Type", "text/html; charset=UTF-8");
                multipart.addBodyPart(contentPart);

                /*添加附件*/
                MimeBodyPart fileBody = new MimeBodyPart();
                DataSource source = new ByteArrayDataSource(bytes, "application/msexcel");
                fileBody.setDataHandler(new DataHandler(source));
                String fileName  = "物料列表.xls";
                // 中文乱码问题
                fileBody.setFileName(MimeUtility.encodeText(fileName));
                multipart.addBodyPart(fileBody);

                message.setContent(multipart);
                message.setSentDate(new Date());
                message.saveChanges();
                Transport transport = session.getTransport("smtp");

                transport.connect(host, port, smtpFromMail, pwd);
                transport.sendMessage(message, message.getAllRecipients());
                transport.close();
                isFlag = true;
            } catch (Exception e) {
                e.printStackTrace();
                isFlag = false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(isFlag);
        return isFlag;
    }
}
