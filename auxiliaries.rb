require 'rspec/expectations'
include RSpec::Matchers

def write_result(tc_name, result)
# variants of reporting strings:
# tc_01 (firefox): passed
# tc_01 (chrome): failed

  File.open(OUTPUT_FILE, 'a') {|f| f.puts"#{tc_name}: #{result}"}
end

def check_one_condition(tc_name, condition1)
  if @session.has_xpath?(condition1)
    write_result(tc_name, :passed)
  else
    write_result(tc_name, :failed)
  end
end

def check_two_conditions(tc_name, condition1, condition2)
  if @session.has_xpath?(condition1) && @session.has_xpath?(condition2)
    write_result(tc_name,:passed)
  else
    write_result(tc_name,:failed)
  end
end

def prepare_browser
  @home_page = Home.new
  @home_page.load
end

