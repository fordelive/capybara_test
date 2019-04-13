def tc_01 # User can open login page via menu
  prepare_browser

  @session.click_link 'Login'
  sleep(CLICK_TIMEOUT)

  if @session.has_xpath?("//h3[contains(text(),'Login form')]")
    write_result(__method__, :passed)
  else
    write_result(__method__, :failed)
  end

  @session.quit
end