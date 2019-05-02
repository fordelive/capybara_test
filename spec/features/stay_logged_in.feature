Feature: Staying logged in
  Scenario: User stays logged in
    Given User is logged in
    When  User reopens browser and opens Homepage
    Then  Login should be successful