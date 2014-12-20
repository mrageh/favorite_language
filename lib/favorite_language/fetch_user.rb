require "octokit"
require "json"

module FavoriteLanguage
  class FetchUser
    attr_reader :user_name

    def initialize(user_name)
      @user_name = user_name
    end

    def language
      fav_lang_text
    end

    private

    def repos
      JSON.parse(Octokit::Client.new.repositories(user_name))
    end

    def num_of_repos_per_language
      repos.each_with_object(Hash.new(0)) do |repo, acc|
        acc[repo["language"]] += 1
      end
    end

    def favorite_language
      max = num_of_repos_per_language.values.max
      num_of_repos_per_language.select do |lang, num|
        num == max
      end.keys.first
    end

    def fav_lang_text
      pluralized_user_name = [user_name, "'s"].join
      [pluralized_user_name, "favorite programming language is", favorite_language].join(' ')
    end
  end
end
