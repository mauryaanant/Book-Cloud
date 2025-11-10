package com.piyush.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class MySecurityConfig {
	
	@Bean
	BCryptPasswordEncoder getpasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	  @Bean
	    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		   http
	        .csrf(csrf -> csrf.disable())
	        .authorizeHttpRequests(auth -> auth
	            .anyRequest().permitAll() // ✅ Permit ALL URLs
	        )
	            .oauth2Login(oauth2 -> oauth2
	            		.loginPage("/Userlogin") // custom login page
	            		 .defaultSuccessUrl("/oauth2success", true)
	            )
	            .logout(logout -> logout
	                    .logoutUrl("/logout")
	                    .logoutSuccessUrl("/Userlogin")
	                    .permitAll()
	                );
	        return http.build();
	    }
	}

