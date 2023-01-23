# SpringBoot & MyBatis & Liquibase & Testcontainers

This is an example of Spring Boot application that uses:

* MyBatis as a persistence framework.
* Liquibase as a database change tracking tool.
* Testcontainers for database integration tests.

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

## Stack

* Spring Boot
* [MyBatis](https://mybatis.org/mybatis-3/) 
* [Testcontainers](https://www.testcontainers.org/)
* Maven
* PostgreSQL
* [Liquibase](https://www.liquibase.org/)

