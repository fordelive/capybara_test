# capybara_test

Capybara/rspec/turnip based test suite for testing https://demoapp.strongqa.com/

## Getting Started

To obtain the application:

`$ git clone https://github.com/fordelive/capybara_test.git`

or just download it from GitHub.

To store credentials create file .env in the test_suites directory:
```
LOGIN="user@mail.net"

PASSWORD="userpassword"
```
To run the program step into the deployed 'capybara' directory issue the command:

`$ rspec spec`

To abort execution press `Ctrl+C`

### Prerequisites

```
Ruby 2.6.0
capybara 3.15.0
dotenv 2.7.2
rspec 3.8.0
selenium-webdriver 3.141.0
turnip 4.0.1
```

### Installing

Use 'bundler' to install needed libraries: 
`$ bundle install`