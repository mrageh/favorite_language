$:.unshift File.expand_path('../lib', __FILE__)

require "rspec"
require "webmock/rspec"
require "octokit"
require "rack/test"
require "pry"

RSpec.configure do |config|
  config.include WebMock::API
  config.include Rack::Test::Methods
end
