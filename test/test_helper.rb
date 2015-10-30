$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bugsnag-error-users/fetcher'

require 'minitest/autorun'
require "mocha/setup"
require 'bugsnag/api'
