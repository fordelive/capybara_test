Feature: User auto login
  Scenario: User automatically is logged in
    Given User visits Login page
    And   User logs in with correct login and correct password and checked remember me checkbox
    When  User reopens browser and opens Homepage
    Then  Login should be successful