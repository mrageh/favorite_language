require "spec_helper"
require "favorite_language"

describe FavoriteLanguage::FetchUser do
  describe "#lanuage" do
    context "username exists" do
      context "user has repos" do
        it "returns that users favorite programming language" do
          stub_request_adam
          language = described_class.new("Adam89").language

          expect(language).to eq "Adam89's favorite programming language is ruby"
        end
      end
    end

    context "Invalid username" do

    end
  end
end

