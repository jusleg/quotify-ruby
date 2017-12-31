require 'minitest/autorun'
require 'mocha/mini_test'

require 'simplecov'
SimpleCov.start if ENV['CODECOV_TOKEN']

require 'codecov' if ENV['CODECOV_TOKEN']
SimpleCov.formatter = SimpleCov::Formatter::Codecov
