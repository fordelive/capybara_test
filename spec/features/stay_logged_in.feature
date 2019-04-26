Feature: Stay logged in
  Scenario:
    Given I am logged in
    When  I reopen browser and open Homepage
    Then  Login should be successful