# SpringBoot & MyBatis & Liquibase & Testcontainers
This is an example of Spring Boot application that uses:
* MyBatis as a persistence framework.
* Liquibase as a database change tracking tool.
* Testcontainers for database integration tests.

## Liquibase and Testcontainers

```
@ClassRule
public static PostgreSQLContainer postgreSQLContainer 
        = PostgreSQLContainer.getInstance();
```

Each instantiation of PostgreSQLContainer class, clears Test Database before performing the tests allowing SpringBoot to apply all Liquibase sql scripts. 

```            
Liquibase liquiBase = new Liquibase(CHANGELOG_FILE, resourceAccessor, db);
liquiBase.dropAll();
```

## Running Spring Boot Tests
```./mvnw tests```

## Running Spring Boot App
Prerequisites
* docker
* docker-compose

Launching local PostgreSQL

```docker-compose up -d```

Launching application

```./mvnw spring-boot:run```

## Tech Stack
* Spring Boot
* MyBatis
* Testcontainers
* Maven
* PostgreSQL

