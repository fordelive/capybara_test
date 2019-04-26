Dir.glob("spec/steps/*_steps.rb") { |f| load f, true }

require_relative '../classes/../classes/web_page'
require_relative '../classes/home_page'
# Dir['../classes/*.rb'].sort.reverse!.each {|f| require_relative f}