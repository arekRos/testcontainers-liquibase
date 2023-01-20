package pl.pretius.testcontainersliquibase;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan
public class TestcontainersLiquibaseApplication {

    public static void main(String[] args) {
        SpringApplication.run(TestcontainersLiquibaseApplication.class, args);
    }

}
