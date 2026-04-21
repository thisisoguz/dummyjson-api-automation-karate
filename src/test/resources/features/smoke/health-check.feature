Feature: Health check smoke test
  Scenario: API should be reachable
    Given url baseUrl
    And path 'test'
    When method get
    Then status 200
    And match response == {status: 'ok', method: 'GET'}