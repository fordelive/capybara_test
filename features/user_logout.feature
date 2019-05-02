Feature: User logout
  Scenario: User is not logged in automatically after logout
    Given User visits Login page
    And   User logs in with correct login and correct password and checked remember me checkbox
    And   User logs out
    When  User reopens browser and opens Homepage
    Then  User should be logged out