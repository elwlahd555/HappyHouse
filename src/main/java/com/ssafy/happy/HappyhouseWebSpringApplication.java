package com.ssafy.happy;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(basePackages ="com.ssafy.happy.repository.mapper")
public class HappyhouseWebSpringApplication {

	public static void main(String[] args) {
		SpringApplication.run(HappyhouseWebSpringApplication.class, args);
	}
}