Feature: Staying logged out
  Scenario: User stays logged out after logout
    Given User is logged in
    When  User logs out
    And   User reopens browser and opens Homepage
    Then  User should be logged out