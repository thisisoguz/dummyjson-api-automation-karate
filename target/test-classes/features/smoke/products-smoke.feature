Feature: Products smoke tests
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

  Scenario: Product search should return filtered results
    Given path 'products/search'
    And param q = 'phone'
    When method get
    Then status 200

    And match response.products == '#[]'
    And assert response.products.length > 0

  Scenario: Product pagination should limit results
    Given path 'products'
    And param limit = 10
    When method get
    Then status 200

    And match response.limit == 10
    And match response.products == '#[10]'