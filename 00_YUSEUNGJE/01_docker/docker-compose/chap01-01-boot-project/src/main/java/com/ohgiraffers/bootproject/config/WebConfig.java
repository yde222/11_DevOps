package com.ohgiraffers.bootproject.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                // next.js에 설정된 3000번 포트에서오는 건 cors설정 해제
//                .allowedOrigins("http://localhost:3000")
                // NodePort에 설정된 30000번 포트에서 오는 연결에 대한 CQRS설정 해제
                .allowedOrigins("http://localhost:30000")
                .allowedOrigins("") // Ingress설정으로 내부적으로 통신이 수행이되므로 CORS설정 없어도 통신가능
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS","FETCH");
    }
}
