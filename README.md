# DummyJSON API Test Automation (Karate)

A simple API test automation project built with **Karate** and **Maven**, using the public DummyJSON service.

## Purpose

This repository demonstrates a basic but structured approach to API test automation:

* setting up a Karate-based test project from scratch
* writing executable API tests using Gherkin syntax
* validating API responses with clear assertions
* organizing tests into smoke and regression scopes

The goal is to reflect a practical, maintainable starting point rather than an over-engineered solution.

## Tech Stack

* Java 17
* Maven
* Karate DSL
* JUnit 5 (via Karate)

## Project Structure

```
src/test
├── java
│   └── runners
│       └── TestRunner.java
└── resources
    ├── karate-config.js
    └── features
        ├── smoke
        │   └── health-check.feature
        └── regression
```

## Configuration

Global configuration is defined in:

```
src/test/resources/karate-config.js
```

Example:

```js
function fn() {
  return {
    baseUrl: 'https://dummyjson.com'
  };
}
```

This allows all tests to use `baseUrl` without hardcoding URLs.

## Running Tests

Run all tests using Maven:

```bash
mvn test
```

Karate will automatically:

* locate feature files under `classpath:features`
* execute scenarios
* generate test reports under `target`

## Current Test Coverage

### Smoke Tests

* API availability check (`/test`)

  * verifies API responds successfully
  * validates basic response contract

## Example Test

```gherkin
Feature: Health check smoke test

  Scenario: API should be reachable
    Given url baseUrl
    And path 'test'
    When method get
    Then status 200
    And match response == { status: 'ok', method: 'GET' }
```

## Notes

* This project uses Karate's built-in assertion and HTTP capabilities (no external client needed)
* Tests are intentionally simple and readable
* Structure is prepared for scaling into a broader regression suite

## Next Steps

Planned extensions:

* product listing validation (`/products`)
* response schema checks
* negative scenarios
* parameterized tests
* tagging (smoke / regression separation)

---
