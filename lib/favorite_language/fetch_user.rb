require "octokit"

module FavoriteLanguage
  class FetchUser
    #make user request for github name
    #parse request to check num of repos
    #parse request to check size of repos
    #calculate fav lang from most num of repos
    #fallback to size of repos if more then one is fav
    attr_reader :user_name

    def initialize(user_name)
      @user_name = user_name
    end

    def language
      repos
    end

    private

    def repos
      Octokit::Client.new.repositories(user_name)
    end
  end
end
