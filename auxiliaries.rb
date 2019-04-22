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

def evaluate_result(method_name, result)
  log_event __method__, 'Evaluating result'

  if result
    write_result method_name, :passed
    'PASSED'
  else
    write_result method_name, :failed
    'FAILED'
  end
end