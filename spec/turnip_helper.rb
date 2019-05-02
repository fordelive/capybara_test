# frozen_string_literal: true

Dir.glob('spec/steps/*_steps.rb') { |f| load f, true }

require_relative '../classes/web_page'
require_relative '../classes/home_page'
require_relative '../classes/login_page'

require_relative 'steps/shared_steps'

CORRECT_LOGIN = ENV.fetch('LOGIN')
CORRECT_PASSWORD = ENV.fetch('PASSWORD')

INCORRECT_LOGIN = 'blabla@mail.net'
INCORRECT_PASSWORD = '123456'