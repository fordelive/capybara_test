Feature: User login
  Scenario Outline:
    Given I visit Login page
    When  I log in with <login> and <password> and <remember>
    Then  Login should be <state>

  Examples:
    | login      | password  | remember | state      |
    | correct    | correct   | false    | successful |
    | correct    | correct   | true     | successful |
    | empty      | correct   | false    | failed     |
    | correct    | empty     | false    | failed     |
    | empty      | empty     | false    | failed     |
    | correct    | incorrect | false    | failed     |
    | incorrect  | correct   | false    | failed     |
    | incorrect  | incorrect | false    | failed     |
