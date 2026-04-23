Feature: Auth smoke tests
  Background: 
    * url baseUrl

  Scenario: Valid login should return token information
    Given path 'auth', 'login'
    And request
      """
      {
        "username": "emilys",
        "password": "emilyspass",
        "expriesInMins": 30
      }
      """
    When method post
    Then status 200
    And match response.id == '#number'
    And match response.username == 'emilys'
    And match response.accessToken == '#string'
    And match response.refreshToken == '#string'