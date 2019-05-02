Feature: User login
  Scenario Outline: User logs in
    Given User visits Login page
    When  User logs in with <login> login and <password> password and <remember> remember me checkbox
    Then  Login should be <state>

  Examples:
    | login      | password  | remember   | state      |
    | correct    | correct   | unchecked  | successful |
    | correct    | correct   | checked    | successful |
    | empty      | correct   | unchecked  | failed     |
    | correct    | empty     | unchecked  | failed     |
    | empty      | empty     | unchecked  | failed     |
    | correct    | incorrect | unchecked  | failed     |
    | incorrect  | correct   | unchecked  | failed     |
    | incorrect  | incorrect | unchecked  | failed     |
