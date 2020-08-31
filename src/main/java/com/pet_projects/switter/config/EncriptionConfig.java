package com.pet_projects.switter.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.MessageDigestPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class EncriptionConfig {

    @Bean
    public PasswordEncoder getPasswordEncoder() {
        return new MessageDigestPasswordEncoder("MD5");
    }
}
