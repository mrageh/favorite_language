require "spec_helper"
require "favorite_language"

def capture_stdout(&block)
  original_stdout = $stdout
  $stdout = StringIO.new
  begin
    yield
    result = $stdout.string
  ensure
    $stdout = original_stdout
  end
  result
end

describe FavoriteLanguage::App do
  let(:user_name) { "Adam89" }
  let(:user_input) { capture_stdout { puts user_name } }
  let(:app) { described_class.new.fetch(user_input) }

  it "returns github usernames favorite langugage" do
    stub_request_adam

    expected = "Adam89's favorite programming language is Ruby\n"
    expect { app }.to output(expected).to_stdout
  end
end
