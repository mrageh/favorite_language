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
  let(:app) { described_class.new.fetch(user_input) }
  let(:user_input) { capture_stdout { $stdout.puts "Adam89" } }

  context "when a valid github user_name is supplied" do
    context "user has many repos" do
      it "returns that users fav lang" do
        expect(app).to eq "Adam89's favorite language is Ruby"
      end
    end
  end

    context "user has no repos"
      it "returns that user as a enterprise programmer"

  context "when a invalid github user_name is supplied"
    it "informs that user was not found"

  context "when github api is hit too many times"
    it "tells user to chill"
end
