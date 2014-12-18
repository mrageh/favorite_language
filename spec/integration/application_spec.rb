require "spec_helper"
require "favorite_language"

describe FavoriteLanguage::Application do
  context "when a valid github user_name is supplied"
    context "user has many repos"
      it "returns that users fav lang"
    context "user has no repos"
      it "returns that user as a enterprise programmer"

  context "when a invalid github user_name is supplied"
    it "informs that user was not found"

  context "when github api is hit too many times"
    it "tells user to chill"
end
