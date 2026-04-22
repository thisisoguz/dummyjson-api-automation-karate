Feature: Products smoke test
  Background:
  * url baseUrl

  Scenario: Products list should return basic structure
    Given path "products"
    When method get
    Then status 200

    And match response.products == '#[]'
    And match response.total == '#number'
    And match response.skip == '#number'
    And match response.limit == '#number'

    And match response.products[0].id == '#number'
    And match response.products[0].title == '#string'
    And match response.products[0].price == '#number'