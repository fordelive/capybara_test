RESULT_FILE = 'results.txt'.freeze
LOG_FILE = 'general.log'
TIME_FORMAT = "%Y-%m-%d %H:%M:%S"

def handle_exception(method_name, exception)
  log_event method_name, exception.message
  log_event method_name, exception.backtrace.inspect
  puts exception.message
end

def log_event(method_name, message)
  # YYYY-MM-DD HH:MM:SS METHOD STRING
  File.open(LOG_FILE, 'a') {|f| f.puts "#{Time.now.strftime TIME_FORMAT} #{method_name}: #{message}"}
end

def write_result(method_name, result)
# variants of reporting strings:
# tc_01 (firefox): passed
# tc_01 (chrome): failed

  File.open(RESULT_FILE, 'a') {|f| f.puts "#{method_name}: #{result}"}
end

# def check_one_condition(page, condition1, method_name, log_msg)
#   begin
#     log_event method_name, log_msg
#
#     expect(page).to have_xpath(condition1)
#     write_result(method_name, :passed)
#
#     log_event method_name, 'Done'
#   rescue Exception => e
#     handle_exception e
#     write_result(method_name, :failed)
#   end
# end

def check_two_conditions(tc_name, condition1, condition2)
  if @session.has_xpath?(condition1) && @session.has_xpath?(condition2)
    write_result(tc_name,:passed)
  else
    write_result(tc_name,:failed)
  end
end

def evaluate_result(method_name, result)
  log_event __method__, 'Evaluating result'

  if result
    write_result method_name, :passed
  else
    write_result method_name, :failed
  end
end