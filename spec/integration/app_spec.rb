require "spec_helper"
require "favorite_language"

def capture_stdout(&block)
  original_stdout = $stdout
  $stdout = fake = StringIO.new
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  fake.string
end

describe FavoriteLanguage::App do
  let(:user_name) { "Adam89" }
  let(:app) { described_class.new.fetch(user_input) }
  let(:user_input) { capture_stdout { $stdout.puts user_name } }

  it "returns github usernames favorite langugage" do
    stub_request_adam
#"Adam89's favorite programming language is Ruby"

    expect {app}.to output.to_stdout
  end
end
