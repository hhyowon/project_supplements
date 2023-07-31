package com.example.project_supplements.configs;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration {
    @Bean
        public SecurityFilterChain filterChain(HttpSecurity httpSecurity) throws Exception {
                // None using csrf protection
                httpSecurity.csrf().disable();
                // 권한에 대한 부분 : url & roles : user url & roles
                // url, roles from Dao
                httpSecurity.authorizeHttpRequests() // 로그인
                .requestMatchers("/manager*").hasAnyRole("ADMIN", "MANAGER")
                .requestMatchers("/admin*/*").hasRole("ADMIN")
                .requestMatchers("/main").authenticated() //로그인한 대상자
                .requestMatchers("/carInfor/map/*").hasRole("USER")
                        .anyRequest().permitAll() //그외 전체 대상
                ;
                httpSecurity.formLogin(login -> login.loginPage("/loginForm") //로그인 하지 않은 사람이 로그인한 후에 접근 가능한 페이지를 눌렀을때 로그인 폼을 띄어라
                                .failureUrl("/loginForm?fail=true") 
                                .loginProcessingUrl("/login") 
                                .defaultSuccessUrl("/")); //로그인 하고 나면 메인으로 간다
                httpSecurity.logout(logout -> logout
                                .logoutSuccessUrl("/home")
                                .invalidateHttpSession(true)
                                .deleteCookies("JSESSIONID"));

                return httpSecurity.build();
        }
                 @Bean
        public BCryptPasswordEncoder encoderPasswordEncoder() {
                return new BCryptPasswordEncoder();
        }       

}
