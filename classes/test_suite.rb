class TestSuite
  USER_LOGIN = ENV.fetch('LOGIN')
  USER_PASSWORD = ENV.fetch('PASSWORD')

  INCORRECT_LOGIN = 'blabla@mail.net'
  INCORRECT_PASSWORD = '123456'



  NOT_SIGNED_CONDITION = "//a[contains(text(),'Login')]"
  SIGNEDIN_CONDITION = "//a[contains(text(),'Logout')]"

  CANNOT_LOGIN_COND1 = "//span[@id='flash_alert']"
  CANNOT_LOGIN_COND2 = "//span[@id='flash_alert']"

  def test_case_01
    TestCase_1.tc_01
  end
end