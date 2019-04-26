Feature: User login
  Scenario Outline:
    Given I visit Login page
    When  I log in with <login> and <password> and <remember>
    Then  Login should be <state>

  Examples:
    | login                 | password  | remember | state      |
    | 'vlashk@ukr.net'      | zzzxxx123 | false    | successful |
    | 'vlashk@ukr.net'      | zzzxxx123 | true     | successful |
    | ''                    | zzzxxx123 | false    | failed     |
    | 'vlashk@ukr.net'      | ''        | false    | failed     |
    | ''                    | ''        | false    | failed     |
    | 'vlashk@ukr.net'      | hjgkyubkj | false    | failed     |
    | 'test@mail.net'       | zzzxxx123 | false    | failed     |
    | 'test@mail.net'       | qwertqwer | false    | failed     |
