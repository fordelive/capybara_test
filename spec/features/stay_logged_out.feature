Feature: Stay logged out
  Scenario:
    Given I am logged in
    When  I log out
    And   I reopen browser and open Homepage
    Then  I showld be logged out