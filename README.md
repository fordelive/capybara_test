# capybara_test

Cucumber/Capybara DSL/SitePrism based test suite for testing https://demoapp.strongqa.com/

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

`$ rake features`

To abort execution press `Ctrl+C`

### Prerequisites

```
Ruby 2.6.0
capybara 3.15.0
dotenv 2.7.2
rake 12.3.2'
selenium-webdriver 3.141.0
site_prism 3.1
```

### Installing

Use 'bundler' to install needed libraries: 
`$ bundle install`