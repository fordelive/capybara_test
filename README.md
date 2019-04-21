# capybara_test

Capybara/site-prism based test suite for testing https://demoapp.strongqa.com/

## Getting Started

To obtain the application:

`$ git clone https://github.com/fordelive/capybara_test.git`

or just download it from GitHub

To store credentials create file .env in the test_suites directory:

LOGIN="user@mail.net"

PASSWORD="userpassword"

To run the program step into the deployed 'capybara' directory issue the command:

`$ ruby main.rb`

To abort execution press `Ctrl+C`

The results of the tests execution can be found in `results.txt` which is created (recreated) during each program execution.


### Prerequisites

```
Ruby 2.6.0
capybara 3.15.0
dotenv 2.7.2
selenium-webdriver 3.141.0
site-prism 3.1
```

### Installing

Installation is not needed.