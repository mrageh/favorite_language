require "spec_helper"
require "favorite_language"

describe FavoriteLanguage::FetchUser do
  describe "#lanuage" do
    context "when a valid github user_name is supplied" do
      context "user has many repos" do
        it "returns that users favorite programming language" do
          stub_request_adam
          language = described_class.new("Adam89").language

          expect(language).to
            eq "Adam89's favorite programming language is ruby"
        end

        context "All of the repos do not have a programming language"
          it "returns that user has no favorite programming language"

        context "Two most popular repos have different programming languages"
          it "returns both languages for polyglot"
      end

      context "user has no repos"
        it "returns that user as a enterprise programmer"

      context "when github api is hit too many times"
        it "tells user to chill"
    end
  end

  context "when a invalid github user_name is supplied" do
    it "informs that user was not found"
  end
end

