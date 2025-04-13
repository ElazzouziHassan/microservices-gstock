# Spring Boot Microservices Project

A microservices-based application built with Spring Boot, consisting of three services: Customers, Products, and Orders. The services communicate with each other through RESTful APIs and are registered with a Eureka discovery server.

## Table of Contents

- [Overview](#overview)
- [Technologies](#technologies)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Setup and Installation](#setup-and-installation)
- [Running the Application](#running-the-application)
- [API Endpoints](#api-endpoints)
- [Database Schema](#database-schema)
- [Service Communication](#service-communication)

## Overview

This project demonstrates a microservices architecture with the following components:

- **Customer Service**: Manages customer information
- **Product Service**: Manages product catalog
- **Order Service**: Manages orders and order items
- **Eureka Server**: Service discovery for microservices

Each service has its own database and can be deployed and scaled independently.

## Technologies

- **Java 17**
- **Spring Boot 2.7.0**
- **Spring Cloud 2021.0.3**
- **Spring Data JPA**
- **PostgreSQL**
- **Netflix Eureka** for service discovery
- **Lombok** for reducing boilerplate code
- **Maven** for dependency management and build

## Project Structure

```
  microservices-parent/
  ├── pom.xml
  ├── customers/
  │   ├── pom.xml
  │   └── src/
  ├── products/
  │   ├── pom.xml
  │   └── src/
  ├── orders/
  │   ├── pom.xml
  │   └── src/
  └── eureka-server/
      ├── pom.xml
      └── src/
```

## Prerequisites

- Java 17 or higher
- Maven 3.6 or higher
- PostgreSQL 12 or higher
- Git (optional)

## Setup and Installation

### 1. Clone the repository (if using Git)

```bash
  git clone git@github.com:ElazzouziHassan/microservices-gstock.git
  cd microservices-gstock
```

### 2. Database Setup

Create three PostgreSQL databases:

```sql
  CREATE DATABASE customer_db;
  CREATE DATABASE product_db;
  CREATE DATABASE order_db;
```

Update the database credentials in each service's `application.yml` file if needed:

```yaml
  spring:
    datasource:
      username: <username>
      password: <password>
      url: jdbc:postgresql://localhost:5432/[database-name]
```

### 3. Build the project

```bash
  mvn clean install
```

## Running the Application

Start the services in the following order:

### 1. Start Eureka Server

```bash
  cd eureka-server
  mvn spring-boot:run
```

The Eureka dashboard will be available at: http://localhost:8761

### 2. Start the Microservices

Open new terminal windows for each service:

```bash
  # Customer Service
  cd customers
  mvn spring-boot:run

  # Product Service
  cd products
  mvn spring-boot:run

  # Order Service
  cd orders
  mvn spring-boot:run
```

## API Endpoints

### Customer Service (port 8081)

- **Create Customer**: POST `/api/v1/customers`
  ```json
    {
      "firstName": "Hassan",
      "lastName": "El azzouzi",
      "email": "elazzouzi.h@ucd.ma"
    }
  ```

- **Get All Customers**: GET `/api/v1/customers`
- **Get Customer by ID**: GET `/api/v1/customers/{id}`
- **Update Customer**: PUT `/api/v1/customers/{id}`
- **Delete Customer**: DELETE `/api/v1/customers/{id}`

### Product Service (port 8082)

- **Create Product**: POST `/api/v1/products`
  ```json
    {
      "name": "Product Name",
      "description": "Product Description"
    }
  ```

- **Get All Products**: GET `/api/v1/products`
- **Get Product by ID**: GET `/api/v1/products/{id}`
- **Update Product**: PUT `/api/v1/products/{id}`
- **Delete Product**: DELETE `/api/v1/products/{id}`

### Order Service (port 8083)

- **Create Order**: POST `/api/v1/orders`
  ```json
    {
      "customerId": 1,
      "orderItems": [
        {
          "productId": 1,
          "quantity": 2.0
        },
        {
          "productId": 2,
          "quantity": 1.0
        }
      ]
    }
  ```

- **Get All Orders**: GET `/api/v1/orders`
- **Get Order by ID**: GET `/api/v1/orders/{id}`
- **Update Order**: PUT `/api/v1/orders/{id}`
- **Delete Order**: DELETE `/api/v1/orders/{id}`

## Database Schema

### Customer Database
- **Customer Table**:
  - id (PK)
  - firstName
  - lastName
  - email

### Product Database
- **Product Table**:
  - id (PK)
  - name
  - description

### Order Database
- **Orders Table**:
  - id (PK)
  - customerId (FK to Customer)
  
- **Order_Items Table**:
  - id (PK)
  - order_id (FK to Order)
  - productId
  - quantity

## Service Communication

The services are designed to communicate with each other through REST APIs. In a production environment, you might want to implement:

- **API Gateway**: For routing and load balancing
- **Circuit Breaker**: For fault tolerance (e.g., using Resilience4j or Hystrix)
- **Config Server**: For centralized configuration

---

@all the best!
