require "spec_helper"
require "favorite_language"

describe FavoriteLanguage::FetchUser do
  describe "#lanuage" do
    let(:user_name) { "Adam89" }
    let(:fetch_user) { described_class.new(user_name) }
    let(:expected) { "#{user_name}'s favorite programming language is Ruby" }

    context "when a valid github user_name is supplied" do
      context "user has many repos" do
        it "returns that users favorite programming language" do
          stub_request_adam

          expect(fetch_user.language).to eq expected
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

    context "when a invalid github user_name is supplied" do
      let(:user_name) { "non_existant" }
      let(:expected) { "#{user_name} not found" }

      it "informs that user was not found" do
        stub_request_non_existant_user

        expect(fetch_user.language).to eq expected
      end
    end
  end
end

