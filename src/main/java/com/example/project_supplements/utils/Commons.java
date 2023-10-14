package com.example.project_supplements.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

@Configuration


public class Commons {
    public String generateUUID(){
        String uuid = UUID.randomUUID().toString();
        return uuid;
    }

    public String getGeneratorID() {
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyyhh:mm:ss");
        String strDate = formatter.format(date);
        return strDate;
    }

    public String getUserID(){
        // 현재 사용자 Authentication 객체 가져오기
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        String username = null;
        // 사용자가 인증되었는지 확인
        if (authentication.isAuthenticated()) {
            // Principal 객체에서 UserDetails 인터페이스를 구현한 사용자 정보 가져오기
            Object principal = authentication.getPrincipal();
            UserDetails userDetails = (principal instanceof UserDetails) ? (UserDetails) principal : null;

            if (userDetails != null) {
                // 사용자 이름 가져오기
                username = userDetails.getUsername();
                // authorities에서 권한 정보 가져오기
                // StringBuilder authorities = new StringBuilder();
                // for (GrantedAuthority grantedAuthority : authentication.getAuthorities()) {
                // authorities.append(grantedAuthority.getAuthority()).append(", ");
                // }
                String authorities = authentication.getAuthorities().toString();
            }
        }
        
        return username;

        }

}
