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

        context "All of the repos have null programming language" do
          let(:expected) do
            "#{user_name} has no favorite programming languages?"
          end

          it "returns that user has no favorite programming language" do
            stub_request_null

            expect(fetch_user.language).to eq expected
          end
        end

        context "Multiple favorite languages" do
          let(:expected) do
            "#{user_name} is a polyglot favorite languages: JavaScript, Ruby"
          end

          it "returns all languages for polyglot" do
            stub_request_polyglot

            expect(fetch_user.language).to eq expected
          end
        end
      end

      context "user has no repos" do
        let(:expected) do
          "#{user_name} no repos in their profile maybe they are a recruiter"
        end

        it "returns that user as a recruiter" do
          stub_request_no_repos

          expect(fetch_user.language).to eq expected
        end
      end

      context "when github api is hit too many times" do
        let(:expected) do
          "You've made too many requests chill!!"
        end

        it "tells user to chill" do
          stub_request_api_limit

          expect(fetch_user.language).to eq expected
        end
      end
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

