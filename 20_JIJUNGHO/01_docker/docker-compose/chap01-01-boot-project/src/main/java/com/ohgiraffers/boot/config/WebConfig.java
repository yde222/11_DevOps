package com.ohgiraffers.boot.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.rmi.registry.Registry;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        registry.addMapping("/**")
                // next.js에 설정된 3000번 포트에서 오는건 cors 설정 해제
//                .allowedOrigins("http://localhost:3000")
                // NodePort에 설정된 30000번 포트에서 오는 연결에 대한 CQRS 설정 해제
                .allowedOrigins("http://localhost:30000")
                .allowedOrigins("") // Ingress설정으로 내부적으로 통신이 수행이되므로 CORS 설정없어도 통신 가능
                .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS", "FETCH");

    }
}
