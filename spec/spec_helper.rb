$:.unshift File.expand_path('../lib', __FILE__)

require "rspec"
require "webmock/rspec"
require "octokit"
require "rack/test"
require "pry"
require "support/helpers/github_api_helper.rb"

RSpec.configure do |config|
  config.include WebMock::API
  config.include Rack::Test::Methods
  config.include GithubApiHelper
  WebMock.disable_net_connect!(allow_localhost: true)
end
